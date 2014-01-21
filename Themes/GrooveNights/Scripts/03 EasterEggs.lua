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

RegisterEasterEgg("MyEasterEgg", MyEasterEgg)

Then on an Actor you could apply something like:

UpdateCommand="%function(self) DoEasterEgg('MyEasterEgg', { pn = PLAYER_1, Actor = self }) end"

Then whenever UpdateCommand is triggered, MyEasterEgg will be run and the corresponding
logic will be applied.
]]--

local FunctionTable = {}

function EasterEggsEnabled()
    local pref = GetProfilePref("EasterEggs")
    if pref == nil then return true else return pref end
end

function EasterEggsOptionsRow()
    local Params = { Name = "EasterEggs", Default = 2 } --2 is on
    return CreateProfileRowBool( Params )
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