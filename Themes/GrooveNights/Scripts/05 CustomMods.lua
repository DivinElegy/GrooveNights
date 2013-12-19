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
end

function CustomModOptionRow(Name)
    local Choices = ModsTable[Name].Choices 
    local Params = ModsTable[Name].Params

    Params.LoadCallback = function(List, Value, pn)
                            WasInOptions[pn] = true

                            -- If this is the first round, reset the skin as it may still be set from earlier
                            --if GetStageText() == "1" then AppliedModsTable[pn][Name] = nil end
                           if AppliedModsTable[pn][Name] then Trace("MODSTABLE IS " ..AppliedModsTable[pn][Name]) end
                            return AppliedModsTable[pn][Name] == Value
                          end

    Params.SaveCallback = function(List, Value, pn) if List then AppliedModsTable[pn][Name] = Value end end

    return CreateGenericOptionRow( Params, Choices, Choices )
end

function DoCustomMod(Name, pn, Params)
    --if this is the first stage and the user was NOT in the options, reset the mod to default
    if GetStageText() == "1" and not WasInOptions[pn] then AppliedModsTable[pn][Name] = nil end

    if AppliedModsTable[pn][Name] ~= nil then Params.Value = AppliedModsTable[pn][Name] return ModsTable[Name].Callback(Params) end

    WasInOptions[pn] = false
end

function CustomModsServiceOptionRow()
    local Choices = {}
    local Params = { Name = "CustomMods", SelectType = "SelectMultiple"  }

    for ModName,ModValue in pairs(ModsTable) do
        table.insert(Choices, ModName)
    end

    return CreateProfileRow(Params, Choices, Choices)
end

function CustomModLines()

end



