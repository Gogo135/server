-----------------------------------
-- Area: Mount Zhayolm
-- Door: Heavy Iron Gate
-- !pos 660 -27 328 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:checkDistance(npc) < 3 then
        if player:getZPos() < 332 then
            player:messageSpecial(ID.text.STAGING_GATE_HALVUNG)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(106)
        elseif not player:hasKeyItem(xi.ki.LEBROS_ASSAULT_ORDERS) then
            player:messageSpecial(ID.text.STAGING_GATE_HALVUNG)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(107)
        else
            player:messageSpecial(ID.text.CANNOT_LEAVE, xi.ki.LEBROS_ASSAULT_ORDERS)
        end
    else
        player:messageSpecial(ID.text.STAGING_GATE_CLOSER)
    end
end

entity.onEventUpdate = function(player, csid, option)
    if csid == 106 and option == 0 then
		for _, entry in pairs(player:getNotorietyList()) do
			entry:clearEnmity(player) -- reset hate on player entering staging point
		end
	end
end

entity.onEventFinish = function(player, csid, option)
end

return entity
