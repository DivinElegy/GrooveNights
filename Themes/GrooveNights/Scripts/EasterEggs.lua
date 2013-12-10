-- This is purely for convenience
local ProfileTable
local FunctionTable = {}

-- Without this check, when StepMania starts it will report a lua runtime error as PROFILEMAN apparently doesn't exist yet.
if PROFILEMAN ~= nil then
    ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()
end

-- Valid speed mod row type names.
local choices = { "OFF", "ON" }

local FunctionTable = {}

function EasterEggsEnabled()
    --Default to off
    if ProfileTable.EasterEggs == nil then return false end

    return ProfileTable.EasterEggs
end

function ToggleEasterEggs()
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
    FunctionTable[Name] = fn
end

function DoEasterEgg(Name, Params)
    if EasterEggsEnabled() then
        if FunctionTable[Name] ~= nil then return FunctionTable[Name](Params) end
    end
end