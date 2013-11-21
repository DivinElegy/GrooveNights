function PlayerColor( pn )
	if pn == PLAYER_1 then return "#FBBE03" end	-- orange
	if pn == PLAYER_2 then return "#56FF48" end	-- green
	return "1,1,1,1"
end

function DifficultyColor( dc )
	if dc == DIFFICULTY_BEGINNER	then return "#7300C0" end
	if dc == DIFFICULTY_EASY		then return "#007300" end
	if dc == DIFFICULTY_MEDIUM		then return "#C0C000" end
	if dc == DIFFICULTY_HARD		then return "#C01D1D" end
	if dc == DIFFICULTY_CHALLENGE	then return "#1868C0" end
	if dc == DIFFICULTY_EDIT		then return "#797979" end
	return "1,1,1,1"
end

-- Get a color to show text on top of difficulty frames.
function ContrastingDifficultyColor( dc )
	if dc == DIFFICULTY_BEGINNER	then return "#FFFFFF" end
	if dc == DIFFICULTY_EASY		then return "#FFFFFF" end
	if dc == DIFFICULTY_MEDIUM		then return "#FFFFFF" end
	if dc == DIFFICULTY_HARD		then return "#FFFFFF" end
	if dc == DIFFICULTY_CHALLENGE	then return "#FFFFFF" end
	if dc == DIFFICULTY_EDIT		then return "#FFFFFF" end
	return "1,1,1,1"
end
