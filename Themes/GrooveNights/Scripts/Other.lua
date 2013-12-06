-- Override these in other themes.
function Platform() return "generic" end
function IsHomeMode() return false end

function SelectButtonAvailable()
	return true
end

function GetWorkoutMenuCommand()
	GAMESTATE:SetTemporaryEventMode(true)
	return "difficulty," .. GetInitialDifficulty() .. ";screen,ScreenWorkoutMenu;PlayMode,regular;SetEnv,Workout,1"
end

function ScreenEndingGetDisplayName( pn )
	if PROFILEMAN:IsPersistentProfile(pn) then return GAMESTATE:GetPlayerDisplayName(pn) end
	return "No Card"
end

function GetCreditsText()
	local song = GAMESTATE:GetCurrentSong()
	if not song then return "" end
	
	local fulldir = song:GetSongDir();
	local short = string.sub(fulldir, 8, -2);
	local shorter = string.sub(short,1,5);
	if shorter == "n The" then
		short = "Memory Card"..string.sub(fulldir, 22, -2);
	end
	text = short
	
	return 
		song:GetDisplayFullTitle() .. "\n" ..
		song:GetDisplayArtist() .. "\n" ..
		text
end

function StopCourseEarly()
	-- Stop gameplay between songs in Fitess: Random Endless if all players have 
	-- completed their goals.
	if not GAMESTATE:GetEnv("Workout") then return "0" end
	if GAMESTATE:GetPlayMode() ~= PLAY_MODE_ENDLESS then return "0" end
	for pn = PLAYER_1,NUM_PLAYERS-1 do
		if GAMESTATE:IsPlayerEnabled(pn) and not GAMESTATE:IsGoalComplete(pn) then return "0" end
	end
	return "1"
end

--
-- Workout
--
function WorkoutResetStageStats()
	STATSMAN:Reset()
end

