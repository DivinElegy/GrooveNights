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

-- ===TABLE OF CONTENTS===
-- COPY THE BELOW TERMS AND DO A WORD FIND FOR IT SO THAT YOU CAN EDIT DIFFERENT SETTINGS

-- CHANGE FREQUENCY OF USB STAT LOADS
-- CHANGE MACHINE LOCATION TEXT
-- CHANGE THE RATE MODS
-- SHOW/HIDE ARROW SPEED INDICATORS
-- SHOW/HIDE "WINNING PLAYER" CROWNS
-- SHOW/HIDE TOTAL PLAYTIME
-- ALLOW MENU BUTTON TO RESTART SONG

--> COMBO STUFF
-- -- DEFAULT COMBO SIZE
-- -- TOGGLE COMBO SIZE INCREASES
-- -- TOGGLE COMBO BOUNCE ANIMATION

--> JUDGMENT STUFF
-- -- DEFAULT JUDGMENT SIZE
-- -- DEFAULT JUDGMENT OPACITY
-- -- TOGGLE JUDGMENT BOUNCE ANIMATION


-- MAKE IT KNOWN THAT THE GAME IS USING GROOVENIGHTS
-- MENU AND SYSTEM NAMES
-- PLAYER HAS A SPECIAL USB NAME?
-- ADD FROM CENTER
-- CUSTOM RESULT SCREENS
-- CUSTOM AVATARS
















-- ===CHANGE FREQUENCY OF USB STAT LOADS===
-- This means by default USB stats load once and then don't load again for 10 songs, change that value here.
function getMaxStatFrequency()
	return 8
end




-- ===CHANGE MACHINE LOCATION TEXT===
-- Set a location for the machine you're playing on, ie: ITG Jayce's House
function getTheCurrentMachine()
return "GrooveNights Theme by Jayce"
end


-- ===SHOW/HIDE ARROW SPEED INDICATORS===
-- If you want the Arrow Speed Indicators to appear in the options menu you can switch them on here.
-- It has been reported that they can sometimes cause lag during 2-Player mode so I opted to disable it by default.
function ShowArrowIndicators()
return true;
end




-- ===SHOW/HIDE "WINNING PLAYER" CROWNS===
-- If you find the Crowns to be too annoying then change it from true to false here.
-- That is, if they even appear at all, if they don't you'll need to add "CompareScores=1" to your Stepmania.ini
-- or Static.ini files in the \Data\ folder.
function TournamentCrownEnabled()
return true
end




-- ===SHOW/HIDE TOTAL PLAYTIME===
-- If you want to show and record the total playtime of each session you can do so here.
-- You can also toggle whether or not it should only appear in event mode or not.
function PlayTimeEnabled()
if GAMESTATE:IsEventMode() then
-- Event Mode
	return true
	else
-- Regular Mode
	return false
	end
end





-- ===ALLOW MENU BUTTON TO RESTART SONG===
-- By pressing the menu button when the song has progressed beyond the lowest percentage indicated below
-- You can restart the song so that you don't have to keep reloading the song menu and starting again.
function MenuButtonGiveUp()
-- Set a percentage window of opportunity for the button to restart the song
gnLowestRestartPercent = 0.05;
gnHighestRestartPercent = 99.8;

if gnStaminaSongPercent == nil then gnStaminaSongPercent = 0; end

-- Set to true to enable this feature
return true
end





-- ===DEFAULT COMBO SIZE===
-- The combo size is set to "1" by default as this is the normal size, if you want it 10%
-- bigger then change it to "1.1", just note this only works if ToggleComboSize() below is false.
function DefaultComboSize()
return 1
end




-- ===TOGGLE COMBO SIZE INCREASES===
-- By default the combo on the gameplay screen will increase in size as it has always done.
-- If you don't like that you can switch it off here.
function ToggleComboSizeIncrease()
return true
end



-- ===TOGGLE COMBO BOUNCE ANIMATION===
-- The combo bounces a bit every time you step, if that's distracting you can turn it off here.
function ToggleComboBounce()
return true
end



-- ===TOGGLE COMBO EXPLOSION ANIMATION===
-- When you reach a certain combo an explosion animation appears, you can switch it off here.
function ToggleComboExplosion()
return true
end




-- ===DEFAULT JUDGMENT SIZE===
-- The judgment size is set to "1" by default as this is the normal size, if you want it 10%
-- bigger then change it to "1.1".
function DefaultJudgmentSize()
return 1
end




-- ===DEFAULT JUDGMENT OPACITY===
-- The judgment opacity is set to "1" by default to indicate it is 100% Opaque, if you want it 70%
-- Opaque then change it to "0.7".
function DefaultJudgmentOpacity()
return 1
end




-- ===TOGGLE JUDGMENT BOUNCE ANIMATION===
-- The judgment bounces a bit every time you step, if that's distracting you can turn it off here.
function ToggleJudgmentBounce()
return true
end




-- ===MAKE IT KNOWN THAT THE GAME IS USING GROOVENIGHTS===
-- If you wish for your simfiles to make use of GrooveNights functions from this and other LUA files, do a variable check.
-- Within your simfile's foreground animation you just need to do the following:
--
--		if GrooveNightsIsCurrentTheme then
--		>> Do Stuff Here
--		end
--
-- If the variable is nil then nothing will happen, and if it's not you get to make use of any of the features in this (and the other) lua files.
function MachineIsUsingGrooveNights()
GrooveNightsIsCurrentTheme = true
return true
end





-- ===WIDESCREEN STUFF===
-- I'm lazy so widescreen support is super sloppy, best just to stick to 4:3, 16:9 and 16:10 haha.
gnZoomRatio = (SCREEN_WIDTH/640);
gnAspectRatio = (SCREEN_WIDTH/SCREEN_HEIGHT);

function VideoReduction()
if gnZoomRatio > 1 then
	if gnAspectRatio > 1.7 and gnAspectRatio < 1.8 then
		return 0.95
		end
	if gnAspectRatio > 1.55 and gnAspectRatio < 1.65 then
		return 0.97
		end
	end
return 1
end

function VideoVertical()
if gnZoomRatio > 1 then
	return 2 * gnZoomRatio
	end
return 0
end

function VideoHorizontal()
if gnZoomRatio > 1 then
	return 17.5 * gnZoomRatio
	end
return 0
end

function CourseHorizontal()
if gnZoomRatio > 1 then
	if gnAspectRatio > 1.7 and gnAspectRatio < 1.8 then
		return 80 * gnZoomRatio
		end
	if gnAspectRatio > 1.55 and gnAspectRatio < 1.65 then
		return 53 * gnZoomRatio
		end
	end
return 0
end

function HorizontalRecovery()
if gnZoomRatio > 1 then
	if gnAspectRatio > 1.7 and gnAspectRatio < 1.8 then
		return 1
		end
	if gnAspectRatio > 1.55 and gnAspectRatio < 1.65 then
		return 1.2
		end
	end
return 0
end

function PixelCorrection()
if gnZoomRatio > 1 then
	if gnAspectRatio > 1.7 and gnAspectRatio < 1.8 then
		return 0
		end
	if gnAspectRatio > 1.55 and gnAspectRatio < 1.65 then
		return 1
		end
	end
return 0
end


-- ===MENU AND SYSTEM NAMES===
-- The following are elements of the game that you can change to
-- give it your own custom feel, you can also add conditions so
-- that words change based on the name of a user's memory card,
-- current level, etc.
-- Enjoy!

