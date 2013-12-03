-- This is purely for convenience
local ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()

-- Valid speed mod row type names.
local Names = { "Basic", "Advanced", "Pro" }

function SpeedModTypeRow()
        local type = GetSpeedModType()

        local function Load(self, list, pn)
                -- what we're doing here is checking what we got from profileman against the valid names.
                for i=1,3 do
                        if type == string.lower(Names[i]) then list[i] = true return end
                end

                -- if nothing matched then just default to basic
                list[1] = true
        end

        local function Save(self, list, pn)
                -- go through each item in the list and save the first one that is set to true
                for i=1,3 do
                        if list[i] then
                                ProfileTable.SpeedModType = string.lower(Names[i])
                                PROFILEMAN:SaveMachineProfile()
                                return
                        end
                end
        end

        local Params = { Name = "SpeedModType" }

        return CreateOptionRow( Params, Names, Load, Save )
end

function GetSpeedModType()
        local type = ProfileTable.SpeedModType

        -- as soon as we find a valid name, return it.
        for i=1,3 do
            if type == string.lower(Names[i]) then return type end
        end

        -- no pref, default to the first name in the list.
        return string.lower(Names[1])
end