function WorkoutGetProfileGoalType( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalType()
end

function WorkoutGetStageCalories( pn )
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetCaloriesBurned()
end

function WorkoutGetTotalCalories( pn )
	return STATSMAN:GetAccumStageStats():GetPlayerStageStats(pn):GetCaloriesBurned()
end

function WorkoutGetTotalSeconds( pn )
	return STATSMAN:GetAccumStageStats():GetGameplaySeconds()
end

function WorkoutGetGoalCalories( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalCalories()
end

function WorkoutGetGoalSeconds( pn )
	return PROFILEMAN:GetProfile(pn):GetGoalSeconds()
end

function WorkoutGetPercentCompleteCalories( pn )
	return WorkoutGetTotalCalories(pn) / WorkoutGetGoalCalories(pn)
end

function WorkoutGetPercentCompleteSeconds( pn )
	return WorkoutGetTotalSeconds(pn) / WorkoutGetGoalSeconds(pn)
end

--
-- Options
--
function RestoreDefaults( pn )
	if pn == PLAYER_2 then
		Trace( "skip RestoreDefaults" )
		return
	end

	Trace( "RestoreDefaults" )
	
	PREFSMAN:SetPreference( "ControllerMode", 0 )
	PREFSMAN:SetPreference( "TwoControllerDoubles", false )
	PREFSMAN:SetPreference( "SongsPerPlay", 3 )
	PREFSMAN:SetPreference( "EventMode", false )
	PREFSMAN:SetPreference( "LifeDifficultyScale", 1 )

	local Table = PROFILEMAN:GetMachineProfile():GetSaved()
	Table["DefaultSort"] = GetDefaultSort()
	Table["DefaultDifficulty"] = GetDefaultDifficulty()

	PREFSMAN:SetPreference( "BGBrightness", .4 )
	PREFSMAN:SetPreference( "GlobalOffsetSeconds", 0 )
	PREFSMAN:SetPreference( "Autosave", true )
end

-- Home unlock (stubs):
function GetUnlockCommand() return "playcommand,NoUnlock" end
function FinalizeUnlock() end

-- Arcade unlocks:
function Unlock( Title )
	local Code = UNLOCKMAN:FindCode( Title )
	if Code then
		UNLOCKMAN:UnlockCode( Code )
	end

	-- Set the song as preferred, even if it's no longer an unlock.
	NewHelpText = {}
	local s = SONGMAN:FindSong( Title )
	if s then
		GAMESTATE:SetPreferredSong( s )
		NewHelpText[1] = "Unlocked " .. s:GetDisplayFullTitle() .. "!"
	end

	-- Get a list of steps (not songs) we just unlocked, and send a message to display
	-- them in HelpText.
	if Code then
		local Songs, Steps = UNLOCKMAN:GetStepsUnlockedByCode( Code )
		for x in Songs do
			NewHelpText[x+1] = "Unlocked " .. Songs[x]:GetDisplayFullTitle() .. " " .. DifficultyToThemedString(Steps[x]) .. "!"
		end
	end

	-- Only set the HelpText if this is actually a locked song for this game.  Don't do
	-- it if it's an old unlock code from a previous game.  (Do show it if it was already
	-- unlocked, though, so people can re-enter a code to see which steps were unlocked.)
	if Code then
		MESSAGEMAN:Broadcast( "ChangeHelpText" )
	end
	NewHelpText = nil

	-- The ITG2 menu music is much stronger than ITG1's, drowning out the unlock
	-- sounds.  Dim the music to 20% for 3 seconds while we play the unlock sound.
	-- This will stay dimmed briefly after the unlock sound plays.  That's OK; it
	-- helps emphasize the sound and prevents the music changes from being too busy.
	SOUND:DimMusic( 0.2, 3 )

	local Path = THEME:GetPath( EC_SOUNDS, '', "Unlocked " .. Title )
	SOUND:PlayOnce( Path )
end

function SetDifficultyFrameFromSteps( Actor, pn )
	Trace( "SetDifficultyFrameFromSteps" )
	local steps = GAMESTATE:GetCurrentSteps( pn );
	if steps then 
		Actor:setstate(steps:GetDifficulty()) 
	end
end

function SetDifficultyFrameFromGameState( Actor, pn )
	Trace( "SetDifficultyFrameFromGameState" )
	local trail = GAMESTATE:GetCurrentTrail( pn );
	if trail then 
		Actor:setstate(trail:GetDifficulty()) 
	else
		SetDifficultyFrameFromSteps( Actor, pn )
	end
end

function SetFromSongTitleAndCourseTitle( actor )
	Trace( "SetFromSongTitleAndCourseTitle" )
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
	local text = ""
	if song then
		text = song:GetDisplayFullTitle()
	end
	if course then
		text = course:GetDisplayFullTitle() .. " - " .. text;
	end

	actor:settext( text )
end

function SetRemovedText(self, port)
	local CurrentSong = GAMESTATE:GetCurrentSong()
	if CurrentSong and string.find( CurrentSong:GetDisplayFullTitle(), "Disconnected" ) then
		self:settext( "The controller in controller port " .. port .. " has been disconnected." )
		return
	end

	self:settext( "The controller in controller port " .. port .. " has been removed." )
end


function GetActual( stepsType )
	return 
		PROFILEMAN:GetMachineProfile():GetSongsActual(stepsType,DIFFICULTY_EASY)+
		PROFILEMAN:GetMachineProfile():GetSongsActual(stepsType,DIFFICULTY_MEDIUM)+
		PROFILEMAN:GetMachineProfile():GetSongsActual(stepsType,DIFFICULTY_HARD)+
		PROFILEMAN:GetMachineProfile():GetSongsActual(stepsType,DIFFICULTY_CHALLENGE)+
		PROFILEMAN:GetMachineProfile():GetCoursesActual(stepsType,COURSE_DIFFICULTY_REGULAR)+
		PROFILEMAN:GetMachineProfile():GetCoursesActual(stepsType,COURSE_DIFFICULTY_DIFFICULT)
end

function GetPossible( stepsType )
	return 
		PROFILEMAN:GetMachineProfile():GetSongsPossible(stepsType,DIFFICULTY_EASY)+
		PROFILEMAN:GetMachineProfile():GetSongsPossible(stepsType,DIFFICULTY_MEDIUM)+
		PROFILEMAN:GetMachineProfile():GetSongsPossible(stepsType,DIFFICULTY_HARD)+
		PROFILEMAN:GetMachineProfile():GetSongsPossible(stepsType,DIFFICULTY_CHALLENGE)+
		PROFILEMAN:GetMachineProfile():GetCoursesPossible(stepsType,COURSE_DIFFICULTY_REGULAR)+
		PROFILEMAN:GetMachineProfile():GetCoursesPossible(stepsType,COURSE_DIFFICULTY_DIFFICULT)
end

function GetTotalPercentComplete( stepsType )
	return GetActual(stepsType) / (0.96*GetPossible(stepsType))
end

function GetSongsPercentComplete( stepsType, difficulty )
	return PROFILEMAN:GetMachineProfile():GetSongsPercentComplete(stepsType,difficulty)/0.96
end

function GetCoursesPercentComplete( stepsType, difficulty )
	return PROFILEMAN:GetMachineProfile():GetCoursesPercentComplete(stepsType,difficulty)/0.96
end

function GetExtraCredit( stepsType )
	return GetActual(stepsType) - (0.96*GetPossible(stepsType))
end

function GetMaxPercentCompelte( stepsType )
	return 1/0.96;
end

-- This is overridden in the PS2 theme to set the options difficulty.
function GetInitialDifficulty()
	return "beginner"
end

function DifficultyChangingIsAvailable()
	return GAMESTATE:GetPlayMode() ~= PLAY_MODE_ENDLESS and GAMESTATE:GetPlayMode() ~= PLAY_MODE_ONI and GAMESTATE:GetSortOrder() ~= SORT_MODE_MENU
end

function ModeMenuAvailable()
	if GAMESTATE:IsCourseMode() then return false end
	--Trace( "here1" )
	if GAMESTATE:GetSortOrder() == SORT_MODE_MENU then return false end
	--Trace( "here2" )
	return true
end

function GetEditStepsText()
	local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
	if steps == nil then 
		return ""
	elseif steps:GetDifficulty() == DIFFICULTY_EDIT then 
		return steps:GetDescription()
	else 
		return DifficultyToThemedString(steps:GetDifficulty())
	end
end

function GetScreenSelectStyleDefaultChoice()
	if GAMESTATE:GetNumPlayersEnabled() == 1 then return "1" else return "2" end
end

-- Wag for ScreenSelectPlayMode scroll choice3.  This should use
-- EffectMagnitude, and not a hardcoded "5".
function TweenedWag(self)
	local time = self:GetSecsIntoEffect()
	local percent = time / 4
	local rx, ry, rz
	rx,ry,rz = self:getrotation()
	rz = rz + 5 * math.sin( percent * 2 * 3.141 ) * self:getaux()
	self:rotationz( rz )
end

-- For DifficultyMeterSurvival:
function SetColorFromMeterString( self )
	local meter = self:GetText()
	if meter == "?"  then return end

	local i = (meter+0);
	local cmd;
	if i <= 1 then cmd = "Beginner"
	elseif i <= 3 then cmd = "Easy"
	elseif i <= 6 then cmd = "Regular"
	elseif i <= 9 then cmd = "Difficult"
	else cmd = "Challenge"
	end
	
	self:playcommand( "Set" .. cmd .. "Course" )
end

function GetPaneX( player )
	if GAMESTATE:PlayerUsingBothSides() then
		return SCREEN_CENTER_X
	end
	
	if player == PLAYER_1 then
		return SCREEN_CENTER_X-152
	else
		return SCREEN_CENTER_X+152
	end
end

function EvalX()
	if not GAMESTATE:PlayerUsingBothSides() then return 0 end

	local Offset = 147
	if GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 then Offset = Offset * -1 end
	return Offset;
end

function EvalTweenDistance()
	local Distance = SCREEN_WIDTH/2
	if GAMESTATE:PlayerUsingBothSides() then Distance = Distance * 2 end
	return Distance
end

-- used by BGA/ScreenEvaluation overlay
-- XXX: don't lowercase commands on parse
function ActorFrame:difficultyoffset()
	if not GAMESTATE:PlayerUsingBothSides() then return end

	local XOffset = 75
	if GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 then XOffset = XOffset * -1 end
	self:addx( XOffset )
	self:addy( -55 )
end

function GameState:PlayerDifficulty( pn )
	if GAMESTATE:IsCourseMode() then
		local trail = GAMESTATE:GetCurrentTrail(pn)
		return trail:GetDifficulty()
	else
		local steps = GAMESTATE:GetCurrentSteps(pn)
		return steps:GetDifficulty()
	end
end

function Get2PlayerJoinMessage()
	if not GAMESTATE:PlayersCanJoin() then return "" end
	if GAMESTATE:GetCoinMode()==COIN_MODE_FREE then return "2 Player mode available" end
	
	local numSidesNotJoined = NUM_PLAYERS - GAMESTATE:GetNumSidesJoined()
	if GAMESTATE:GetPremium() == PREMIUM_JOINT then numSidesNotJoined = numSidesNotJoined - 1 end	
	local coinsRequiredToJoinRest = numSidesNotJoined * PREFSMAN:GetPreference("CoinsPerCredit")
	local remaining = coinsRequiredToJoinRest - GAMESTATE:GetCoins();
		
	if remaining <= 0 then return "2 Player mode available" end
	
	local s = "For 2 Players, insert " .. remaining .. " more coin"
	if remaining > 1 then s = s.."s" end
	return s
end

function GetRandomSongNames( num )
	local s = "";
	for i = 1,num do
		local song = SONGMAN:GetRandomSong();
		if song then s = s .. song:GetDisplayFullTitle() .. "\n" end
	end
	return s
end

function GetStepChartFacts()
	local s = "";
	s = s .. "In The Groove:\n"
	s = s .. "  71 single easy\n"
	s = s .. "  71 single medium\n"
	s = s .. "  71 single hard\n"
	s = s .. "  52 single expert\n"
	s = s .. "  71 double easy\n"
	s = s .. "  71 double medium\n"
	s = s .. "  71 double hard\n"
	s = s .. "  59 double expert\n"
	s = s .. "In The Groove 2:\n"
	s = s .. "  61 single novice\n"
	s = s .. "  61 single easy\n"
	s = s .. "  61 single medium\n"
	s = s .. "  61 single hard\n"
	s = s .. "  49 single expert\n"
	s = s .. "  61 double easy\n"
	s = s .. "  61 double medium\n"
	s = s .. "  61 double hard\n"
	s = s .. "  52 double expert"
	return s
end

function GetRandomCourseNames( num )
	local s = "";
	for i = 1,num do
		local course = SONGMAN:GetRandomCourse();
		if course then s = s .. course:GetDisplayFullTitle() .. "\n" end
	end
	return s
end

function GetModifierNames( num )
	local mods = {
		"1x","2x","3x","4x","5x","6x","7x","8x","c550","c675","c800",
		"Incoming","Overhead","Space","Hallway","Distant",
		"Standard","Reverse","Alternate","Centered",
		"Accel","Decel","Wave","Expand","Boomerang","Bumpy",
		"Dizzy","Drift","Mini","Tornado","Float","Beat",
		"Fade&nbsp;In","Fade&nbsp;Out","Blink","Invisible","Beat","Bumpy",
		"Mirror","Left","Right","Random","Blender",
		"No&nbsp;Jumps","No&nbsp;Holds","No&nbsp;Rolls","No&nbsp;Hands","No&nbsp;Quads","No&nbsp;Mines",
		"Simple","Stream","Wide","Quick","Skippy","Echo","Stomp",
		"Planted","Floored","Twister","Add&nbsp;Mines","No&nbsp;Stretch&nbsp;Jumps",
		"Hide&nbsp;Targets","Hide&nbsp;Judgment","Hide&nbsp;Background",
		"Metal","Cel","Flat","Robot","Vivid"
	}
	mods = tableshuffle( mods )
	local s = "";
	for i = 1,math.min(num,table.getn(mods)) do
		s = s .. mods[i] .. "\n"
	end
	return s
end

function GetRateMod()
	local RateMods = GetRateMods()
	for n = 1, table.getn(RateMods) do
		if GAMESTATE:PlayerIsUsingModifier(0, RateMods[n] .. 'music') or GAMESTATE:PlayerIsUsingModifier(1, RateMods[n] .. 'music') then
			return RateMods[n]
		end
	end

	return '(Unknown rate mod)'
end

function GetSpeedMod(pn)
    local BaseSpeeds = GetBaseSpeeds()
    local ExtraSpeeds = GetExtraSpeeds()    
    for n = 1, table.getn(BaseSpeeds) do
        if GetSpeedModRowType() == "basic" or GetSpeedModRowType() == "advanced" then
            if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n]) then return BaseSpeeds[n] end
        end

        if GetSpeedModRowType() == "pro" then
            for m = 1, table.getn(ExtraSpeeds) do
                local ExtraSpeed = string.gsub(ExtraSpeeds[m],'+0', '')
                if ExtraSpeed == "0" then ExtraSpeed = ".0" end

                local CombinedSpeeds = tonumber(BaseSpeeds[n])*100 + tonumber(ExtraSpeed)*100 --combines the speeds in to things like 450

                --check x-mods
                Trace('Checking the swag for ' .. pn .. ' ' .. BaseSpeeds[n] .. ExtraSpeed .. 'x')
                if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n] .. ExtraSpeed .. 'x') then
                    Trace("Returning the swag " .. BaseSpeeds[n] .. ExtraSpeed .. 'x')
                    return BaseSpeeds[n] .. ExtraSpeed .. 'x'
                end

                --check c-mods
                Trace('Checking the swag for ' .. pn .. ' c' .. CombinedSpeeds)
                if GAMESTATE:PlayerIsUsingModifier(pn, 'c' .. CombinedSpeeds) then 
                    Trace("Returning the swag c" .. CombinedSpeeds)
                    return 'c' .. CombinedSpeeds
                end

                --check m-mods (for some reason m0 is always applied, so skip it)
                Trace('Checking the swag for ' .. pn .. ' m' .. CombinedSpeeds)
                if GAMESTATE:PlayerIsUsingModifier(pn, 'm' .. CombinedSpeeds) and CombinedSpeeds ~= 0 then 
                    Trace("Returning the swag m" .. CombinedSpeeds)
                    return 'm' .. CombinedSpeeds
                end
            end
       end  
    end

    --If we got here, chances are that we ignored m0, so return that
    return "m0"