-- Protip: When placing a lot of text, putting :: makes it go to the next line.
-- Yo::What's Up?

-- Yo
-- What's Up?


		-- [PLAYER DIFFICULTIES]
		-- Novice
		function getTextNovice()
		gnDifficulty = 0;
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return 'Based'
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "no"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'expert'
			end
		return 'Novice'
		end
		
		-- Easy
		function getTextEasy()
		gnDifficulty = 1;
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return 'Based'
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "haha"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'hard'
			end
		return 'Easy'
		end
		
		-- Medium
		function getTextMedium()
		gnDifficulty = 2;
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return 'Based'
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "banana"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'medium'
			end
		return 'Medium'
		end

		-- Hard
		function getTextHard()
		gnDifficulty = 3;
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return 'Based'
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "yes"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'easy'
			end
		return 'Hard'
		end
		
		-- Expert
		function getTextExpert()
		gnDifficulty = 4;
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return 'Based'
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "WinDEU"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'novice'
			end
		return 'Expert'
		end
	

	

	
		-- [SERVICE OPTIONS SCREEN]
		-- Menu Title
		function getTextServiceOptionsTitle()
		return 'SERVICE OPTIONS'
		end
		
		
		
		-- [ARCADE OPTIONS SCREEN]
		-- Menu Title
		function getTextArcadeOptionsTitle()
		return 'SELECT OPTIONS'
		end
		
		
		
		
		-- [PLAY MODE SELECT SCREEN]
		-- Menu Title
		function getTextPlayModeTitle()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'play'
			end
		return 'SELECT PLAY MODE'
		end	
		
		-- DANCE Description
		function getTextDANCEDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'dance on machine perfect'
			end
		return 'Good clean dancing fun for all players'
		end	

		-- MARATHON Description
		function getTextMARATHONDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'mod attack SRT courses'
			end
		return 'Play longer, but look out for scripted modifiers'
		end	
		
		-- SURVIVAL Description
		function getTextSURVIVALDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'SRT clocks'
			end
		return 'Beat the clock by stepping accurately with modifiers'
		end			
		
		
		
		
		-- [PLAYER SELECT SCREEN]
		-- Menu Title
		function getTextPlayersTitle()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'players'
			end
		return 'SELECT PLAYERS'
		end
		
		-- 1 Player Description
		function getTextOnePlayerDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'play once'
			end
		return 'One Player uses 4 Panels'
		end	

		-- 2 Player Description
		function getTextTwoPlayerDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'play twice'
			end
		return 'Two Players, each uses 4 Panels'
		end	
		
		-- Doubles Description
		function getTextDoubleDescription()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'play once then twice'
			end
		return 'One Player uses all 8 Panels'
		end			
		
		
		
		
		-- [SONG SELECT SCREEN]
		-- Menu Title
		function getTextSongSelectTitle()
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return "SONG"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'song'
			end
		return 'CHOOSE A SONG'
		end
		
		
		
		
		-- [COURSE SELECT SCREEN]
		-- Menu Title
		function getTextCourseSelectTitle()
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return "COURSE"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'SRT'
			end
		return 'CHOOSE A COURSE'
		end
		
		
		
		
		-- [PLAYER OPTIONS SCREEN]
		-- Menu Title
		function getTextPlayerOptionsTitle()
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return "MODS"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'mods'
			end
		return 'SELECT MODIFIERS'
		end
		
		
		
		
		-- [RESULTS SCREEN]
		-- Menu Title
		function getTextResultsTitle()
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') or CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
			return "THERE'S THE BOYS"
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "good score, I liked"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'quinstar firework'
			end
		return 'CHECK YOUR STATS'
		end
		
		
		
		-- REPLACE THE STARS
		-- For a Quad it'll reference the image GradeTier0001, so likewise it would reference CustomImage0001 if you keep ..tier on the end
		function getResultStars( tier )
		if CheckPlayerName('Mario') or CheckPlayerName('Super Mario') or CheckPlayerName('Luigi',pn) or CheckPlayerName('Super Luigi',pn) then
			return "MarioTier"..tier
			end
		if CheckPlayerName('Yoshi') or CheckPlayerName('Yoshi the Dinosaur',pn) then
			return "YoshiTier"..tier
			end
		if CheckPlayerName('Bowser') or CheckPlayerName('King Koopa') then
			return "BowserTier"
			end
		if CheckPlayerName('Sonic') or CheckPlayerName('Sonic the Hedgehog') or CheckPlayerName('Tails') or CheckPlayerName('Tails Prower') or CheckPlayerName('Knuckles') or CheckPlayerName('Knuckles the Echidna') or CheckPlayerName('Eggman') or CheckPlayerName('Dr Eggman') or CheckPlayerName('Robotnik') or CheckPlayerName('Dr Robotnik') then
			return "SonicTier"
			end
		if CheckPlayerName('DK') or CheckPlayerName('Donkey Kong') or CheckPlayerName('Diddy') or CheckPlayerName('Diddy Kong') or CheckPlayerName('Dixie') or CheckPlayerName('Dixie Kong') or CheckPlayerName('Zinger') or CheckPlayerName('Wasp') or CheckPlayerName('Bee') then
			return "DKTier"
			end
		if CheckPlayerName('K Rool') or CheckPlayerName('King K Rool') or CheckPlayerName('Kaptain K Rool') then
			return "KRoolTier"
			end
		if CheckPlayerName('Enguarde') or CheckPlayerName('Enguarde the Swordfish') or CheckPlayerName('Swordfish') then
			return "EnguardeTier"
			end
		if CheckPlayerName('Rambi') or CheckPlayerName('Rambi the Rhino') or CheckPlayerName('Rhino') then
			return "RambiTier"
			end
		if CheckPlayerName('Winky') or CheckPlayerName('Winky the Frog') or CheckPlayerName('Frog') then
			return "WinkyTier"
			end
		if CheckPlayerName('Expresso') or CheckPlayerName('Expresso the Ostrich') or CheckPlayerName('Ostrich') then
			return "ExpressoTier"
			end
		if CheckPlayerName('Bomberman') or CheckPlayerName('Bomb') or CheckPlayerName('Hudson') then
			return "BombermanTier"
			end
		if CheckPlayerName('Megaman') or CheckPlayerName('X') or CheckPlayerName('Zero') or CheckPlayerName('0') then
			return "MegamanTier"..tier
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "TaroNukeTier"..tier
			end
		return 'GradeTier'..tier
		end
		
		
		
		
		-- Just Barely Text
		function getTextBarely()
		if CheckPlayerName('REEN') or CheckPlayerName('SteveReen') then
			return "YOLO"
			end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "kill taro4012"
			end
		if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
			return "SWAG!"
			end	
		if CheckPlayerName('ALEX') or CheckPlayerName('ITGAlex') then
			return "BEAST!"
			end	
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'goooooo'
			end
		return 'Barely!'
		end

		
		
		
		-- Full Fantastic Text
		function getTextFullFantastic()
		if CheckPlayerName('REEN') or CheckPlayerName('SteveReen') then
		return 'YOLO SWAG SWAG SWAG'
		end
		if CheckPlayerName('CAM') or CheckPlayerName('Cameron') or CheckPlayerName('JCE') or CheckPlayerName('(-[Jayce]-)') then
		return 'First in the World!'
		end
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "angry grandpa"
			end
		if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
			return "I think they call that chubs"
			end	
		if CheckPlayerName('ALEX') or CheckPlayerName('ITGAlex') then
			return "YOU CHEATED!"
			end	
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'perfect or not perfect'
			end
		return 'Flawless Performance!'
		end

		
		
		
		-- Full Excellent Text
		function getTextFullExcellent()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'good'
			end
		return 'No Greats!'
		end

		
		
		
		-- Single Digit Excellents Text
		function getTextSDE()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return '10'
			end
		return 'Fewer than 10 Excellents!'
		end

		
		
		
		-- 1 Excellent Text
		function getTextOneExcellent()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return '1'
			end
		return '1 Excellent'
		end

		
		
		
		-- 100% Greats Text
		function getTextFullGreats()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'greenstar'
			end
		return 'Green Quad!'
		end

		
		
		
		-- 90% Greats Text
		function getTextNinetyGreats()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return '90'
			end
		return '90% Greats'
		end

		
		
		
		-- 80% Greats Text
		function getTextEightyGreats()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return '80'
			end
		return '80% Greats'
		end

		
		
		
		-- Single Digit Greats Text
		function getTextSDG()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'some green'
			end
		return 'Fewer than 10 Greats!'
		end

		
		
		
		-- Full Combo Text
		function getTextFullCombo()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'combo'
			end
		return 'Full Great Combo'
		end
		
		
		
		
		-- 1 Great Text
		function getTextOneGreat()
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return '1 green'
			end
		return '1 Great'
		end

		
		
		
		-- Peak Combo Text
		function getTextPeakCombo( cmb )
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return cmb..' steps'
			end
		return cmb..' Peak Combo!'
		end

		
		
		
		-- Machine Record #
		function getTextMachineRecord( rec )
		if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
			return "good #"..rec
			end
		if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
			return "I don't give a shit Shit SHIT"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return rec..' scores'
			end
		return 'Machine Record #'..rec
		end
		
		
		
		
		-- Personal Record # (It's hidden in the metrics by default but it's here if you want it)
		function getTextPersonalRecord( rec )
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return rec..' scores'
			end
		return 'Personal Record #'..rec
		end
		
		
		
		
		-- [NAME ENTRY SCREEN]
		-- Menu Title
		function getTextNameEntryTitle()
		if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
			return "NAME"
			end
		if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
			return 'name'
			end
		return "HERE ARE YOUR RESULTS"
		end
		
		
		
		
