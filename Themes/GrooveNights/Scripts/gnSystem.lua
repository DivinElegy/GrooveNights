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
RateRestoreMessage(false);
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
	gnStaminaSongPercent = 0;
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
end


if scn == 'ScreenStage' then
ScreenTransitionWhoosh('short');
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
	gnStaminaTimer = 0;
	gnRandomVoice = math.random(1,5); 
	gnRandomMark1 = math.random(5,92);
	gnRandomMark2 = math.random(5,92);
	gnRandomMark3 = math.random(5,92);
	gnStaminaSongPercent = 0;
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
	gnSoundCheck = true;
	gnAward = 0;
end



if scn == 'ScreenEvaluation' then
ScreenTransitionWhoosh('short');
gnSongCount = gnSongCount + 1;
RateRestoreMessage(false);
end



if scn == 'GradeModels' then
if getSpecialUSB() then
	if gnDimBGMSeconds == nil then
		gnDimBGMSeconds = 0.1;
		end
	if gnDimBGMSeconds == 0 then
		gnDimBGMSeconds = 0.1;
		end
	SOUND:DimMusic( 0, gnDimBGMSeconds )
	end
end



if scn == 'ScreenNameEntry' then
ScreenTransitionWhoosh('short');
-- nothing to add yet
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
		end 
	SCREENMAN:SystemMessage('Rate Modifier has been restored to 1.0x')
	end
end





-- ===PLAY SCREEN TRANSITION SOUND===
-- Makes the arrow go whooshy whoosh
function ScreenTransitionWhoosh(i)
	local Path = THEME:GetPath( EC_SOUNDS, 'gnScreenTransition', 'whoosh '..i );
	SOUND:PlayOnce(Path);
end

--easter eggs
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
 
RegisterEasterEgg("BlazeIt", BPMEasterEggs)
RegisterEasterEgg("NoScope", BPMEasterEggs)
RegisterEasterEgg("GoodLuckCameron", GoodLuckCameronEasterEgg)

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