end

function GetSpeedModBase(pn)
    local SpeedMod = GetSpeedMod(pn)
    SpeedMod = string.gsub(SpeedMod, 'c', '')
    SpeedMod = string.gsub(SpeedMod, 'm', '')

    local SpeedModType = GetSpeedModType(pn)
    
    if SpeedModType == 'x-mod' then
        local pos = string.find(SpeedMod, '.', 1, true)
        return string.sub(SpeedMod, 1, pos-1)
    end

    if SpeedModType == 'c-mod' or SpeedModType == 'm-mod' then
        SpeedMod = tonumber(SpeedMod)/100
        SpeedMod = tostring(SpeedMod)
        local pos = string.find(SpeedMod, '.', 1, true)

        if pos ~= nil then return string.sub(pos, 1, pos-1) else return SpeedMod end
    end
end

function GetSpeedModExtra(pn)
    local SpeedMod = GetSpeedMod(pn)
    local SpeedModBase = GetSpeedModBase(pn)

    Trace('GETSPEEDMODEXTRA SHIT:')
    Trace('SpeedMod: ' .. SpeedMod)
    Trace('SpeedModBase: ' .. SpeedModBase)

    local SpeedModExtra = string.gsub(SpeedMod, SpeedModBase .. '.', '')

    Trace('1st SpeedModExtra: ' .. SpeedModExtra)

    SpeedModExtra = string.gsub(SpeedModExtra, 'x', '')

    Trace('2nd SpeedModExtra: ' .. SpeedModExtra)

    if SpeedModExtra ~= nil then return SpeedModExtra else return "0" end