-- ===PLAYER HAS A SPECIAL USB NAME?===
function getSpecialUSB()
if gnSpecialUSB == true then
	return true
	else
	return false
	end
end

-- ===ADD FROM CENTER===
-- This first function determines where the special files appear from center screen (look beyond this function).
-- You can change the values for each player to move things around relative to their
-- playing side, leaving each value at 0 will mean it's centered.
--
-- Keep in mind though, this will affect all images for all conditions, so it's better to set the Addx variables 
-- found further down the track.
function AddFromCenter( coord , tier , pn )
if tier == 'Quad' then
	gnDummy = getCustomQuadImageOrVideo()
	end
	
if tier == 'Tri' then
	gnDummy = getCustomTriImageOrVideo()
	end
	
if tier == 'Double' then
	gnDummy = getCustomDoubleImageOrVideo()
	end
	
if tier == 'Single' then
	gnDummy = getCustomSingleImageOrVideo()
	end
	
if tier == 'Normal' then
	gnDummy = getCustomNormalImageOrVideo()
	end
	
if tier == 'Failed' then
	gnDummy = getCustomFailedImageOrVideo()
	end
	
if tier == 'Test' then
	gnDummy = getCustomTestImageOrVideo()
	end

if gnAddxFromCenterP1 == nil then gnAddxFromCenterP1 = 0; end
if gnAddyFromCenterP1 == nil then gnAddyFromCenterP1 = 0; end
if gnAddxFromCenterP2 == nil then gnAddxFromCenterP2 = 0; end
if gnAddyFromCenterP2 == nil then gnAddyFromCenterP2 = 0; end

if pn == PLAYER_1 then
	if coord == 'x' then
		return 0+gnAddxFromCenterP1
		end
	if coord == 'y' then
		return 0+gnAddyFromCenterP1
		end
	end
if pn == PLAYER_2 then
	if coord == 'x' then
		return 0+gnAddxFromCenterP2
		end
	if coord == 'y' then
		return 0+gnAddyFromCenterP2
		end
	end
-- You should never reach here, but if for some reason you do, it's centered anyway.
return 0
end


-- ===CUSTOM RESULT SCREENS===
-- Here you can make special images or videos display for different grades, all files
-- should go in the Sounds folder and can be named whatever you want, so long as you
-- reference them properly, you can determine how long it's on screen, how long it dims
-- the music (if you want that), and so forth, a bit further down you can also play
-- custom sounds if you add them into the sounds folder.


-- Quad
-- This is the GrooveNights example, Cameron and I love 'Fireworks' by JonTron so 
-- this is our victory video, you can add your own names here or copy the scripts marked below
-- to make reference to your own files.
function getCustomQuadImageOrVideo()
	if CheckPlayerName('JCE') or CheckPlayerName('(-[Jayce]-)') or CheckPlayerName('CAM') or CheckPlayerName('Cameron') then			-- Copy from here
		gnSpecialUSB = true
		gnDimBGMSeconds = 15;
		gnOnScreenSeconds = 15;
		gnDimBackgroundSeconds = 15;
		gnAddxFromCenterP1 = 0;
		gnAddyFromCenterP1 = 0;
		gnAddxFromCenterP2 = 0;
		gnAddyFromCenterP2 = 0;
		gnZoom = 1;
		gnDiffusealpha = 1;
		return 'gnJonTronQuad video.avi'
		end																	-- To here
		
	if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then			-- Copy from here
		gnSpecialUSB = true
		gnDimBGMSeconds = 0;
		gnOnScreenSeconds = 999;
		gnDimBackgroundSeconds = 0;
		gnAddxFromCenterP1 = -50;
		gnAddyFromCenterP1 = -97;
		gnAddxFromCenterP2 = 80;
		gnAddyFromCenterP2 = -97;
		gnZoom = 1;
		gnDiffusealpha = 1;
		return 'gnPachirisuQuad image.sprite'
		end																	-- To here

	-- Paste and edit here
	
	
	
	
	-- Ignore all of this stuff
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;
	
	return '_blank.png'
end

function getCustomQuadSound()
	if CheckPlayerName('(-[Jayce]-)') or CheckPlayerName('Cameron') or CheckPlayerName('JCE') or CheckPlayerName('CAM') then 	-- Copy from here
		local Path = THEME:GetPath( EC_SOUNDS, 'gnJonTronQuad', 'sound' )	
		return Path
		end																	-- To here
		
	if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then 			-- Copy from here
		local Path = THEME:GetPath( EC_SOUNDS, 'gnPachirisuQuad', 'sound' )	
		return Path
		end																	-- To here
		
	-- Paste and edit here	
	
	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Tri
function getCustomTriImageOrVideo()

	-- Paste and edit here
	
	
	
	-- Ignore this
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;	
	
	return '_blank.png'
end

function getCustomTriSound()
		
	-- Paste and edit here

	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end
		
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Double
function getCustomDoubleImageOrVideo()

	-- Paste and edit here

	
	
	-- Ignore this
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;	
	
	return '_blank.png'
end

function getCustomDoubleSound()
		
	-- Paste and edit here

	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Single
