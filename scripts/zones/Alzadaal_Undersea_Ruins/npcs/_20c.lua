-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Doors (North)
-- !pos 180 0 79 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/teleports")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if player:checkDistance(npc) < 3 then
        if player:getZPos() > 80 then
            player:messageSpecial(ID.text.STAGING_GATE_NYZUL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(106)
        elseif not player:hasKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS) then
            player:messageSpecial(ID.text.STAGING_GATE_NYZUL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(107)
        else
            player:messageSpecial(ID.text.CANNOT_LEAVE, xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
        end
    else
        player:messageSpecial(ID.text.STAGING_GATE_CLOSER)
    end
end

entity.onEventUpdate = function(player, csid, option)
    if csid == 106 and option == 0 then
        xi.teleport.clearEnmityList(player)
	end
end

entity.onEventFinish = function(player, csid, option)
end

return entity