end

function GetSpeedModType(pn)
    local SpeedMod = GetSpeedMod(pn)

    if string.find(SpeedMod, ".") ~= nil then return 'x-mod' end
    if string.find(SpeedMod, "c") ~= nil then return 'c-mod' end
    if string.find(SpeedMod, "m") ~= nil then return 'm-mod' end
end

function oitgACoptions()
    -- Right now we return the same line names for both OITG and whatever else happens to be running. But in the future they might be different.
    if OPENITG then return "1,2,3,4,5,6,7,8,9,10,11" end

    return "1,2,3,4,5,6,7,8,9,10,11"
end

function SongModifiers()
    -- this is very basic right now, but it can be modified to take in to account OITG specific stuff
    return SpeedLines() .. "4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24"
end

function SpeedLines()
    local type = GetSpeedModRowType()

    if type == "pro" then
        return "1,2,3,"
    else
        return "1,"
    end
end

function SpeedMods(name)
    local modList = GetBaseSpeeds()
    local s = "Speed"

    if name == "Extra" then
        modList = GetExtraSpeeds()
        s = "Extra " .. s
    end

    if name == "Type" then
        modList = GetSpeedModTypes()
        s = s .. " Type"
    end

    local Params = { Name = s, OneChoiceForAllPlayers = false }   

    local function Load(self, list, pn)
        -- default to the first item in the list
        list[1] = true

        -- now loop through everything else in the list and see if it is set to true
        for i=2, table.getn(modList) do
                if name == "Base" then
                    if modList[i] == GetSpeedModBase(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end

                if name == "Extra" then
                    if modList[i] == GetSpeedModExtra(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end

                if name == "Type" then				
                    if modList[i] == GetSpeedModType(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end
        end
    end

    local function Save(self, list, pn)
        local SpeedMod = GetSpeedMod(pn)
        local ModBase = GetSpeedModBase(pn)
        local ModExtra = GetSpeedModExtra(pn)
        local ModType = GetSpeedModType(pn)

        for i = 1, table.getn(modList) do
            if list[i] then
                if name == "Base" then ModBase = modList[i] end
                if name == "Extra" then ModExtra = modList[i] end
                if name == "Type" then ModType = modList[i] end
            end
        end

        Trace("LEEROY " .. ModBase .. '.' .. ModExtra)

        SpeedMod = tonumber(ModBase .. '.' .. ModExtra);

        if ModType == 'c-mod' then SpeedMod = 'c' .. SpeedMod*100 end
        if ModType == 'm-mod' then SpeedMod = 'm' .. SpeedMod*100 end
        if ModType == 'x-mod' then SpeedMod = SpeedMod .. 'x' end      
                    
        --GAMESTATE:ApplyGameCommand('mod,'..SpeedMod,pn)
        --ApplySpeedMods()
        --MESSAGEMAN:Broadcast('SpeedModChanged')
    end

    return CreateOptionRow( Params, modList, Load, Save )
end

function ApplySpeedMods()
    local modRate = GetRateMod()

    for pn=1, 2 do
        if GAMESTATE:IsPlayerEnabled( pn - 1 ) then
            speed = string.gsub(modSpeed[pn],modType[pn],"")
            if modType[pn] == "x" then speed = math.ceil(100*speed/modRate)/100 .. "x" end
            if modType[pn] == "c" then speed = "c" .. math.ceil(speed/modRate) end
            if modType[pn] == "m" then speed = "m" .. math.ceil(speed/modRate) end
            GAMESTATE:ApplyGameCommand('mod,' .. speed,pn)
        end
    end
end

function DisplayBPM(pn, includeRate, includeSpeed) 
        local lowBPM = bpm[1]
        local highBPM = bpm[2]  

        local rateMod = string.gsub(GetRateMod(),'x','')
        rateMod = tonumber(rateMod)

        local speedMod = GetSpeedMod(pn)
        speedMod = string.gsub(speedMod,'x','')
        speedMod = string.gsub(speedMod,'c','')
        speedMod = string.gsub(speedMod,'m','')

        if not includeRate then rateMod = 1 end
        if not includeSpeed then speedMod = 1 end

        if lowBPM == "Various" or lowBPM == "..." or lowBPM == nil then
            return "???"
        end

        lowScrollBPM = lowBPM * speedMod * rateMod

        if string.sub(lowScrollBPM, 2, 2) == "." then
        lowScrollBPM = string.sub(lowScrollBPM, 1, 1)
        end

        if string.sub(lowScrollBPM, 3, 3) == "." then
        lowScrollBPM = string.sub(lowScrollBPM, 1, 2)
        end

        if string.sub(lowScrollBPM, 4, 4) == "." then
        lowScrollBPM = string.sub(lowScrollBPM, 1, 3)
        end

        if string.sub(lowScrollBPM, 5, 5) == "." then
        lowScrollBPM = string.sub(lowScrollBPM, 1, 4)
        end

        if string.sub(lowScrollBPM, 6, 6) == "." then
        lowScrollBPM = string.sub(lowScrollBPM, 1, 5)
        end

        if highBPM ~= "" then

                highScrollBPM = highBPM * speedMod * rateMod

                if string.sub(highScrollBPM, 2, 2) == "." then
                highScrollBPM = string.sub(highScrollBPM, 1, 1)
                end

                if string.sub(highScrollBPM, 3, 3) == "." then
                highScrollBPM = string.sub(highScrollBPM, 1, 2)
                end

                if string.sub(highScrollBPM, 4, 4) == "." then
                highScrollBPM = string.sub(highScrollBPM, 1, 3)
                end

                if string.sub(highScrollBPM, 5, 5) == "." then
                highScrollBPM = string.sub(highScrollBPM, 1, 4)
                end

                if string.sub(highScrollBPM, 6, 6) == "." then
                highScrollBPM = string.sub(highScrollBPM, 1, 5)
                end
        end

        --[[
        If we want to include rate and speed but we also have a c or m mod, we
        can just return the speedMod as that will be the scroll speed regardless
        of the rate/speed mod chosen
        ]]--
        if includeRate and includeSpeed and (GetSpeedModType(pn) == "m-mod" or GetSpeedModType(pn) == "c-mod") then
            return speedMod
        end

        -- In every other case we return the bpm range adjusted for the speed and rate.
        if highBPM == "" then
            return lowScrollBPM
        else
            return lowScrollBPM .. "-" .. highScrollBPM
        end
end