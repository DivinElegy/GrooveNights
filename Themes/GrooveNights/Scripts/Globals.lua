local GlobalsTable = {}

function RegisterGlobal(Actor, name)
	-- Todo: check that this global isn't already registered	
	GlobalsTable[name] = Actor:GetText()	
end

function GetGlobal(name)
	return GlobalsTable[name]
end