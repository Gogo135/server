-----------------------------------
-- Area: Bhaflau Thickets
-- Door: Heavy Iron Gate
-- !pos -180 -10 -758 52
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:checkDistance(npc) < 3 then
        if player:getZPos() > -761 then
            player:messageSpecial(ID.text.STAGING_GATE_MAMOOL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(106)
        elseif not player:hasKeyItem(xi.ki.MAMOOL_JA_ASSAULT_ORDERS) then
            player:messageSpecial(ID.text.STAGING_GATE_MAMOOL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(107)
        else
            player:messageSpecial(ID.text.CANNOT_LEAVE, xi.ki.MAMOOL_JA_ASSAULT_ORDERS)
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
