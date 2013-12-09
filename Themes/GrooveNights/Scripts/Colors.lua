-- Set the colour of all player-specific text and items
function PlayerColor( pn )
	if pn == PLAYER_1 then return "#FBBE03" end	-- default "#FBBE03"
	if pn == PLAYER_2 then return "#56FF48" end	-- default "#56FF48"
	return "1,1,1,1"
end

-- Alternate (darker) player colours for diffuseshifting
function PlayerAltColor( pn )
	if pn == PLAYER_1 then return "#7F5400" end	-- default "#7F5400"
	if pn == PLAYER_2 then return "#226919" end	-- default "#226919"
	return "1,1,1,1"
end







-- Set the colour of all difficulty-specific backgrounds and bars
function DifficultyColor( dc )
	if dc == DIFFICULTY_BEGINNER	then return "#7300C0" end	-- default "#7300C0"
	if dc == DIFFICULTY_EASY		then return "#007300" end	-- default "#007300"
	if dc == DIFFICULTY_MEDIUM		then return "#C0C000" end	-- default "#C0C000"
	if dc == DIFFICULTY_HARD		then return "#C01D1D" end	-- default "#C01D1D"
	if dc == DIFFICULTY_CHALLENGE	then return "#1868C0" end	-- default "#1868C0"
	if dc == DIFFICULTY_EDIT		then return "#797979" end	-- default "#797979"
	return "1,1,1,1"
end

-- Set the colour of all difficulty-specific text
function ContrastingDifficultyColor( dc )
	if dc == DIFFICULTY_BEGINNER	then return "#FFFFFF" end	-- default "#FFFFFF"
	if dc == DIFFICULTY_EASY		then return "#FFFFFF" end	-- default "#FFFFFF"
	if dc == DIFFICULTY_MEDIUM		then return "#FFFFFF" end	-- default "#FFFFFF"
	if dc == DIFFICULTY_HARD		then return "#FFFFFF" end	-- default "#FFFFFF"
	if dc == DIFFICULTY_CHALLENGE	then return "#FFFFFF" end	-- default "#FFFFFF"
	if dc == DIFFICULTY_EDIT		then return "#FFFFFF" end	-- default "#FFFFFF"
	return "1,1,1,1"
end




--[THESE CHANGES AFFECT EVERY SCREEN]--
-- Set the colour of all borders in the theme
function FrameColor( pn )
	return "#1C2C3C"	-- default 
end

-- Set the colour of all backgrounds in the theme
function BackgroundColor( pn )
	return "#060A0E"	-- default 
end

-- Set the colour of all labels in the theme, eg BPM:, Length:, Folder: on the Music Select Screen
function LabelColor(lbl)
	-- Blinking Effect in Home Mode
	if lbl == 2 then return "#A66A0C" end	-- default "#A66A0C"
	
	return "#FFA314"	-- default "#FFA314"
end




--[THESE CHANGES AFFECT THE MUSIC SELECT SCREEN]--
-- Music Wheel Colours
function WheelBackgroundColor()
	return FrameColor()	-- default FrameColor()
end

function SectionColor()
	return LabelColor()	-- default LabelColor()
end

function SongTitleColor()
	return "#FFFFFF"	-- default "#FFFFFF"
end

function CourseTitleColor()
	return SongTitleColor()	-- default SongTitleColor()
end

function SubTitleColor()
	return "#8AB2F4"	-- default "#8AB2F4"
end

function SortColor()
	return LabelColor()	-- default LabelColor()
end




--[THESE CHANGES AFFECT THE GAMEPLAY SCREEN]--
-- Lifebar Meter Colours
function LifeMeterColor(col)
-- 'Normal' colour
if col == 1 then return "#3FBFFF" end -- default "#3FBFFF"
-- 'Hot' colour
if col == 2 then return "#C43131" end -- default "#C43131"

-- 'undefined' colour
return LabelColor()
end

-- Song Meter Tip Colour
function SongMeterColor()
return "#FFFFFF" -- default "#FFFFFF"
end
