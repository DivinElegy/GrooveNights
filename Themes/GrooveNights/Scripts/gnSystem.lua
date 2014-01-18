--------------------------------------------------------------------
--------------------------------------------------------------------
--   _____                          _   _ _       _     _         --
--  / ____|                        | \ | (_)     | |   | |        --
-- | |  __ _ __ ___   _____   _____|  \| |_  __ _| |__ | |_ ___   --
-- | | |_ | '__/ _ \ / _ \ \ / / _ \ . ` | |/ _` | '_ \| __/ __|  --
-- | |__| | | | (_) | (_) \ V /  __/ |\  | | (_| | | | | |_\__ \  --
--  \_____|_|  \___/ \___/ \_/ \___|_| \_|_|\__, |_| |_|\__|___/  --
--                                           __/ |                --
--                                          |___/         	      --
--------------------------------------------------------------------
--------------------------------------------------------------------

-- ** This is for editing system-specific things, if you want to customize the theme elements go to gnEditable.lua **

-- ===TABLE OF CONTENTS===
-- SYSTEM SOUNDS
-- SHIFT SCREEN EVALUATION ELEMENTS IN DOUBLE MODE
-- SET SCREEN SPECIFIC VARIABLES
-- DIFFERENTIATE PLAYERS USING SHARED RESOURCES
-- 'RATE MOD HAS BEEN RESTORED' MESSAGE
















-- ===SYSTEM SOUNDS===
-- For additional non-default sounds
function getSystemSound(snd,snnd)
local Path = THEME:GetPath( EC_SOUNDS, snd, snnd )
return Path
end





-- ===GRADE SOUNDS===
-- These sounds play when your grade appears
-- 
function GradeSound( snd )
local Path = THEME:GetPath( EC_SOUNDS, 'gnGradeUp', ''..snd..'')
return Path
end





-- ===SHIFT SCREEN EVALUATION ELEMENTS IN DOUBLE MODE===
function ScreenEvaluationDoubleShift(pn)
	if GAMESTATE:PlayerUsingBothSides(pn) then
		if pn == PLAYER_1 then
		return -158;
		else
		return 155;
		end
	end
return 0
end





-- ===SET SCREEN SPECIFIC VARIABLES===
function InitScreen(scn)
if scn == 'ScreenOptions' then
ScreenTransitionWhoosh('short');
end


if scn == 'ScreenCompany' then
gnStatsTotalSongCount = nil
gnStatsTotalExpCount = nil
gnStatsTotalDeathCount = nil
gnStatsTotalStarCount = nil;

gnStats1StarCount = nil
gnStats2StarCount = nil
gnStats3StarCount = nil
gnStats4StarCount = nil

gnStatsLevel = nil

gnPlayerNames = {'',''}

gnScreenSelectMusic = false;
end


if scn == 'ScreenLogo' then
if GAMESTATE:GetEnv('Santa') == 'Turn' then
	SCREENMAN:SystemMessage('Santa Code Activated');
	GAMESTATE:SetEnv('Santa','On');
	end
if GAMESTATE:GetEnv('Frost') == 'Turn' then
	SCREENMAN:SystemMessage('Frost Code Activated');
	GAMESTATE:SetEnv('Frost','On');
	end
if GAMESTATE:GetEnv('Blizzard') == 'Turn' then
	SCREENMAN:SystemMessage('Blizzard Code Activated');
	GAMESTATE:SetEnv('Blizzard','On');
	end
if GAMESTATE:GetEnv('Rain') == 'Turn' then
	SCREENMAN:SystemMessage('Rain Code Activated');
	GAMESTATE:SetEnv('Rain','On');
	end
if GAMESTATE:GetEnv('Vibrate') == 'Turn' then
	SCREENMAN:SystemMessage('Vibrate Code Activated');
	GAMESTATE:SetEnv('Vibrate','On');
	end
if GAMESTATE:GetEnv('AngryGrandpa') == 'Turn' then
	SCREENMAN:SystemMessage('Angry Grandpa Code Activated');
	GAMESTATE:SetEnv('AngryGrandpa','On');
	end
if GAMESTATE:GetEnv('Konami') == 'Turn' then
	SCREENMAN:SystemMessage('Konami Code Activated');
	GAMESTATE:SetEnv('Konami','On');
	end	
	gnScreenSelectMusic = false;
end


if scn == 'ScreenSelectPlayMode' then
ScreenTransitionWhoosh('long');
-- nothing to add yet
end


if scn == 'ScreenSelectStyle2' then
ScreenTransitionWhoosh('short');
	gnSongsP1 = nil;
	gnSongsP1Total = nil;
	gnTotalP1 = nil;
	gnStarsTotalP1 = nil;
	gnSinglesSingleP1 = nil;
	gnDoublesSingleP1 = nil;
	gnTrisSingleP1 = nil;
	gnQuadsSingleP1 = nil;
	gnSinglesDoubleP1 = nil;
	gnDoublesDoubleP1 = nil;
	gnTrisDoubleP1 = nil;
	gnQuadsDoubleP1 = nil;
	gnPercentageP1 = nil;
	gnSongsP2 = nil;
	gnSongsP2Total = nil;
	gnTotalP2 = nil;
	gnStarsTotalP2 = nil;
	gnSinglesSingleP2 = nil;
	gnDoublesSingleP2 = nil;
	gnTrisSingleP2 = nil;
	gnQuadsSingleP2 = nil;
	gnSinglesDoubleP2 = nil;
	gnDoublesDoubleP2 = nil;
	gnTrisDoubleP2 = nil;
	gnQuadsDoubleP2 = nil;
	gnPercentageP2 = nil;
	gnChoice = 2;
	gnChoiceTween = 0.05;
	gnZoom1 = 0.7;
	gnZoom3 = 0.4;
	gnZoom4 = 0.4;
	gnMaxZoom = 0.6;
	gnMinZoom = 0.4;
end


if scn == 'ScreenSelectMusic' then
ScreenTransitionWhoosh('short');
RateRestoreMessage(true);
	if curRate == nil then curRate = 1 end
	gnBlazedP1 = 0;
	gnBlazedP2 = 0;
	gnP1Ready = 0;
	gnP2Ready = 0;
	gnPlayerCount = 0;
	gnTotalDone = 0;
	gnSpecialUSB = false;
	if gnStatFrequency == nil then gnStatFrequency = 0; end
	gnStatFrequency = gnStatFrequency + 1;
	gnOptionMod = 0;
	gnOptionModType = 0;
	gnSongElapsedPercent = 0;
	gnNoRestart = false;
	gnScreenSelectMusic = true;
end


if scn == 'ScreenPlayerOptions' then
ScreenTransitionWhoosh('short');
	if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		gnP1Sound = 0;
		else
		gnP1Sound = 1;
		end
	if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		gnP2Sound = 0;
		else
		gnP2Sound = 1;
		end
	gnBlazeP1 = 0;
	gnBlazeP2 = 0;
	if lowBPM == nil then
		lowBPM = 0;
		end
	if highBPM == nil then
		highBPM = 0;
		end
	if gnScreenSelectMusicTimer == nil then gnScreenSelectMusicTimer = gnDefaultSSM; end
	if gnScreenPlayerOptionsTimer == nil then gnScreenPlayerOptionsTimer = gnDefaultSPO; end
	RateRestoreMessage(true);
	gnScreenSelectMusic = false;
end


if scn == 'ScreenStage' then
ScreenTransitionWhoosh('short');
gnScreenSelectMusic = false;
end


if scn == 'ScreenGameplay' then
	GreenQuadP1Flag = 0;
	GreenQuadP2Flag = 0;
	PurpleQuadP1Flag = 0;
	PurpleQuadP2Flag = 0;
	gnGreenQuadP1 = false;
	gnGreenQuadP2 = false;
	gnPurpleQuadP1 = false;
	gnPurpleQuadP2 = false;
	gnCustomPlayed = 0;
	gnScreenEvaluationFlag = true;
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		gnNoP1 = false;
		else
		gnNoP1 = true;
		end
	gnPlayer = 0;
	if lowBPM == nil then
		lowBPM = 0;
		end
	if highBPM == nil then
		highBPM = 0;
		end
	if popTimer == nil then
		popTimer = 0;
		end
	gnLastWinP1 = 0;
	gnLastWinP2 = 0;
	if gnStamina == nil then gnStamina = ''; end
	if FinalBPM == nil then FinalBPM = 0; end
	if curRate == nil then curRate = 1; end
	
	gnLowHealth = false;
	gnLowHealth = false;
	gnVoiceTimer = 0;
	gnRandomVoice = math.random(1,5); 
	gnRandomMark1 = math.random(5,92);
	gnRandomMark2 = math.random(5,92);
	gnRandomMark3 = math.random(5,92);
	gnSongElapsedPercent = 0;
	gnStamina25Window = 0;
	gnStamina50Window = 0;
	gnStamina75Window = 0;
	gnStamina80Window = 0;
	gnStamina90Window = 0;
	gnStaminaLowHealth = 0;
	gnStaminaRandom = 0;
	gnStaminaRandomizer = 0;
	gnStaminaStepP1 = 0;
	gnStaminaStepP2 = 0;
	gnStaminaStepCutoff = 0;
	gnStreamCountP1 = 0;
	gnStreamCountP2 = 0;
	gnStaminaStepTarget = 0;
	gnP1Restarter = 0;
	gnP2Restarter = 0;
	gnSameGrade = 0;
	gnOptionCheck = false;
	
	-- Each 0 represents 1% of the song (0% inclusive), there are 202 in total, 101 per player.
	gnSongTimeline = { 
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	}
	
	gnScoreP1 = 0
	gnScoreP2 = 0
	gnDimBGMSeconds = 0.1
	gnOnScreenSeconds = 0
	gnDisplayedFileOpacity = 0
	gnBackgroundDarkness = 0
	gnAwardWidthP2 = 0;
	gnSound = nil
end



if scn == 'ScreenGameplayFailed' then
MESSAGEMAN:Broadcast('NoRestart');
gnNoRestart = true
end



if scn == 'ScreenEvaluation' then
ScreenTransitionWhoosh('short');
gnSongCount = gnSongCount + 1;
if not (GAMESTATE:IsEventMode() and MenuButtonGiveUp() and not gnNoRestart and not GAMESTATE:IsCourseMode()) then
	RateRestoreMessage(false);
	end
end



if scn == 'GradeModels' then
-- Nothing to add yet
end



if scn == 'ScreenNameEntry' then
ScreenTransitionWhoosh('short');
end


if scn == 'ScreenEnding' then
gnScreenEnd = false;
end


return 0
end





-- ===DIFFERENTIATE PLAYERS USING SHARED RESOURCES===
function SameThingDifferentPlayer()
	if GAMESTATE:IsPlayerEnabled(PLAYER_2) and not GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		if gnPlayerCount == 0 then
		gnPlayerCount = gnPlayerCount + 2;
		end
	end

	if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
		if gnPlayerCount == 1 then
		gnPlayerCount = gnPlayerCount + 1;
		end
	end

	if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		if gnPlayerCount == 0 then
		gnPlayerCount = gnPlayerCount + 1;
		end
	end
return gnPlayerCount;
end





-- ==='RATE MOD HAS BEEN RESTORED' MESSAGE===
-- Call with false to display message, call with true to display the message AND reset the mod
function RateRestoreMessage(i)
	if GetRateMod() ~= '1.0x' then
		if i then
		GAMESTATE:ApplyGameCommand('mod, 1.0xmusic',1);
		gnOptionCheck = true;
		end 
	SCREENMAN:SystemMessage('Rate Modifier has been restored to 1.0x');
	else
	if gnOptionCheck then
		gnOptionCheck = false;
		SCREENMAN:SystemMessage('Rate Modifier has been restored to 1.0x');
		end
	end
end





-- ===PLAY SCREEN TRANSITION SOUND===
-- Makes the arrow go whooshy whoosh
function ScreenTransitionWhoosh(i)
	local Path = THEME:GetPath( EC_SOUNDS, 'gnScreenTransition', 'whoosh '..i );
	SOUND:PlayOnce(Path);
end

-- Easter eggs
local function BPMEasterEggs(Params)
    local ScrollSpeed = DisplayScrollSpeed(Params.pn)
    local spaces = string.rep(" ", string.len(ScrollSpeed))

    if ScrollSpeed == '420' or ScrollSpeed == '360' then
        if ScrollSpeed == '420' then Params.Actor:settext(spaces .. " Blaze It!") else Params.Actor:settext(spaces .. " No Scope!") end
        Params.Actor:diffusealpha(1)
        Params.Actor:rainbow()
    else
        Params.Actor:diffusealpha(0)
    end
end

local function GoodLuckCameronEasterEgg(Params)
    if GetProfilePref("GoodLuckCameron") then
        Params.Actor:Load(THEME:GetPath(EC_BGANIMATIONS, '', 'ScreenGameplay overlay/winning2.png'))
    end
end

local function GetQuadAwardFile(pn)
    local name = GAMESTATE:GetPlayerDisplayName(pn)

    local Files = { 
                    JonTron = {Name = 'JonTron', Params = {DimBGMSeconds = 17.6, OnScreenSeconds = 17.6, FileOpacity = 1, BGDarkness = 0.9}},
                    YES     = {Name = 'YES',     Params = {DimBGMSeconds = 10,   OnScreenSeconds = 10,   FileOpacity = 1, BGDarkness = 0.9}},
                    LOTR    = {Name = 'LOTR',    Params = {DimBGMSeconds = 22.7, OnScreenSeconds = 22.7, FileOpacity = 1, BGDarkness = 0.9}}
                  }

    local UserMap = {
                        ["Cameron"] = {'LOTR', 'YES'},
                        ["(-[Jayce]-)"] = {'JonTron', 'YES'}
                    }

    --[[
    This sems complicated, but it's not. Basicaly it looks at how many videos
    the user has, then decides which one to play based on the seconds of gametime
    EG: If the user has 3 videos then it will do this:
        Second 0: First video
        Second 1: Second video
        Second 2: Third video
        Second 3: First video
        Second 4: Second video

    etc.

    I did this instead of using math.random because this function is called from
    multiple actors, and we need to make sure it returns the same file every time
    using math.rand results in different actors getting different files, so things
    don't sync up.
    ]]--
    if UserMap[name] then
        local seconds = gnPlaySec -- TODO: This is temporary until the time tracker is reimplemented
        return Files[ UserMap[name][math.mod(seconds, table.getn(UserMap[name])) + 1] ]
    end

    return nil
end

local function QuadAwardEasterEgg(Params)
    local ScoreP1
    local ScoreP2
    local AwardFile

	--[[
	I don't even understand this. When this function is called from a queued command you have to get the score like this:
		SCREENMAN:GetTopScreen():GetChild('PercentP1'):GetChild('PercentP1'):GetText() end
		
	But if it's in an initcommand or oncommand you have to do it like this:
		SCREENMAN:GetTopScreen():GetChild('ScoreP1'):GetChild('ScoreDisplayPercentage Percent'):GetChild('PercentP1'):GetText()
		
	I think some children must get renamed/added between the commands or something, I don't know.
	]]--
	if Params.Layer == 'Silence' then
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then ScoreP1 = SCREENMAN:GetTopScreen():GetChild('PercentP1'):GetChild('PercentP1'):GetText() end
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then ScoreP2 = SCREENMAN:GetTopScreen():GetChild('PercentP2'):GetChild('PercentP2'):GetText() end
	else
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then ScoreP1 = SCREENMAN:GetTopScreen():GetChild('ScoreP1'):GetChild('ScoreDisplayPercentage Percent'):GetChild('PercentP1'):GetText() end
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then ScoreP2 = SCREENMAN:GetTopScreen():GetChild('ScoreP2'):GetChild('ScoreDisplayPercentage Percent'):GetChild('PercentP2'):GetText() end
	end
    
    if ScoreP1 == "100.00%" and ScoreP2 == "100.00%" then
        --choose p1 or p2 randomly
		local seconds = gnPlaySec -- TODO: This is temporary until the time tracker is reimplemented
        local pn = math.mod(seconds, 2) + 1
        AwardFile = GetQuadAwardFile(pn)
    elseif ScoreP1 == "100.00%" then
        AwardFile = GetQuadAwardFile(PLAYER_1)
    elseif ScoreP2 == "100.00%" then
        AwardFile = GetQuadAwardFile(PLAYER_2)
    end

    -- XXX: Temporary for testing at work as I can't use a memory card
    --AwardFile = GetQuadAwardFile(PLAYER_1)
    if AwardFile then
        if Params.Layer == "Dimmer" then
            Params.Actor:diffusealpha(AwardFile.Params.BGDarkness)
            Params.Actor:sleep(AwardFile.Params.OnScreenSeconds)
            Params.Actor:linear(0.3)
            Params.Actor:diffusealpha(0)
        elseif Params.Layer == "Video" then
            SOUND:PlayOnce( THEME:GetPath( EC_SOUNDS, 'gnCustomAward', AwardFile.Name ))
            Params.Actor:Load( THEME:GetPath( EC_SOUNDS, 'gnCustomAward',  'Graphics/' .. AwardFile.Name .. '.avi'))
            Params.Actor:x(SCREEN_CENTER_X)
            Params.Actor:y(SCREEN_CENTER_Y)
            Params.Actor:diffusealpha(AwardFile.Params.FileOpacity)
            Params.Actor:sleep(AwardFile.Params.OnScreenSeconds)
            Params.Actor:linear(0.3)
            Params.Actor:diffusealpha(0)
        elseif Params.Layer == "Silence" then
            SOUND:DimMusic( 0, AwardFile.Params.DimBGMSeconds )
        elseif Params.Layer == "Grade" then
            --[[
            Use hibernate here because it makes the whole actor and all its
            children do nothing. This way we can just put DoEasterEgg in the
            metrics and not in xml files. Sweet.
            ]]--
            Params.Actor:hibernate(AwardFile.Params.OnScreenSeconds)
        elseif Params.Layer == "Percent" then
            Params.Actor:hibernate(AwardFile.Params.OnScreenSeconds+0.05)
        end
    end
end
 
RegisterEasterEgg("BlazeIt", BPMEasterEggs)
RegisterEasterEgg("NoScope", BPMEasterEggs)
RegisterEasterEgg("GoodLuckCameron", GoodLuckCameronEasterEgg)
RegisterEasterEgg("QuadAward", QuadAwardEasterEgg)

--global variable callbacks
local function LowBPM( BPMDisplay )
	BPMDisplay = BPMDisplay:GetText()
	
	local pos = string.find(BPMDisplay, "-")

        if pos == 1 then pos = string.find(BPMDisplay, "-", 2) end -- if we have a negative bpm at the start then look for another occurence after

	if pos then return string.sub(BPMDisplay,1,pos-1) else return BPMDisplay end
end

local function HighBPM( BPMDisplay )
	BPMDisplay = BPMDisplay:GetText()

	local pos = string.find(BPMDisplay, "-")
        
        if pos == 1 then pos = string.find(BPMDisplay, "-", 2) end -- if we have a negative bpm at the start then look for another occurence after

	if pos then return string.sub(BPMDisplay,pos+1) else return BPMDisplay end
end

local function TotalTimeMinutes( TimeDisplay ) 
	TimeDisplay = TimeDisplay:GetText()
	local pos = string.find(TimeDisplay, ':')
		
	if pos then return string.sub(TimeDisplay, 1, pos-1) end
end

local function TotalTimeSeconds( TimeDisplay )
	TimeDisplay = TimeDisplay:GetText()
	local pos = string.find(TimeDisplay, ':')

	if pos then return string.sub(TimeDisplay, pos+1) end
end

RegisterGlobalCallback("HighBPM", HighBPM)
RegisterGlobalCallback("LowBPM", LowBPM)
RegisterGlobalCallback("TotalTimeMinutes", TotalTimeMinutes)
RegisterGlobalCallback("TotalTimeSeconds", TotalTimeSeconds)

-- custom mods
local function LoadJudgeSkin(Params)
    if Params.Value and Params.Value ~= "GrooveNights" then
        Params.Actor:Load( THEME:GetPath( EC_GRAPHICS, '', '_Judgements/' .. Params.Value ))
    end
end

local function PlayfieldMods(Params)
	local a = Params.Actor

	if Params.Value == "Bob" then a:bob() a:effectclock('beat') a:effectmagnitude(0,-30,0) end
	if Params.Value == "Vibrate" then a:vibrate() a:effectmagnitude(20,20,20) end
	if Params.Value == "Pulse" then a:pulse() a:effectclock('beat') end
	if Params.Value == "Wag" then a:wag() a:effectclock('beat') end
	if Params.Value == "Spin" then a:spin() a:effectclock('beat') a:effectmagnitude(0,0,45) end
end

RegisterCustomMod( "JudgeSkin", LoadJudgeSkin, { OneChoiceForAllPlayers = false, LineNumber = 201, GroupID = 2 }, { "GrooveNights", "Love", "Tactics", "Chromatic", "Deco", "FP", "ITG2" } )
RegisterCustomMod( "Playfield", PlayfieldMods, { OneChoiceForAllPlayers = false, LineNumber = 301, GroupID = 3 }, { "Off", "Vibrate", "Wag", "Bob", "Pulse", "Spin" } )

-- register regular system mods

RegisterSystemMod( "Perspective", 104, 1 )
RegisterSystemMod( "Rate", 105, 1 )
--Judgskin goes in here
RegisterSystemMod( "NoteSkins", 202, 2 )
RegisterSystemMod( "Mini", 203, 2 )
--Playfield mods in here
RegisterSystemMod( "Accel", 302, 3 )
RegisterSystemMod( "Beat", 303, 3 )
RegisterSystemMod( "Dizzy", 304, 3 )
RegisterSystemMod( "Flip", 305, 3 )
RegisterSystemMod( "Drift", 306, 3 )
RegisterSystemMod( "Float", 307, 3 )
RegisterSystemMod( "Invisible", 308, 3 )
RegisterSystemMod( "Appearance", 309, 3 )
RegisterSystemMod( "Turn", 401, 4 )
RegisterSystemMod( "InsertOther", 402, 4 )
RegisterSystemMod( "InsertTaps", 403, 4 )
RegisterSystemMod( "Remove", 501, 5 )
RegisterSystemMod( "Foreground", 502, 5 )
RegisterSystemMod( "Hide", 503, 5 )
RegisterSystemMod( "HideBG", 504, 5 )
RegisterSystemMod( "BackButton", 505, 5 ) -- TODO this is a lua mod so maybe can implement with RegisterCustomMod?
RegisterSystemMod( "Steps", 506, 5 )

-- set up names for group ids

RegisterModGroup(1, "Scroll Mods")
RegisterModGroup(2, "Appearance Mods")
RegisterModGroup(3, "Playfield Mods")
RegisterModGroup(4, "Insert Mods")
RegisterModGroup(5, "Other Mods")

--actor setters

function SetFromDisplayScrollSpeed( Actor, pn )
    Actor:settext(DisplayScrollSpeed(pn))
end

function SetFromDisplaySongLength( Actor )
    Actor:settext(DisplaySongLength())
end


--throwing this down here until all this code is refactored and neatened
function GoodLuckCameronOptionsRow()
    local Params = { Name = "GoodLuckCameron", Default = 1} -- 1 is OFF, 2 is ON
    return CreateProfileRowBool( Params )
end

-- ===GET THE CARD STATS FOR THE PLAYER===
-- Stars, songs played, deaths, etc
function getStats(pn,mode,stat)

-- Add modes and grade tiers into a table for quick reference
local gnStatsMode = {STEPS_TYPE_DANCE_SINGLE, STEPS_TYPE_DANCE_DOUBLE}
local gnStatsGradeDifficulties = {DIFFICULTY_BEGINNER, DIFFICULTY_EASY, DIFFICULTY_MEDIUM, DIFFICULTY_HARD, DIFFICULTY_CHALLENGE, DIFFICULTY_EDIT}

-- Define the tables if nil, otherwise reset based on the selected player
--[[
TODO: I'll leave this here for now, but down the track I would like to move these
outside the function definition as local variables so that they are accessible
only by this script.
]]-- 
if gnStatsTotalSongCount == nil then
gnStatsTotalSongCount = {0,0};
gnStatsTotalExpCount = {0,0};
gnStatsTotalDeathCount = {0,0};
gnStatsTotalStarCount = {0,0};

gnStats1StarCount = {0,0};
gnStats2StarCount = {0,0};
gnStats3StarCount = {0,0};
gnStats4StarCount = {0,0};

gnStatsLevel = {0,0};
gnStatsExpRemaining = {0,0};
else

gnStatsTotalSongCount[pn] = 0
gnStatsTotalExpCount[pn] = 0
gnStatsTotalDeathCount[pn] = 0
gnStatsTotalStarCount[pn] = 0

gnStats1StarCount[pn] = 0
gnStats2StarCount[pn] = 0
gnStats3StarCount[pn] = 0
gnStats4StarCount[pn] = 0

gnStatsLevel[pn] = 1
gnStatsExpRemaining[pn] = 0
end


--------------------------
-------STAR DISPLAY-------
--------------------------
-- Count the number of 1Stars (Tier 4)
if stat == 1 then
	for s=1, table.getn(gnStatsGradeDifficulties) do
    --mode, diff, tier
	gnStats1StarCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(gnStatsMode[mode],gnStatsGradeDifficulties[s],GRADE_TIER04);
	end
	return gnStats1StarCount[pn];
end

-- Count the number of 2Stars (Tier 3)
if stat == 2 then
	for s=1, table.getn(gnStatsGradeDifficulties) do
	gnStats2StarCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(gnStatsMode[mode],gnStatsGradeDifficulties[s],GRADE_TIER03);
	end
	return gnStats2StarCount[pn];
end

-- Count the number of 3Stars (Tier 2)
if stat == 3 then
	for s=1, table.getn(gnStatsGradeDifficulties) do
	gnStats3StarCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(gnStatsMode[mode],gnStatsGradeDifficulties[s],GRADE_TIER02);
	end
	return gnStats3StarCount[pn];
end

-- Count the number of 4Stars (Tier 1)
if stat == 4 then
	for s=1, table.getn(gnStatsGradeDifficulties) do
	gnStats4StarCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(gnStatsMode[mode],gnStatsGradeDifficulties[s],GRADE_TIER01);
	end
	return gnStats4StarCount[pn];
end


-------------------------
---ACHIEVEMENT DISPLAY---
-------------------------
-- Count the total number of songs played
if stat == 5 then
	gnStatsTotalSongCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalNumSongsPlayed()
	return gnStatsTotalSongCount[pn];
end

-- Count the total number of EXP earned
if stat == 6 then
	if gnStatsTotalSongCount[pn] == 0 then
            gnStatsTotalExpCount[pn] = gnStatsTotalExpCount[pn] + (PROFILEMAN:GetProfile(pn):GetTotalNumSongsPlayed()) -- there used to be ((s+17)/17) here, I don't really get what it was doing because s was from the for loop ... some sort of weighting?
	end
	return gnStatsTotalExpCount[pn];
end

-- Count the total number of player deaths (Tier 17)
if stat == 7 then
	for s=1, table.getn(gnStatsGradeDifficulties) do
	gnStatsTotalDeathCount[pn] = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(gnStatsMode[mode],gnStatsGradeDifficulties[s],GRADE_TIER17);
	end
	return gnStatsTotalDeathCount[pn];
end

-- Count the total number of stars earned *** MUST NOT RUN UNTIL AFTER STAT 1, 2 ,3 & 4 HAVE BEEN RUN ***
if stat == 8 then
	gnStatsTotalStarCount[pn] = gnStats1StarCount[pn] + gnStats2StarCount[pn] + gnStats3StarCount[pn] + gnStats4StarCount[pn];
	return gnStatsTotalStarCount[pn];
end


-------------------------
------LEVEL DISPLAY------
-------------------------
-- Determine the player's current level *** MUST NOT RUN UNTIL AFTER STAT 6 HAS BEEN RUN ***
if stat == 9 then
	gnStatsLevel[pn] = gnStatsTotalExpCount[pn]
	e = 10 -- EXP Curve starts at 10
	for s = 0, 1, 100 do -- Max Level is 100
		gnStatsTotalExpCount[pn] = gnStatsTotalExpCount[pn] - e; -- subtract curve and level up on every 0
		gnStatsLevel[pn] = gnStatsLevel[pn] + 1;
		if gnStatsTotalExpCount[pn] < 1 then
			gnStatsLevel[pn] = gnStatsLevel[pn] - 1; -- didn't level up on this run
			gnStatsExpRemaining[pn] = gnStatsTotalExpCount[pn] + e; -- get remaining EXP amount
			gnStatsExpRemaining[pn] = gnStatsExpRemaining[pn] / e; -- make it into a percentage of the current curve
			return gnStatsLevel[pn];
		end
		e = e * 1.2
	end
	gnStatsExpRemaining[pn] = 100;  -- if the loop completes on its own, you've hit level 100!
	gnStatsLevel[pn] = 100;
	return gnStatsLevel[pn];
end

-- Fetch the remaining EXP *** MUST NOT RUN UNTIL AFTER STAT 9 HAS BEEN RUN ***
if stat == 10 then
	return gnStatsExpRemaining[pn]
end
end




-- ===GET PLAYER NAME===
-- Retrieves the profile name of each player
function GetSinglePlayerName( pl )
	if GAMESTATE:IsPlayerEnabled(pl) and PROFILEMAN:IsPersistentProfile(pl) then
		return GAMESTATE:GetPlayerDisplayName(pl)
	end
return ''
end





-- ===PLAYER NAME CHECK===
-- Returns true if it finds a player you're looking for
function CheckSinglePlayerName( nm, pl )
	if GAMESTATE:IsPlayerEnabled(pl) and PROFILEMAN:IsPersistentProfile(pl) then
		if GAMESTATE:GetPlayerDisplayName(pl) == nm then -- If the selected player has the desired name
			gnPlayerNames[pl+1] = nm
			return true
		end
	end
return false
end





-- ===GLOBAL CHECK IF ANY PLAYER HAS A CERTAIN MEMORY CARD NAME===
-- Check to see if any player has a memory card of the specified name
function CheckPlayerName( nm )
	if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			if GAMESTATE:GetPlayerDisplayName(PLAYER_1) == nm or GAMESTATE:GetPlayerDisplayName(PLAYER_2) == nm then -- Both have USB Enabled
				return true
			end
		else
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
				if GAMESTATE:GetPlayerDisplayName(PLAYER_1) == nm then -- P1 has USB
					return true
				end
			end
		end
	else
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			if GAMESTATE:GetPlayerDisplayName(PLAYER_2) == nm then -- P2 has USB
				return true
			end
		end
	end
return false
end

-- XXX: Find a better place for this
function DoGradeEffects( Actor, Tier )
    -- Star grades
    if Tier <= 4 then
        for i=1,5-Tier do
			Actor:queuecommand('PlaySound'..i)
			Actor:diffusealpha(0.25*i)
			Actor:accelerate(0.25)
			Actor:diffusealpha(0);
			Actor:sleep(0.05)
        end
    else
        SOUND:PlayOnce( GradeSound(0) )
        Actor:diffusealpha(0.075);
        Actor:accelerate(0.25);
        Actor:diffusealpha(0);
    end
end