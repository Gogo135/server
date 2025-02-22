-----------------------------------
-- Area: Altar Room
--  NPC: Stone Lid
-- !pos -316.4390, 24.7654, 12.1590
-----------------------------------
local ID = require("scripts/zones/Altar_Room/IDs")
require("scripts/globals/items")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local moralmanifest = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.A_MORAL_MANIFEST)
    if moralmanifest == QUEST_ACCEPTED and player:getCharVar("moral") == 7 then
        if trade:hasItemQty(xi.items.YAGUDO_HEADGEAR, 1) then -- Trade Yagudo Headgear
            player:tradeComplete()
            player:startEvent(50)
        end
    end
end

entity.onTrigger = function(player, npc)
    -- local moralmanifest = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.A_MORAL_MANIFEST)
    local moral = player:getCharVar("moral")
    local head = player:getEquipID(xi.slot.HEAD)
    if moral == 5 and head == xi.items.YAGUDO_HEADGEAR then
        player:startEvent(48)
    elseif moral == 6 then
        player:startEvent(49)
    else
        return
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 48 then
        local mobs =
        {
            ID.mob.YAGUDO_AVATAR,
            ID.mob.DUU_MASA_THE_ONECUT,
            ID.mob.FEE_JUGE_THE_RAMFIST,
            ID.mob.GOO_PAKE_THE_BLOODHOUND,
            ID.mob.KEE_TAW_THE_NIGHTINGALE,
            ID.mob.LAA_YAKU_THE_AUSTERE,
            ID.mob.POO_YOZO_THE_BABBLER,
        }

        local npc = GetNPCByID(ID.npc.STONE_LID)
        if npcUtil.popFromQM(player, npc, mobs, { hide = 1 }) then
            player:messageSpecial(ID.text.DRAWS_NEAR,xi.ki.VAULT_QUIPUS)
        end
    elseif csid == 49 then
        player:setCharVar("moral", 7)
    elseif csid == 50 then
        if npcUtil.giveItem(player, xi.items.TSOO_HAJAS_HEADGEAR) then
            player:setCharVar("moral", 8)
        end
    end
end

return entity
