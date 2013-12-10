--[[
Simple API to save screen elements for later use for StepMania 3.95/OpenITG, version 1.0
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

Globally callable functions to safely store an actor to be used on a later screen.

Written by Cameron Ball for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]

--[[
Callable functions:

RegisterGlobal( Name, Actor )
[saves text from Actor for later use]
        - Name: the name of the actor for later reference, must be unique.
        - Actor: the actor to save.

GetGlobal( Name )
[returns a previously saved actor]
        - Name: the name of the actor to retrieve.

The intended way to use this API is by calling RegisterGlobal from your theme's
metrics.ini. For example, to save away the song length to use later you would
put this in metrics.ini under [ScreenSelectMusic]:

TotalTimeOnCommand=%function(self) RegisterGlobal(self, "TotalTime") end

Then if you wanted to use the song length actor on the options screen, you can
access it like this:

local SongLength = GetGlobal("TotalTime")
]]--

local GlobalsTable = {}

function RegisterGlobal( Name, Actor )
	GlobalsTable[Name] = Actor:GetText()
end

function GetGlobal(Name)
	return GlobalsTable[Name]
end