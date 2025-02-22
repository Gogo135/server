-----------------------------------
-- Area: Norg
--  NPC: Ryoma
-- Start and Finish Quest: 20 in Pirate Years, I'll Take the Big Box, True Will, Bugi Soden
-- !pos -23 0 -9 252
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local twentyInPirateYears = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
    local illTakeTheBigBox = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX)
    local trueWill = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRUE_WILL)
    local mLvl = player:getMainLvl()
    local mJob = player:getMainJob()
    local sLvl = player:getSubLvl() -- Umeboshi
    local sJob = player:getSubJob()

    if
        twentyInPirateYears == QUEST_AVAILABLE and
        mJob == xi.job.NIN and
        mLvl >= 40 or
        sJob == xi.job.NIN and
        sLvl >= 40 -- Umeboshi
    then
        player:startEvent(133) -- Start Quest "20 in Pirate Years"
    elseif
        twentyInPirateYears == QUEST_ACCEPTED and
        player:hasKeyItem(xi.ki.TRICK_BOX)
    then
        player:startEvent(134) -- Finish Quest "20 in Pirate Years"
    elseif
        twentyInPirateYears == QUEST_COMPLETED and
        illTakeTheBigBox == QUEST_AVAILABLE and
        mJob == xi.job.NIN and
        mLvl >= 50 or
        sJob == xi.job.NIN and
        sLvl >= 50 and -- Umeboshi
        not player:needToZone()
    then
        player:startEvent(135) -- Start Quest "I'll Take the Big Box"
    elseif illTakeTheBigBox == QUEST_COMPLETED and trueWill == QUEST_AVAILABLE then
        player:startEvent(136) -- Start Quest "True Will"
    elseif
        player:hasKeyItem(xi.ki.OLD_TRICK_BOX) and
        player:getCharVar("trueWillCS") == 0
    then
        player:startEvent(137)
    elseif player:getCharVar("trueWillCS") == 1 then
        player:startEvent(138)
    end
end

entity.onEventFinish = function(player, csid, option)
    if csid == 133 then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
        player:setCharVar("twentyInPirateYearsCS", 1)
    elseif csid == 134 then
        if player:getFreeSlotsCount() <= 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17771)
        else
            player:delKeyItem(xi.ki.TRICK_BOX)
            player:addItem(17771)
            player:addItem(17772)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17771) -- Anju
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17772) -- Zushio
            player:needToZone()
            player:setCharVar("twentyInPirateYearsCS", 0)
            player:addFame(xi.quest.fame_area.NORG, 30)
            player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TWENTY_IN_PIRATE_YEARS)
        end
    elseif csid == 135 then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX)
    elseif csid == 136 then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRUE_WILL)
    elseif csid == 137 then
        player:setCharVar("trueWillCS", 1)
    end
end

return entity
