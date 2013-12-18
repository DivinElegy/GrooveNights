local CurrentSkin = {}
local WasInOptions = {PLAYER_1 = false, PLAYER_2 = false}

function JudgeSkinOptionsRow(Names, ThemeJudgeSkin)  

    local function Load(self, list, pn)
            WasInOptions[pn] = true

            -- If this is the first round, reset the skin as it may still be set from earlier
            if GetStageText() == "1" then CurrentSkin[pn] = nil end

            -- what we're doing here is checking what we got from profileman against the valid names.
            for i=1,table.getn(Names) do
                    if CurrentSkin[pn] == Names[i] then list[i] = true return end
            end

            list[1] = true
    end

    local function Save(self, list, pn)
            -- go through each item in the list and save the first one that is set to true
            for i=1,table.getn(Names) do
                    if list[i] then
                            if Names[i] == ThemeJudgeSkin then CurrentSkin[pn] = nil else CurrentSkin[pn] = Names[i] end
                            return
                    end
            end
    end

    return CreateOptionRow( {Name = "JudgeSkin", OneChoiceForAllPlayers = false}, Names, Load, Save )
end

function LoadSkin(Actor, pn)
    --if this is the first stage and the user was NOT in the options, reset the skin to default
    if GetStageText() == "1" and not WasInOptions[pn] then CurrentSkin[pn] = nil end

    if CurrentSkin[pn] ~= nil then
        Actor:Load( THEME:GetPath( EC_GRAPHICS, '', '_Judgements/' .. CurrentSkin[pn] ))
    end

    WasInOptions[pn] = false
end