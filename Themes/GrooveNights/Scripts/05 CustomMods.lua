-- For tracking applied mods
local AppliedModsTable = {}

-- For resetting mods
local WasInOptions = {PLAYER_1 = false, PLAYER_2 = false}

-- Holds the mods
local ModsTable = {}

function RegisterCustomMod(Name, fn, Params, Choices)
    assert(ModsTable[Name] == nil, "Cannot re-register custom mod" .. Name)
    Params.Name = Name
    ModsTable[Name] = { ["Params"] = Params, ["Choices"] = Choices, Callback = fn }

    if not AppliedModsTable[PLAYER_1] then AppliedModsTable[PLAYER_1] = {} end
    if not AppliedModsTable[PLAYER_2] then AppliedModsTable[PLAYER_2] = {} end
    
    AppliedModsTable[PLAYER_1][Name] = false
    AppliedModsTable[PLAYER_2][Name] = false

    NullMod(Name)
end

function NullMod( Name )
    SCREENMAN:SystemMessage('nulling ' .. Name)

    local Choices = ModsTable[Name].Choices 
    local Params = ModsTable[Name].Params

    AppliedModsTable[PLAYER_1][Name] = false
    AppliedModsTable[PLAYER_2][Name] = false

    if Params.SelectType == "SelectMultiple" then
        AppliedModsTable[PLAYER_1][Name] = {}
        AppliedModsTable[PLAYER_2][Name] = {}

        for ModName,ModValue in pairs(Choices) do
            AppliedModsTable[PLAYER_1][Name][ModValue] = false
            AppliedModsTable[PLAYER_2][Name][ModValue] = false
        end
    end
end

function CustomModOptionRow(Name)
    local Choices = ModsTable[Name].Choices 
    local Params = ModsTable[Name].Params

    Params.LoadCallback = function(List, Value, pn)
                            WasInOptions[pn] = true

                           -- If this is the first round, reset the skin as it may still be set from earlier
                           if GAMESTATE:StageIndex() == 0 then NullMod(Name) end
                           if Params.SelectType ~= "SelectMultiple" then return AppliedModsTable[pn][Name] == Value  end
                           if Params.SelectType == "SelectMultiple" then return AppliedModsTable[pn][Name][Value] end
                          end

    Params.SaveCallback = function(List, Value, pn)
                           if Params.SelectType ~= "SelectMultiple" and List then AppliedModsTable[pn][Name] = Value return end
                           if Params.SelectType == "SelectMultiple" then AppliedModsTable[pn][Name][Value] = List end
                          end

    return CreateGenericOptionRow( Params, Choices, Choices )
end

function DoCustomMod(Name, pn, Params)
    --if this is the first stage and the user was NOT in the options, reset the mod to default
    if GAMESTATE:StageIndex() == 0 and not WasInOptions[pn] then NullMod(Name) end
    WasInOptions[pn] = false

    Params.Value = AppliedModsTable[pn][Name]
    ModsTable[Name].Callback(Params)
end

function CustomModsServiceOptionRow()
    local Choices = { }
    local Params = { Name = "CustomMods", SelectType = "SelectMultiple"  }

    for ModName,ModValue in pairs(ModsTable) do
        table.insert(Choices, ModName)
    end

    return CreateProfileRow(Params, Choices, Choices)
end

function CustomModLines()

end