function getCustomSingleImageOrVideo()

	-- Paste and edit here

	
	
	-- Ignore this
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;	
	
	return '_blank.png'
end

function getCustomSingleSound()
		
	-- Paste and edit here

	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Normal (Grades D to S+)
-- You can make functions for specific grades if you wish by copying this one and renaming it from 'Normal'
-- to something like 'C', you'd also need to go into graphics/_grademodels/TierXX.xml and edit the 2 references
-- for getCustomNormalImageOrVideo() and getCustomNormalSound(), the tiers go from Tier01 (quad) to Tier17 (D Grade)

function getCustomNormalImageOrVideo()
		
	-- Paste and edit here
	
	
	-- Ignore this
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;	
	
	return '_blank.png'
end

function getCustomNormalSound()
		
	-- Paste and edit here

	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Failed (Grade F)
function getCustomFailedImageOrVideo()

	if CheckPlayerName('ITGAlex') or CheckPlayerName('ALEX') or CheckPlayerName('SteveReen') or CheckPlayerName('REEN') then			-- Copy from here
		gnSpecialUSB = true
		gnDimBGMSeconds = 5.5;
		gnOnScreenSeconds = 5.5;
		gnDimBackgroundSeconds = 5.5;
		gnAddxFromCenterP1 = 0;
		gnAddyFromCenterP1 = 0;
		gnAddxFromCenterP2 = 0;
		gnAddyFromCenterP2 = 0;
		gnZoom = 0.8;
		gnDiffusealpha = 1;
		return 'gnRhythmHeavenFail video.avi'
		end																	-- To here
		
	-- Paste and edit here

	
	
	-- Ignore this
	gnSpecialUSB = false
	gnDimBGMSeconds = 0;
	gnOnScreenSeconds = 0;
	gnDimBackgroundSeconds = 0;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 0;	
	
	return '_blank.png'
end

function getCustomFailedSound()
		
	if CheckPlayerName('ALEX') or CheckPlayerName('ITGAlex') or CheckPlayerName('SteveReen') or CheckPlayerName('REEN') then 	-- Copy from here
	local Path = THEME:GetPath( EC_SOUNDS, 'gnRhythmHeavenFail', 'sound' )	
	return Path
	end																	-- To here
		
	-- Paste and edit here

	
	
	-- Ignore this
	local Path = THEME:GetPath( EC_SOUNDS, '', '_silent' )
	return Path
end



-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- TEST
-- Test environment, won't actually appear anywhere...

function getCustomTestImageOrVideo()
		
	-- Paste and edit here
	gnSpecialUSB = true
	gnDimBGMSeconds = 15;
	gnOnScreenSeconds = 15;
	gnDimBackgroundSeconds = 15;
	gnAddxFromCenterP1 = 0;
	gnAddyFromCenterP1 = 0;
	gnAddxFromCenterP2 = 0;
	gnAddyFromCenterP2 = 0;
	gnZoom = 1;
	gnDiffusealpha = 1;
	return 'gnJonTronQuad video.avi'
end

function getCustomTestSound()
		
	local Path = THEME:GetPath( EC_SOUNDS, 'gnJonTronQuad', 'sound' )	
	return Path

end



-- ===SYSTEM STUFF===
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...


-- Play different sounds on the results menu
function GradeSound( snd )
	local Path = THEME:GetPath( EC_SOUNDS, 'gnGradeUp', ''..snd..'')
	return Path
	end
	
-- Stop the DEMO screen from showing during Event Mode (Pretty sure it does this anyway, but just in case)
function EventTitle()
	if GAMESTATE:IsEventMode() then
		return -1;
		else
		return 60;
		end
end



-- This controls the 'Go Back' button... You should probably just leave it alone.

function BackButton()
    local function Load(self, list, pn) end
    local function Save(self, list, pn)
        if list[1] and (gnScreenSelectMusicTimer > 5) and (gnScreenPlayerOptionsTimer > 5) then
            SCREENMAN:SetNewScreen('ScreenSelectMusic') 
        elseif list[1] then
            SCREENMAN:SystemMessage('Not Enough Time Left to Go Back!') 
        end
    end

    local Names = {'Return to Music Selection'}
    local Params = { Name = "BackButton", SelectType = "SelectMultiple", OneChoiceForAllPlayers = GAMESTATE:IsPlayerEnabled(PLAYER_1) }
    
    return CreateOptionRow(Params, Names, Load, Save)
end

-- This sets the menu timer to its last recorded value so that you can't cheat the menus

function GetTimer( scr )
if gnScreenSelectMusicTimer == nil then
	gnScreenSelectMusicTimer = gnDefaultSSM;
	end
	
if gnScreenPlayerOptionsTimer == nil then
	gnScreenPlayerOptionsTimer = gnDefaultSPO;
	end
	
if scr == 'ScreenEvaluation' then
	gnScreenSelectMusicTimer = gnDefaultSSM;			--	If you're looking to change this, you also need to change it in Branches.lua (very top)
	gnScreenPlayerOptionsTimer = gnDefaultSPO;			--	If you're looking to change this, you also need to change it in Branches.lua (very top)
	gnScreenEvaluationTimer = 30;
	return math.ceil(gnScreenEvaluationTimer)
	end
	
if scr == 'ScreenSelectMusic' then
	if gnScreenSelectMusicTimer == nil then
		gnScreenSelectMusicTimer = gnDefaultSSM;		
		end
	return math.ceil(gnScreenSelectMusicTimer)
	end
	
if scr == 'ScreenPlayerOptions' then
	if gnScreenPlayerOptionsTimer == nil then
		gnScreenPlayerOptionsTimer = gnDefaultSPO;	
		end
	return math.ceil(gnScreenPlayerOptionsTimer)
	end
	
return 0;

end

	
bpm = { "1", "2", "3" }

function GetRateMods()
	return { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "2.0x"}
end

