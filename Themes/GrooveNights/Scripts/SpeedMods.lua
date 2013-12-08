function GetRateMods()
	return { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "2.0x"}
end

function GetBaseSpeeds()
    if GetSpeedModRowType() == "pro" then
        return { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" }
    end
        
    if GetSpeedModRowType() == "advanced" then
        if OPENITG then baseSpeed = { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000", "m400", "m425", "m450", "m475", "m500", "m525", "m550", "m575", "m600", "m625", "m650", "m675", "m700", "m725", "m750", "m775", "m800", "m825", "m850", "m875", "m900", "m925", "m950", "m975", "m1000" }
        else baseSpeed = { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000" }
        end
    end

    if GetSpeedModRowType() == "basic" then
        if OPENITG then baseSpeed = { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "6x", "c450", "m450" }
        else baseSpeed = { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "5.5x", "6x", "c450" }
        end
    end
end   

function GetExtraSpeeds()
	if GetSpeedModRowType() == "pro" then 
		return { "0", "+0.25", "+0.5", "+0.75", "+0.1", "+0.2", "+0.3", "+0.4", "+0.6", "+0.7", "+0.8", "+0.9" }
	end
	
	if GetSpeedModRowType() == "advanced" then
		return { "0" }
	end
	
	if GetSpeedModRowType() == "basic" then
		return { "0" }
	end
end

function GetSpeedModTypes() 
    if OPENITG then
        return { "x-mod", "c-mod", "m-mod" }
    else
        return { "x-mod", "c-mod" }
    end
end

function GetRateMod()
	local RateMods = GetRateMods()
	for n = 1, table.getn(RateMods) do
		if GAMESTATE:PlayerIsUsingModifier(0, RateMods[n] .. 'music') or GAMESTATE:PlayerIsUsingModifier(1, RateMods[n] .. 'music') then
			return RateMods[n]
		end
	end

	return nil
end

function RateMods()
	local modList = GetRateMods();

	local function Load(self, list, pn)
		for n = 1, table.getn(modList) do
			if GAMESTATE:PlayerIsUsingModifier(pn,modList[n]..'music') then list[n] = true else list[n] = false end
		end
	end

	local function Save(self, list, pn)
		for n = 1, table.getn(modList) do
			if list[n] then
				GAMESTATE:ApplyGameCommand('mod,'..modList[n]..'music',pn)
				MESSAGEMAN:Broadcast('RateModChanged')
			end
		end
	end

	local Params = { Name = "Rate" }
	return CreateOptionRow( Params, modList, Load, Save )
end

function GetSpeedMod(pn)
    local BaseSpeeds = GetBaseSpeeds()
    local ExtraSpeeds = GetExtraSpeeds()
    for n = 1, table.getn(BaseSpeeds) do
        if GetSpeedModRowType() == "basic" or GetSpeedModRowType() == "advanced" then
            if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n]) then return BaseSpeeds[n] end
        end

        if GetSpeedModRowType() == "pro" then
            for m = 1, table.getn(ExtraSpeeds) do
                local CombinedSpeeds = BaseSpeeds[n] + string.gsub(ExtraSpeeds[m], 'x', '') --combines the speeds in to things like 4.50

                --check x-mods
                Trace('GetSpeedMod: Checking ' .. CombinedSpeeds .. 'x')
                if GAMESTATE:PlayerIsUsingModifier(pn, CombinedSpeeds .. 'x') then
                    Trace("GetSpeedMod: Hit!")
                    return CombinedSpeeds .. 'x'
                end
			end
       end  
    end
	
	for n = 1, table.getn(BaseSpeeds) do
		if GetSpeedModRowType() == "basic" or GetSpeedModRowType() == "advanced" then
            if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n]) then return BaseSpeeds[n] end
        end
	
		for m = 1, table.getn(ExtraSpeeds) do
			local CombinedSpeeds = BaseSpeeds[n] + string.gsub(ExtraSpeeds[m], 'x', '') --combines the speeds in to things like 4.50
		
			--check c-mods
			Trace('GetSpeedMod: Checking ' .. 'c' .. CombinedSpeeds*100)
			if GAMESTATE:PlayerIsUsingModifier(pn, 'c' .. CombinedSpeeds*100) then 
				Trace('GetSpeedMod: Hit!')
				return 'c' .. CombinedSpeeds*100
			end
		end
	end
	
	for n = 1, table.getn(BaseSpeeds) do
		if GetSpeedModRowType() == "basic" or GetSpeedModRowType() == "advanced" then
            if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n]) then return BaseSpeeds[n] end
        end

		for m = 1, table.getn(ExtraSpeeds) do
			local CombinedSpeeds = BaseSpeeds[n] + string.gsub(ExtraSpeeds[m], 'x', '') --combines the speeds in to things like 4.50			
			
			--check m-mods (for some reason m0 is always applied, so skip it)
			Trace('GetSpeedMod: Checking ' .. 'm' .. CombinedSpeeds*100)
			if GAMESTATE:PlayerIsUsingModifier(pn, 'm' .. CombinedSpeeds*100) then 
				Trace('GetSpeedMod: Hit!')
				return 'm' .. CombinedSpeeds*100
			end
		end
	end
	
	return nil
end

