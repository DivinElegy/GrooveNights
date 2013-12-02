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
		return -176;
		else
		return 185;
		end
	end
return 0
end





-- ===SET SCREEN SPECIFIC VARIABLES===
function SetVariablesFor(scn)
if scn == 'ScreenCompany' then
-- nothing to add yet
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
	
InitSpeedMods()

end


if scn == 'ScreenSelectPlayMode' then
-- nothing to add yet
end


if scn == 'ScreenSelectStyle2' then
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
	gnZoom3 = 0.7;
	gnZoom4 = 0.7;
	gnMaxZoom = 0.6;
	gnMinZoom = 0.4;
end


if scn == 'ScreenSelectMusic' then
	if gnRateRestore == nil then
		gnRateRestore = 0;
		end
	if curRate == nil then curRate = 1 end
	gnGoBack = 0;
	gnBlazedP1 = 0;
	gnBlazedP2 = 0;
	gnP1Ready = 0;
	gnP2Ready = 0;
	gnJudgeCount = 0;
	gnTotalDone = 0;
	gnSpecialUSB = false;
	if gnStatFrequency == nil then gnStatFrequency = 0; end
	gnStatFrequency = gnStatFrequency + 1;
end


if scn == 'ScreenPlayerOptions' then
	if gnRateRestore == nil then
		gnRateRestore = 0;
		end
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
	
	gnP1Winning = false;
	gnP2Winning = false;
	gnLowHealth = false;
	gnRateRestore = 0;
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
end


if scn == 'ScreenEvaluation' then
gnSongCount = gnSongCount + 1;
end


if scn == 'ScreenNameEntry' then
-- nothing to add yet
end


if scn == 'ScreenEnding' then
gnScreenEnd = false;
end


return 0
end