function GetBaseSpeeds()
    if GetSpeedModRowType() == "pro" then
        return { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" }
    end
        
    if GetSpeedModRowType() == "advanced" then
        if OPENITG then baseSpeed = { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000", "m400", "m425", "m450", "m475", "m500", "m525", "m550", "m575", "m600", "m625", "m650", "m675", "m700", "m725", "m750", "m775", "m800", "m825", "m850", "m875", "m900", "m925", "m950", "m975", "m1000" }
        else baseSpeed = { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000" }
        end
    end

    if GetSpeedModRowType() == "basic" then
        if OPENITG then baseSpeed = { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "6x", "c450", "m450" }
        else baseSpeed = { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "5.5x", "6x", "c450" }
        end
    end
end   

function GetExtraSpeeds()
	if GetSpeedModRowType() == "pro" then 
		return { "0", "+0.25", "+0.5", "+0.75", "+0.1", "+0.2", "+0.3", "+0.4", "+0.6", "+0.7", "+0.8", "+0.9" }
	end
	
	if GetSpeedModRowType() == "advanced" then
		return { "0" }
	end
	
	if GetSpeedModRowType() == "basic" then
		return { "0" }
	end
end

function GetSpeedModTypes() 
    if OPENITG then
        return { "x-mod", "c-mod", "m-mod" }
    else
        return { "x-mod", "c-mod" }
    end
end

function RateMods()
	local modList = GetRateMods();

	local function Load(self, list, pn)
		for n = 1, table.getn(modList) do
			if GAMESTATE:PlayerIsUsingModifier(pn,modList[n]..'music') then list[n] = true else list[n] = false end
		end
	end

	local function Save(self, list, pn)
		for n = 1, table.getn(modList) do
			if list[n] then
				GAMESTATE:ApplyGameCommand('mod,'..modList[n]..'music',pn)
				--ApplyRateAdjust()
				Trace("The pn for ratemod is " .. pn)
				MESSAGEMAN:Broadcast('RateModChanged')
			end
		end
	end

	local Params = { Name = "Rate" }
	return CreateOptionRow( Params, modList, Load, Save )
end

-- Stamina Mod
StaminaMods = { 0, 0.01, 0.02, 0.03, 0.04, 0.05 }
Stamina = { "None", "Aoreo", "Jayce", "SteveReen", "WinDEU", "Zetorux" }

function StaminaMod()
	local ModList = Stamina
	local t = {
		Name = "Stamina",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = ModList,

		LoadSelections = function(self, list, pn)
		for n = 1, table.getn(ModList) do
			if StaminaMods[n] == 0 then
				s = "no"
				else
				s = StaminaMods[n].."%"
				end
			if GAMESTATE:PlayerIsUsingModifier(pn,s..' flip') then
				list[n] = true; 
				else 
				list[n] = false ;
				end
			end
		end,

		SaveSelections = function(self, list, pn)
		p = pn + 1;
		for n = 1, table.getn(ModList) do
			if list[n] then
				s = n;
				end
		end
		
		ModStamina = StaminaMods[s];
			if ModStamina == 0 then
				ModStamina = "no"
				else
				ModStamina = ModStamina.."%"
				end
			
		GAMESTATE:ApplyGameCommand('mod, no flip',p);
		GAMESTATE:ApplyGameCommand('mod,'..ModStamina..' flip',p);
		if ModStamina ~= 'no' then
			gnStamina = Stamina[s]
			else
			gnStamina = '';
			end
		GAMESTATE:SetEnv('StaminaMod','1');
		end
	}
	setmetatable(t, t)
	return t
end





-- Difficulty Value
function GetCurrentSongDifficulty( pn )
local steps = GAMESTATE:GetCurrentSteps(pn)
gnNewDifficulty = "";
if not GAMESTATE:IsCourseMode() then
	if steps == nil then 
		return ""
		else
		if steps:GetDifficulty() == DIFFICULTY_EDIT then 
			gnNewDifficulty = steps:GetDescription()
			gnDifficulty = 5
			else
			if steps:GetDifficulty() == DIFFICULTY_BEGINNER then 
				gnNewDifficulty = getTextNovice()
				end
			if steps:GetDifficulty() == DIFFICULTY_EASY then 
				gnNewDifficulty = getTextEasy()
				end
			if steps:GetDifficulty() == DIFFICULTY_MEDIUM then 
				gnNewDifficulty = getTextMedium()
				end
			if steps:GetDifficulty() == DIFFICULTY_HARD then 
				gnNewDifficulty = getTextHard()
				end
			if steps:GetDifficulty() == DIFFICULTY_CHALLENGE then 
				gnNewDifficulty = getTextExpert()
				end
			end
		end
	end
gnNewDifficulty = gnNewDifficulty
return gnNewDifficulty
end

-- Difficulty Meter
function GetCurrentSongMeter( pn )
	local steps = GAMESTATE:GetCurrentSteps(pn)
	if steps == nil then 
		return ""
	else
		if steps:GetDifficulty() == DIFFICULTY_EDIT then 
			gnNewDifficulty = steps:GetDescription()
			else
			if steps:GetDifficulty() == DIFFICULTY_BEGINNER then 
				gnNewDifficulty = getTextNovice()
				end
			if steps:GetDifficulty() == DIFFICULTY_EASY then 
				gnNewDifficulty = getTextEasy()
				end
			if steps:GetDifficulty() == DIFFICULTY_MEDIUM then 
				gnNewDifficulty = getTextMedium()
				end
			if steps:GetDifficulty() == DIFFICULTY_HARD then 
				gnNewDifficulty = getTextHard()
				end
			if steps:GetDifficulty() == DIFFICULTY_CHALLENGE then 
				gnNewDifficulty = getTextExpert()
				end
			end
		return steps:GetMeter();
	end
end


-- Song Directory
function SSMSongLocText( actor )
   Trace( "SSMSongLocText" )
   local song = GAMESTATE:GetCurrentSong();
   local text = ""
   if song then
	local fulldir = song:GetSongDir();
	local short = string.sub(fulldir, 8, -2);
	local shorter = string.sub(short,1,5);
	if shorter == "n The" then
		short = "Memory Card"..string.sub(fulldir, 22, -2);
	end
	text = short
   end
   if actor then
	actor:settext( text )
	end
end



-- Custom More/Exit
function GetPlayersDone()
gnTotalDone = gnTotalDone + 1;
	
if (GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2)) then
	if gnTotalDone == 0 then
		return "#BD5E5E"
		end
	if gnTotalDone == 2 then
		return "#89B7D7"
		end
	if gnTotalDone == 1 then
		return "#BD5E5E"
		end
	else
	if gnTotalDone == 1 then
		return "#89B7D7"
		else
		return "#BD5E5E"
		end
	end
gnTotalDone = 0;	
return "#BD5E5E"
end



function GetPlayersUndone()
gnTotalDone = gnTotalDone + 1;
	
if (GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2)) then
	if gnTotalDone == 0 then
		return "#FFFFFF"
		end
	if gnTotalDone == 2 then
		return "#89B7D7"
		end
	if gnTotalDone == 1 then
		return "#BD5E5E"
		end
	else
	if gnTotalDone == 1 then
		return "#89B7D7"
		else
		return "#FFFFFF"
		end
	end
gnTotalDone = 0;	
return "#FFFFFF"
end
-- Step Artist P1
function GetStepsDescriptionText1( actor )
	Trace( "GetStepsDescriptionText1" )
	gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_1)
	if gnStepArtist then
	gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDescription()
		if gnStepArtist == nil then
			actor:settext( '' )
		else
			if gnStepArtist == '' then
				actor:settext('Unknown');
				end		
			if gnStepArtist == '.' then
				actor:settext('Unknown');
				end	
			if gnStepArtist == 'Blank' then
				actor:settext('Unknown');
				end	
			actor:settext( gnStepArtist )
		end
	else
	actor:settext('');
	end
end


-- Step Artist P2
function GetStepsDescriptionText2( actor )
	Trace( "GetStepsDescriptionText2" )
	gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_2)
	if gnStepArtist then
	gnStepArtist = gnStepArtist:GetDescription()
		if gnStepArtist == nil then
			actor:settext( '' )
		else
			if gnStepArtist == '' then
				actor:settext('Unknown');
				end		
			if gnStepArtist == '.' then
				actor:settext('Unknown');
				end	
			if gnStepArtist == 'Blank' then
				actor:settext('Unknown');
				end	
			actor:settext( gnStepArtist )
		end
	else
	actor:settext('');
	end
end


-- All Stats Bundled into ONE because Arcade Machines HATE ME!!!
function GetPlayerStatsAndAwards( pn )
gnLoadedP1 = false;
gnLoadedP2 = false;

