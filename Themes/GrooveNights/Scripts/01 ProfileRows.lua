--[[
Simple persisten row API for 3.95/OpenITG, version 1.2
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

This script is based on PrefsRows originally writeen by Marc Cannon ("Vyhd")

Base definitions and templates for StepMania LUA options lists to save to machine profile.
Written by Cameron Ball for OpenITG (http://www.boxorroxors.net/).
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]


--[[
Callable functions:

CreateOptionRow( Params, Names, LoadFctn, SaveFctn )
[creates a generic OptionRow with the given data]
        - Params: table with OptionRow data. "Name" is required, others are optional.
        - Names: table with the names of the objects to be used
        - LoadFctn(self, list, pn): called on list load, sets an initial toggle
        - SaveFctn(self, list, pn): called on list exit, uses a toggle to set a value

CreateProfileRow( Params, Values )
[creates a Profile-modifying OptionRow with this data]
        - Params: a table of parameters to use (generally you would just set Params.Name)
        - Values: table with the values to be used

CreateProfileRowBool( Params )
[generates an OptionsRow that toggles a boolean Preference]

GetProfilePref( Name )
[returns the value of Name in the machine profile table, if it exists]

ToggleBooleanPref( Name )
[toggles a boolean preference in the profile table, but does not save it]
--]]

-- This is purely for convenience
local ProfileTable

-- Without this check, when StepMania starts it will report a lua runtime error as PROFILEMAN apparently doesn't exist yet.
if PROFILEMAN ~= nil then
    ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()
end

-- This function written by Marc Cannon ("Vyhd")
function CreateOptionRow( Params, Names, LoadFctn, SaveFctn )
        if not Params.Name then return nil end

        -- this needs to be used because Lua evaluates 'false' as 'nil', so
        -- we can't use an OR operator to assign the value properly.
        local function setbool( value, default )
                if value ~= nil then return value else return default end
        end

        -- fill in with passed params or default values. only Name is required.
        local t =
        {
                Name = Params.Name,

                LayoutType = Params.LayoutType or "ShowAllInRow",
                SelectType = Params.SelectType or "SelectOne",

                OneChoiceForAllPlayers = setbool(Params.OneChoiceForAllPlayers, true),
                EnabledForPlayers = Params.EnabledForPlayers or {PLAYER_1, PLAYER_2},

                ExportOnChange = setbool(Params.ExportOnChange, false),
                ReloadRowMessages= Params.ReloadRowMessages or {},

                Choices = Names,
                LoadSelections = LoadFctn,
                SaveSelections = SaveFctn,
        }

        setmetatable( t, t )
        return t
end

function CreateGenericOptionRow( Params, Choices, Values )
        local function Load(self, list, pn)                
            for i=1,table.getn(Choices) do
                list[i] = Params.LoadCallback(list[i], Values[i], pn)

                if Params.SelectType ~= "SelectMultiple" and list[i] then return end
            end

            if Params.Default then list[Params.Default] = true else list[1] = true SCREENMAN:SystemMessage("here") end
        end

        local function Save(self, list, pn)
                for i=1,table.getn(Choices) do
                    Params.SaveCallback(list[i], Values[i], pn)
                end
        end

        return CreateOptionRow( Params, Choices, Load, Save )
end

-- creates a row list given a list of names and values
function CreateProfileRow( Params, Choices, Values )
        local pref = ProfileTable[Params.Name]
        
        Params.LoadCallback = function(List, Value) if Params.SekectType ~= "SelectMultiple" then return Value == pref else return pref[Value] end end
        Params.SaveCallback = function(List, Value)
                                if Params.SelectType ~= "SelectMultiple" and List then ProfileTable[Params.Name] = Value PROFILEMAN:SaveMachineProfile() return end
                                if Params.SelectType == "SelectMultiple" then
                                    if type(ProfileTable[Params.Name]) ~= "table" then ProfileTable[Params.Name] = {} end
                                    ProfileTable[Params.Name][Value] = List
                                    PROFILEMAN:SaveMachineProfile()
                                end
                              end

        return CreateGenericOptionRow( Params, Choices, Values )
end

function CreateProfileRowBool( Params )
    local Choices = {"OFF", "ON"}
    local Values = {false, true}
    return CreateProfileRow( Params, Choices, Values )
end

function GetProfilePref(Name)
    return ProfileTable[Name]
end

function ToggleBooleanPref(Name)
    if type(ProfileTable[name]) == "boolean" then ProfileTable[Name] = not ProfileTable[Name] end
end
