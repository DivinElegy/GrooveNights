--[[
Simple API to set up easter eggs to apply to an actor for StepMania 3.95/OpenITG, version 1.0
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

Options menu function to turn easter eggs on/off and globally callable functions
to trigger pre-defined easter eggs.

Written by Cameron Ball for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]

--[[
Callable functions:

EasterEggsEnabled()
[returns a boolean value depending on whether easter eggs have been enabled]

ToggleEasterEggs()
[turns easter eggs on/off]

RegisterEasterEgg( Name, fn )
[saves an easter egg function to be called later]
        - Name: the name of the easter egg for later referene, must be unique.
        - fn: the function to call when this easter egg is triggered.

DoEasterEgg( Name )
[runs a previously registered easter egg]
        - Name: the name of the easter egg to run.

You can use this API any number of ways, but the intended usage is to apply fun
changes to Actors when criteria is met. You would usually set up a function similar
to the following:

local function MyEasterEgg(Params)
    if GAMESTATE:PlayerIsUsingModifier(Params.pn, '69x') then
        Params.Actor:settext("WOOOOO! SIXTY NINE!")
        Params.Actor:diffusealpha(1)
        Params.Actor:rainbow()
    else 
        Params.Actor:diffusealpha(0)
    end
end

RegisterEasterEgg(MyEasterEgg)

Then on an Actor you could apply something like:

UpdateCommand="%function(self) DoEasterEgg('MyEasterEgg', { pn = PLAYER_1, Actor = self }) end"

Then whenever UpdateCommand is triggered, MyEasterEgg will be run and the corresponding
logic will be applied.
]]--

-- This is purely for convenience
local ProfileTable
local FunctionTable = {}

-- Without this check, when StepMania starts it will report a lua runtime error as PROFILEMAN apparently doesn't exist yet.
if PROFILEMAN ~= nil then
    ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()
end

local choices = { "OFF", "ON" }

function EasterEggsEnabled()
    --Default to off
    if ProfileTable.EasterEggs == nil then return false end

    return ProfileTable.EasterEggs
end

function ToggleEasterEggs()
    ProfileTable.EasterEggs = not ProfileTable.EasterEggs
end

function EasterEggsOptionsRow()
    local function Load(self, list, pn)
        if EasterEggsEnabled() then list[2] = true else list[1] = true end
    end

    local function Save(self, list, pn)
        if list[1] then ProfileTable.EasterEggs = false else ProfileTable.EasterEggs = true end
        PROFILEMAN:SaveMachineProfile()
        return
    end

    local Params = { Name = "EasterEggs" }
    return CreateOptionRow( Params, choices, Load, Save )
end

function RegisterEasterEgg(Name, fn)
    assert(FunctionTable[Name] == nil, "Cannot re-register easter egg " .. Name)
    FunctionTable[Name] = fn
end

function DoEasterEgg(Name, Params)
    if EasterEggsEnabled() then
        if FunctionTable[Name] ~= nil then return FunctionTable[Name](Params) end
    end
end