if pn == PLAYER_1 then
	if gnScreenEvaluationFlag then
		gnScreenEvaluationFlag = false;
		return gnTotalP1
		end
	gnStatFrequencyP1 = gnStatFrequencyP1 + 1;
	if gnStatFrequencyP1 >= getMaxStatFrequency() then
		gnStatFrequencyP1 = 0;
		gnSongsP1 = 0;
		gnSongsP1Total = 0;
		gnTotalP1 = 0;
		gnStarsTotalP1 = 0;
		gnSinglesSingleP1 = 0;
		gnDoublesSingleP1 = 0;
		gnTrisSingleP1 = 0;
		gnQuadsSingleP1 = 0;
		gnSinglesDoubleP1 = 0;
		gnDoublesDoubleP1 = 0;
		gnTrisDoubleP1 = 0;
		gnQuadsDoubleP1 = 0;
		
		if not GAMESTATE:PlayerUsingBothSides(PLAYER_1) then
		-- BEGINNER
		gnMultiplierP1 = 1;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- EASY
		gnMultiplierP1 = 2;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		
		-- MEDIUM
		gnMultiplierP1 = 3;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- HARD
		gnMultiplierP1 = 4;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- CHALLENGE
		gnMultiplierP1 = 5;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- EDIT
		gnMultiplierP1 = 6;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsSingleP1 = gnQuadsSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisSingleP1 = gnTrisSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesSingleP1 = gnDoublesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesSingleP1 = gnSinglesSingleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		end
		
		if GAMESTATE:PlayerUsingBothSides(PLAYER_1) then
		-- BEGINNER
		gnMultiplierP1 = 1;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- EASY
		gnMultiplierP1 = 2;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		
		-- MEDIUM
		gnMultiplierP1 = 3;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- HARD
		gnMultiplierP1 = 4;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- CHALLENGE
		gnMultiplierP1 = 5;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;

		-- EDIT
		gnMultiplierP1 = 6;
		
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER01);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 10 * gnSongsP1
		gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER02);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 8 * gnSongsP1
		gnTrisDoubleP1 = gnTrisDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER03);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7.5 * gnSongsP1
		gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER04);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 7 * gnSongsP1
		gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER05);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER06);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 6 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER07);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER08);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER09);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER10);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 4 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER11);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER12);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 3 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER13);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER14);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 2 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER15);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1.5 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER16);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		gnSongsP1 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER17);
		gnTotalP1 = gnTotalP1 + gnMultiplierP1 * 1 * gnSongsP1
		end
		
		gnEXPMultiplier = 1;
			
		-- Songs Played Award
		gnSongsP1Total = gnSongsP1Total + gnSongsP1;
		if gnSongsP1Total >= 100 then
			gnEXPMultiplier = gnEXPMultiplier + 0.1;
			end
		if gnSongsP1Total >= 500 then
			gnEXPMultiplier = gnEXPMultiplier + 0.2;
			end
		if gnSongsP1Total >= 1000 then
			gnEXPMultiplier = gnEXPMultiplier + 0.3;
			end
		
		-- Star Award
		gnStarsTotalP1 = gnSinglesSingleP1 + (2*gnDoublesSingleP1) + (3*gnTrisSingleP1) + (4*gnQuadsSingleP1) + gnSinglesDoubleP1 + (2*gnDoublesDoubleP1) + (3*gnTrisDoubleP1) + (4*gnQuadsDoubleP1);
		if gnStarsTotalP1 >= 100 then
			gnEXPMultiplier = gnEXPMultiplier + 0.1;
			end
		if gnStarsTotalP1 >= 500 then
			gnEXPMultiplier = gnEXPMultiplier + 0.2;
			end
		if gnStarsTotalP1 >= 1000 then
			gnEXPMultiplier = gnEXPMultiplier + 0.3;
			end
		
		-- Death Award
		gnDeathsP1 = PROFILEMAN:GetProfile(pn):GetTotalNumSongsPlayed();
		gnDeathsP1 = gnDeathsP1 - gnSongsP1Total
		
		-- Experience Points
		gnExpCurveP1 = 75;
		gnLevelP1 = 1;
		gnExperienceP1 = 0;
		gnCount = 0;
		gnTotalP1 = gnTotalP1 * gnEXPMultiplier;

		for gnCount = 1, 999, 1 do
			gnNewCurve = gnExperienceP1;
			gnExperienceP1 = gnExperienceP1 + (gnExpCurveP1 * math.pow(1.5,gnCount))
			if gnExperienceP1 <= gnTotalP1 then
				gnLevelP1 = gnLevelP1 + 1;
				else
				gnTotalP1 = gnTotalP1 - gnNewCurve;
				gnNewCurve = gnExperienceP1 - gnNewCurve;
				gnPercentageP1 = (gnTotalP1/gnNewCurve)*93
				break
				end
			end
		gnLoadedP1 = false;
		return gnTotalP1
		end
	end

if pn == PLAYER_2 then
	if gnScreenEvaluationFlag then
		gnScreenEvaluationFlag = false;
		return gnTotalP2
		end
	gnStatFrequencyP2 = gnStatFrequencyP2 + 1;
	if gnStatFrequencyP2 >= getMaxStatFrequency() then
		gnStatFrequencyP2 = 0;
			gnSongsP2 = 0;
			gnSongsP2Total = 0;
			gnTotalP2 = 0;
			gnStarsTotalP2 = 0;
			gnSinglesSingleP2 = 0;
			gnDoublesSingleP2 = 0;
			gnTrisSingleP2 = 0;
			gnQuadsSingleP2 = 0;
			gnSinglesDoubleP2 = 0;
			gnDoublesDoubleP2 = 0;
			gnTrisDoubleP2 = 0;
			gnQuadsDoubleP2 = 0;

			if not GAMESTATE:PlayerUsingBothSides(PLAYER_2) then
			-- BEGINNER
			gnMultiplierP2 = 1;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_BEGINNER,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- EASY
			gnMultiplierP2 = 2;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EASY,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			
			-- MEDIUM
			gnMultiplierP2 = 3;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_MEDIUM,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- HARD
			gnMultiplierP2 = 4;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_HARD,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- CHALLENGE
			gnMultiplierP2 = 5;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_CHALLENGE,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- EDIT
			gnMultiplierP2 = 6;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsSingleP2 = gnQuadsSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisSingleP2 = gnTrisSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesSingleP2 = gnDoublesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesSingleP2 = gnSinglesSingleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,DIFFICULTY_EDIT,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			end
			
			if GAMESTATE:PlayerUsingBothSides(PLAYER_2) then
			-- BEGINNER
			gnMultiplierP2 = 1;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_BEGINNER,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- EASY
			gnMultiplierP2 = 2;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EASY,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			
			-- MEDIUM
			gnMultiplierP2 = 3;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_MEDIUM,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- HARD
			gnMultiplierP2 = 4;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_HARD,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- CHALLENGE
			gnMultiplierP2 = 5;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_CHALLENGE,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;

			-- EDIT
			gnMultiplierP2 = 6;
			
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER01);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 10 * gnSongsP2
			gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER02);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 8 * gnSongsP2
			gnTrisDoubleP2 = gnTrisDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER03);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7.5 * gnSongsP2
			gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER04);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 7 * gnSongsP2
			gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER05);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER06);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 6 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER07);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER08);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER09);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER10);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 4 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER11);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER12);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 3 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER13);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER14);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 2 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER15);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1.5 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER16);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			gnSongsP2 = PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,DIFFICULTY_EDIT,GRADE_TIER17);
			gnTotalP2 = gnTotalP2 + gnMultiplierP2 * 1 * gnSongsP2
			end
			
			gnEXPMultiplier = 1;
				
			-- Songs Played Award
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			if gnSongsP2Total >= 100 then
				gnEXPMultiplier = gnEXPMultiplier + 0.1;
				end
			if gnSongsP2Total >= 500 then
				gnEXPMultiplier = gnEXPMultiplier + 0.2;
				end
			if gnSongsP2Total >= 1000 then
				gnEXPMultiplier = gnEXPMultiplier + 0.3;
				end
			
			-- Star Award
			gnStarsTotalP2 = gnSinglesSingleP2 + (2*gnDoublesSingleP2) + (3*gnTrisSingleP2) + (4*gnQuadsSingleP2) + gnSinglesDoubleP2 + (2*gnDoublesDoubleP2) + (3*gnTrisDoubleP2) + (4*gnQuadsDoubleP2);
			if gnStarsTotalP2 >= 100 then
				gnEXPMultiplier = gnEXPMultiplier + 0.1;
				end
			if gnStarsTotalP2 >= 500 then
				gnEXPMultiplier = gnEXPMultiplier + 0.2;
				end
			if gnStarsTotalP2 >= 1000 then
				gnEXPMultiplier = gnEXPMultiplier + 0.3;
				end
			
			-- Death Award
			gnDeathsP2 = PROFILEMAN:GetProfile(pn):GetTotalNumSongsPlayed();
			gnDeathsP2 = gnDeathsP2 - gnSongsP2Total
			
			-- Experience Points
			gnExpCurveP2 = 75;
			gnLevelP2 = 1;
			gnExperienceP2 = 0;
			gnCount = 0;
			gnTotalP2 = gnTotalP2 * gnEXPMultiplier;

			for gnCount = 1, 999, 1 do
				gnNewCurve = gnExperienceP2;
				gnExperienceP2 = gnExperienceP2 + (gnExpCurveP2 * math.pow(1.5,gnCount))
				if gnExperienceP2 <= gnTotalP2 then
					gnLevelP2 = gnLevelP2 + 1;
					else
					gnTotalP2 = gnTotalP2 - gnNewCurve;
					gnNewCurve = gnExperienceP2 - gnNewCurve;
					gnPercentageP2 = (gnTotalP2/gnNewCurve)*93
					break
					end
				end
				
			gnLoadedP2 = false;
			return gnTotalP2
		end
	end

