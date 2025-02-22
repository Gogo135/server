-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-----------------------------------
local riverneAGlobal = require("scripts/zones/Riverne-Site_A01/globals")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    riverneAGlobal.unstableDisplacementTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    riverneAGlobal.unstableDisplacementTrigger(player, npc, 32)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 32 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:clearEnmity(player) -- reset hate on player after teleporting
        end
    end
end

return entity
