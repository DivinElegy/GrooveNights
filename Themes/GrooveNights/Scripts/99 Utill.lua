--[[
Allows easy use of diffuse() in metrics.ini (or anywhere else). To use it:
    P1PercentOnCommand=%function(self) DiffuseHex(self, '#FFCCDD') end
]]--
function DiffuseHex( Actor, color ) 
   local f = { 1, 1, 1, 1 } 
   local num = (string.len(color)-1) / 2 
   local results = { string.find(color, "^#(%x%x)(%x%x)(%x%x)$") } 

   for i = 1, num do f[i] = tonumber(results[i+2], 16) / 255 end 
   Actor:diffuse( f[1], f[2], f[3], f[4] ) 
end 

function testfunction(msg)
    SCREENMAN:SystemMessage(msg)
end