return 'error'

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






-- ===SINGULAR CHECK IF ANY PLAYER HAS A CERTAIN MEMORY CARD NAME===
-- Check to see if a specified player has a memory card of the specified name
function CheckSinglePlayerName( nm, pl )
	if GAMESTATE:IsPlayerEnabled(pl) then
		if GAMESTATE:GetPlayerDisplayName(pl) == nm then -- If the selected player has the desired name
			return true
		end
	end
return false
end



-- ===CUSTOM AVATARS===
-- If the avatar script doesn't work for your game (or if it hasn't been released), you can add them manually here, you can also change the default
-- 'noavatar' image to reference something else (or you can just overwrite the image in the Graphics/NoAvatar/ folder.
-- Since you're here you can take a look at some of the custom name easter eggs I've added too...
function getNoAvatar( pn )
if gnCustomBG == nil then gnCustomBG = 'No'; end

if (pn+1) == 1 then
	gnP1ShowName = 0;
end

if (pn+1) == 2 then
	gnP2ShowName = 0;
end


if CheckSinglePlayerName('Mario',pn) or CheckSinglePlayerName('Super Mario',pn) then
	gnCustomBG = 'Mario';
	return 'MarioAvatar.png'
	end
if CheckSinglePlayerName('Luigi',pn) or CheckSinglePlayerName('Super Luigi',pn) then
	gnCustomBG = 'Luigi';
	return 'LuigiAvatar.png'
	end
if CheckSinglePlayerName('Yoshi',pn) or CheckSinglePlayerName('Yoshi the Dinosaur',pn) then
	gnCustomBG = 'Yoshi';
	return 'YoshiAvatar.png'
	end
if CheckSinglePlayerName('Bowser',pn) or CheckSinglePlayerName('King Koopa',pn) then
	gnCustomBG = 'No';
	return 'BowserAvatar.png'
	end
if CheckSinglePlayerName('Sonic',pn) or CheckSinglePlayerName('Sonic the Hedgehog',pn) then
	gnCustomBG = 'Sonic';
	return 'SonicAvatar.png'
	end
if CheckSinglePlayerName('Tails',pn) or CheckSinglePlayerName('Tails Prower',pn) then
	gnCustomBG = 'Tails';
	return 'TailsAvatar.png'
	end
if CheckSinglePlayerName('Knuckles',pn) or CheckSinglePlayerName('Knuckles the Echidna',pn) then
	gnCustomBG = 'Knuckles';
	return 'KnucklesAvatar.png'
	end
if CheckSinglePlayerName('Eggman',pn) or CheckSinglePlayerName('Dr Eggman',pn) or CheckSinglePlayerName('Robotnik',pn) or CheckSinglePlayerName('Dr Robotnik',pn) then
	gnCustomBG = 'No';
	return 'EggmanAvatar.png'
	end
if CheckSinglePlayerName('DK',pn) or CheckSinglePlayerName('Donkey Kong',pn) then
	gnCustomBG = 'DK';
	return 'DKAvatar.png'
	end
if CheckSinglePlayerName('Diddy',pn) or CheckSinglePlayerName('Diddy Kong',pn) then
	gnCustomBG = 'Diddy';
	return 'DiddyAvatar.png'
	end
if CheckSinglePlayerName('Dixie',pn) or CheckSinglePlayerName('Dixie Kong',pn) then
	gnCustomBG = 'Dixie';
	return 'DixieAvatar.png'
	end
if CheckSinglePlayerName('K Rool',pn) or CheckSinglePlayerName('King K Rool',pn) or CheckSinglePlayerName('Kaptain K Rool',pn) then
	gnCustomBG = 'No';
	return 'KRoolAvatar.png'
	end
if CheckSinglePlayerName('Enguarde',pn) or CheckSinglePlayerName('Enguarde the Swordfish',pn) or CheckSinglePlayerName('Swordfish',pn) then
	gnCustomBG = 'No';
	return 'EnguardeAvatar.png'
	end
if CheckSinglePlayerName('Rambi',pn) or CheckSinglePlayerName('Rambi the Rhino',pn) or CheckSinglePlayerName('Rhino',pn) then
	gnCustomBG = 'No';
	return 'RambiAvatar.png'
	end
if CheckSinglePlayerName('Winky',pn) or CheckSinglePlayerName('Winky the Frog',pn) or CheckSinglePlayerName('Frog',pn) then
	gnCustomBG = 'No';
	return 'WinkyAvatar.png'
	end
if CheckSinglePlayerName('Expresso',pn) or CheckSinglePlayerName('Expresso the Ostrich',pn) or CheckSinglePlayerName('Ostrich',pn) then
	gnCustomBG = 'No';
	return 'ExpressoAvatar.png'
	end
if CheckSinglePlayerName('Zinger',pn) or CheckSinglePlayerName('Wasp',pn) or CheckSinglePlayerName('Bee',pn) then
	gnCustomBG = 'No';
	return 'ZingerAvatar.png'
	end
if CheckSinglePlayerName('Bomberman',pn) or CheckSinglePlayerName('Bomb',pn) or CheckSinglePlayerName('Hudson',pn) then
	gnCustomBG = 'No';
	return 'BombermanAvatar.png'
	end
if CheckSinglePlayerName('Kirby',pn) or CheckSinglePlayerName('Pink',pn) or CheckSinglePlayerName('Ball',pn) then
	gnCustomBG = 'Kirby';
	return 'KirbyAvatar.png'
	end
if CheckSinglePlayerName('Metaknight',pn) or CheckSinglePlayerName('Blue',pn) or CheckSinglePlayerName('Wing',pn) then
	gnCustomBG = 'Metaknight';
	return 'MetaknightAvatar.png'
	end
if CheckSinglePlayerName('Dedede',pn) or CheckSinglePlayerName('King Dedede',pn) or CheckSinglePlayerName('Penguin',pn) then
	gnCustomBG = 'No';
	return 'DededeAvatar.png'
	end
if CheckSinglePlayerName('Poppy Bros',pn) or CheckSinglePlayerName('Poppy Bros Jr',pn) or CheckSinglePlayerName('Banana',pn) then
	gnCustomBG = 'No';
	return 'PoppyBrosAvatar.png'
	end
if CheckSinglePlayerName('Megaman',pn) or CheckSinglePlayerName('X',pn) then
	gnCustomBG = 'Megaman';
	return 'MegamanAvatar.png'
	end
if CheckSinglePlayerName('Zero',pn) or CheckSinglePlayerName('0',pn) then
	gnCustomBG = 'Zero';
	return 'ZeroAvatar.png'
	end
if CheckSinglePlayerName('Twilight',pn) or CheckSinglePlayerName('Twilight Sparkle',pn) or CheckSinglePlayerName('Magic',pn)  then
	gnCustomBG = 'Twilight';
	return 'TwilightAvatar.png'
	end
if CheckSinglePlayerName('Rainbow',pn) or CheckSinglePlayerName('Rainbow Dash',pn) or CheckSinglePlayerName('Dashie',pn) then
	gnCustomBG = 'Rainbow';
	return 'RainbowAvatar.png'
	end
if CheckSinglePlayerName('Pinkie',pn) or CheckSinglePlayerName('Pinkie Pie',pn) or CheckSinglePlayerName('Pinkamena',pn) or CheckSinglePlayerName('Balloons',pn) then
	gnCustomBG = 'Pinkie';
	return 'PinkieAvatar.png'
	end
if CheckSinglePlayerName('Applejack',pn) or CheckSinglePlayerName('AJ',pn) or CheckSinglePlayerName('Apples',pn) then
	gnCustomBG = 'Applejack';
	return 'ApplejackAvatar.png'
	end
if CheckSinglePlayerName('Rarity',pn) or CheckSinglePlayerName('Spikey Wikey',pn) then
	gnCustomBG = 'Rarity';
	return 'RarityAvatar.png'
	end
if CheckSinglePlayerName('Fluttershy',pn) or CheckSinglePlayerName('Flooter Shy',pn) or CheckSinglePlayerName('Butterflies',pn) then
	gnCustomBG = 'Fluttershy';
	return 'FluttershyAvatar.png'
	end
if CheckSinglePlayerName('Daring Do',pn) or CheckSinglePlayerName('Indiana Jones',pn) or CheckSinglePlayerName('Dungeon',pn) then
	gnCustomBG = 'No';
	return 'DaringDoAvatar.png'
	end
if CheckSinglePlayerName('Octavia',pn) or CheckSinglePlayerName('Cello',pn) or CheckSinglePlayerName('Classical',pn) then
	gnCustomBG = 'No';
	return 'OctaviaAvatar.png'
	end
if CheckSinglePlayerName('Vinyl Scratch',pn) or CheckSinglePlayerName('DJ Pon-3',pn) or CheckSinglePlayerName('DJ',pn) then
	gnCustomBG = 'No';
	return 'ScratchAvatar.png'
	end
if CheckSinglePlayerName('Gummy',pn) or CheckSinglePlayerName('No Teeth',pn) or CheckSinglePlayerName('Alligator',pn) then
	gnCustomBG = 'No';
	return 'GummyAvatar.png'
	end
if CheckSinglePlayerName('Spike',pn) or CheckSinglePlayerName('<3 Rarity',pn) or CheckSinglePlayerName('Gems',pn) then
	gnCustomBG = 'No';
	return 'SpikeAvatar.png'
	end
if CheckSinglePlayerName('Celestia',pn) or CheckSinglePlayerName('Sun',pn) or CheckSinglePlayerName('Cake',pn) then
	gnCustomBG = 'No';
	return 'CelestiaAvatar.png'
	end
if CheckSinglePlayerName('Luna',pn) or CheckSinglePlayerName('Moon',pn) or CheckSinglePlayerName('Nightmare Moon',pn) then
	gnCustomBG = 'No';
	return 'LunaAvatar.png'
	end
if CheckSinglePlayerName('Derpy',pn) or CheckSinglePlayerName('Ditzy',pn) or CheckSinglePlayerName('Muffin',pn) then
	gnCustomBG = 'No';
	return 'DerpyAvatar.png'
	end
if CheckSinglePlayerName('(-[Jayce]-)',pn) or CheckSinglePlayerName('JCE',pn) then
	gnCustomBG = 'No';
	return 'JayceAvatar.png'
	end
if CheckSinglePlayerName('Cameron',pn) or CheckSinglePlayerName('CAM',pn) then
	gnCustomBG = 'No';
	return 'CameronAvatar.png'
	end
if CheckSinglePlayerName('Brendan',pn) or CheckSinglePlayerName('*~falkieee~*',pn) then
	gnCustomBG = 'No';
	return 'BrendanAvatar.png'
	end
if CheckSinglePlayerName('COW9',pn) or CheckSinglePlayerName('ACOW',pn) then
	gnCustomBG = 'No';
	return 'JamesAvatar.png'
	end
	
if GAMESTATE:GetEnv('Konami') == 'On' then
	gnCustomBG = 'KonamiCode';
	return 'KonamiAvatar.png'
	end

if (pn+1) == 1 then
	gnP1ShowName = 1;
end

if (pn+1) == 2 then
	gnP2ShowName = 1;
end

return 'p'..(pn+1)..'noavatar.png'				-- This is the default 'noavatar' graphic for each player
end


-- ===CUSTOM BACKGROUNDS===
-- This scripts works with the custom avatar script above, you can set a background that will appear above the song
-- background but under the hide background mod.
function getNoBackground()
if gnCustomBG == nil then gnCustomBG = 'No'; end
return gnCustomBG
end




-- More Easter Eggs, I thought they'd be fun or something
function EasterEggSanta()
if GAMESTATE:GetEnv('Santa') == 'On' or CheckPlayerName('Santa') or CheckPlayerName('Santa Claus') or CheckPlayerName('Christmas') or CheckPlayerName('Xmas') then
	return true
	end
return false
end

function EasterEggFrost()
if GAMESTATE:GetEnv('Frost') == 'On' or CheckPlayerName('Frost') or CheckPlayerName('Frozen') or CheckPlayerName('Ice') or CheckPlayerName('Glacier') then
	return true
	end
return false
end

function EasterEggBlizzard()
if GAMESTATE:GetEnv('Blizzard') == 'On' or CheckPlayerName('Blizzard') or CheckPlayerName('Snow') then
	return true
	end
return false
end

function EasterEggSummerRain()
if GAMESTATE:GetEnv('Rain') == 'On' or CheckPlayerName('Summer') or CheckPlayerName('Rain') or CheckPlayerName('Summer Rain') then
	return true
	end
return false
end