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
		
RegisterGlobalCallback( Name, Actor )
[sets up a function to be called when a global is registered]
		- Name: the name of the global to apply the callback to
		- Actor: the Actor that the callback will be applied to

The intended way to use this API is by calling RegisterGlobal from your theme's
metrics.ini. For example, to save away the song bpm to use later you would
put this in metrics.ini under [ScreenSelectMusic]:

BPMDisplayOnCommand=%function(self) RegisterGlobal("HighBPM", self:GetChild('Text')); RegisterGlobal("LowBPM", self:GetChild('Text')); end
BPMDisplayCurrentStepsP1ChangedMessageCommand=%function(self) RegisterGlobal("HighBPM", self:GetChild('Text')); RegisterGlobal("LowBPM", self:GetChild('Text')) end
BPMDisplayCurrentStepsP2ChangedMessageCommand=%function(self) RegisterGlobal("HighBPM", self:GetChild('Text')); RegisterGlobal("LowBPM", self:GetChild('Text')) end

(NB: RegisterGlobal must be called on CurrentStepsP[1/2]Changed since that message is broadcast AFTER
the bpm display has been updated, therefore when we call RegisterGlobal it gets the correct value)

Then we can set up callbacks to pull out the low and high BPMs like so:

local function LowBPM( BPMDisplay )
        local pos = BPMDisplay:GetText()
	pos = string.find(BPMDisplay, "-")
	if pos ~= nil then return string.sub(BPMDisplay,1,pos-1) else return BPMDisplay end
end

local function HighBPM( BPMDisplay )
        local pos = BPMDisplay:GetText()
	pos = string.find(BPMDisplay, "-")
	if pos ~= nil then return string.sub(BPMDisplay,pos+1) else return BPMDisplay end
end

RegisterGlobalCallback("HighBPM", HighBPM)
RegisterGlobalCallback("LowBPM", LowBPM)

Then if you wanted to use the BPM on a different screen you could do it like this:

local BPMDisplay = GetGlobal("LowBPM") .. "-" .. GetGlobal("HighBPM")
]]--

local GlobalsTable = {}
local CallbackTable = {}

function RegisterGlobal( Name, Actor )
        if CallbackTable[Name] ~= nil
            then GlobalsTable[Name] = CallbackTable[Name](Actor)
        else
            GlobalsTable[Name] = Actor:GetText()	
        end
end

function GetGlobal(Name)
	return GlobalsTable[Name]
end

function RegisterGlobalCallback(Name, fn)
    assert(CallbackTable[Name] == nil, "Cannot re-register global callback " .. Name)
    CallbackTable[Name] = fn
end