function GetSpeedModBase(pn)
    local SpeedMod = GetSpeedMod(pn)
    SpeedMod = string.gsub(SpeedMod, 'c', '')
    SpeedMod = string.gsub(SpeedMod, 'm', '')
	SpeedMod = string.gsub(SpeedMod, 'x', '')
	
	if GetSpeedModType(pn) == 'c-mod' or GetSpeedModType(pn) == 'm-mod' then SpeedMod = SpeedMod/100 end
	
	Trace("GetSpeedModBase: The SpeedMod is " .. SpeedMod .. " returning " .. math.floor(SpeedMod) .. " as the base.")
    return tostring(math.floor(SpeedMod)) -- Consistency: all the others return a string due to concatenation or w/e
end

function GetSpeedModExtra(pn)
    local SpeedMod = GetSpeedMod(pn)
    SpeedMod = string.gsub(SpeedMod, 'c', '')
    SpeedMod = string.gsub(SpeedMod, 'm', '')
	SpeedMod = string.gsub(SpeedMod, 'x', '')
	
	if GetSpeedModType(pn) == 'c-mod' or GetSpeedModType(pn) == 'm-mod' then SpeedMod = SpeedMod/100 end

	Trace("GetSpeedModExtra: The SpeedMod is " .. SpeedMod .. " returning " .. '+' .. SpeedMod - math.floor(SpeedMod) .. " as extra.")
    return '+' .. SpeedMod - math.floor(SpeedMod)
end

function GetSpeedModType(pn)
    local SpeedMod = GetSpeedMod(pn)

    if string.find(SpeedMod, "x") ~= nil then Trace("GetSpeedModType: Returning " .. "x-mod"); return 'x-mod' end
    if string.find(SpeedMod, "c") ~= nil then Trace("GetSpeedModType: Returning " .. "c-mod"); return 'c-mod' end
    if string.find(SpeedMod, "m") ~= nil then Trace("GetSpeedModType: Returning " .. "m-mod"); return 'm-mod' end
end

function SpeedMods(name)
    local modList = GetBaseSpeeds()
    local s = "Speed"

    if name == "Extra" then
        modList = GetExtraSpeeds()
        s = "Extra " .. s
    end

    if name == "Type" then
        modList = GetSpeedModTypes()
        s = s .. " Type"
    end

    local Params = { Name = s, OneChoiceForAllPlayers = false }   

    local function Load(self, list, pn)
        -- default to the first item in the list
        list[1] = true

        -- now loop through everything else in the list and see if it is set to true
        for i=2, table.getn(modList) do
                if name == "Base" then
                    if modList[i] == GetSpeedModBase(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end

				
                if name == "Extra" then
                    if string.gsub(modList[i], 'x', '') == GetSpeedModExtra(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end
				
                if name == "Type" then				
					Trace("Comparing " .. modList[i] .. " with " .. GetSpeedModType(pn))
                    if modList[i] == GetSpeedModType(pn) then
                        list[i] = true
                        list[1] = false
                    else
                        list[i] = false
                    end
                end
        end
    end

    local function Save(self, list, pn)
        local SpeedMod = GetSpeedMod(pn)
        local ModBase = GetSpeedModBase(pn)
        local ModExtra = GetSpeedModExtra(pn)
        local ModType = GetSpeedModType(pn)
		
		Trace("SpeedMods: about to save. SpeedMod is " .. SpeedMod .. " ModBase is " .. ModBase .. " ModExtra is " .. ModExtra .. " ModType us " .. ModType)

        for i = 1, table.getn(modList) do
            if list[i] then
                if name == "Base" then ModBase = modList[i] end
                if name == "Extra" then ModExtra = modList[i] end
                if name == "Type" then ModType = modList[i] end
            end
        end
		
		Trace("SpeedMods: Did the for loop. SpeedMod is " .. SpeedMod .. " ModBase is " .. ModBase .. " ModExtra is " .. ModExtra .. " ModType us " .. ModType)
			
        SpeedMod = ModBase + ModExtra;
		
        if ModType == 'c-mod' then SpeedMod = 'c' .. SpeedMod*100 end
        if ModType == 'm-mod' then SpeedMod = 'm' .. SpeedMod*100 end
        if ModType == 'x-mod' then SpeedMod = SpeedMod .. 'x' end      
          
		Trace("SpeedMods: About to apply " .. SpeedMod)
		
		--[[ This is the most retarded thing. For some reason when you apply an M-Mod or an X-Mod you can
		get these weird situations where GAMESTATE:PlayerIsUsingModifier will tell you that there is an M and
		an X mod in use. Therefore GetSpeedMod often returns the wrong speed mod (this seems to happen most when
		you choose 0x or m0 and then try change the mod type). This is a silly fix that checks what the mod being
		set is, then set the other one (IE if we're setting X, then change M) to a value outside of where GetSpeedMod
		will ever look ]]--
		if ModType == 'm-mod' then GAMESTATE:ApplyGameCommand('mod,99x',pn+1) end --quick fix. Need to make it go just one higher than the highest possible according to GetSpeeds
		if ModType == 'x-mod' then GAMESTATE:ApplyGameCommand('mod,m9999',pn+1) end --quick fix. Need to make it go just one higher than the highest possible according to GetSpeeds
        GAMESTATE:ApplyGameCommand('mod,'..SpeedMod,pn+1) --this is so annoying, the player number has to be 1 or 2 for ApplyGameCommand
        MESSAGEMAN:Broadcast('SpeedModChanged')
    end

    return CreateOptionRow( Params, modList, Load, Save )
end