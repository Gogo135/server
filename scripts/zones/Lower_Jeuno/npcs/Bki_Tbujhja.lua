-----------------------------------
-- Area: Lower Jeuno
--  NPC: Bki Tbujhja
-- Involved in Quest: The Old Monument
-- Starts and Finishes Quests: Path of the Bard (just start), The Requiem (BARD AF2)
-- !pos -22 0 -60 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- THE REQUIEM (holy water)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_REQUIEM) == QUEST_ACCEPTED and
        player:getCharVar("TheRequiemCS") == 2 and
        trade:hasItemQty(4154, 1) and
        trade:getItemCount() == 1
    then
        player:startEvent(151)
    end
end

entity.onTrigger = function(player, npc)
    local theRequiem = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_REQUIEM)

    -- PATH OF THE BARD (Bard Flag)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_MINSTREL_IN_DESPAIR) == QUEST_COMPLETED and
        player:getCharVar("PathOfTheBard_Event") == 0
    then
        player:startEvent(182) -- mentions song runes in Valkurm

    -- THE REQUIEM (Bard AF2)
    elseif
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.PAINFUL_MEMORY) == QUEST_COMPLETED and
        theRequiem == QUEST_AVAILABLE and
        player:getMainJob() == xi.job.BRD and
        player:getMainLvl() >= xi.settings.main.AF2_QUEST_LEVEL or
        player:getSubJob() == xi.job.BRD and -- Umeboshi
        player:getSubLvl() >= xi.settings.main.AF2_QUEST_LEVEL
    then
        if player:getCharVar("TheRequiemCS") == 0 then
            player:startEvent(145) -- Long dialog & Start Quest "The Requiem"
        else
            player:startEvent(148) -- Shot dialog & Start Quest "The Requiem"
        end

    elseif
        theRequiem == QUEST_ACCEPTED and
        player:getCharVar("TheRequiemCS") == 2
    then
        player:startEvent(146) -- During Quest "The Requiem" (before trading Holy Water)

    elseif
        theRequiem == QUEST_ACCEPTED and
        player:getCharVar("TheRequiemCS") == 3 and
        not player:hasKeyItem(xi.ki.STAR_RING1)
    then
        if math.random(1, 2) == 1 then
            player:startEvent(147) -- oh, did you take the holy water and play the requiem? you must do both!
        else
            player:startEvent(149) -- his stone sarcophagus is deep inside the eldieme necropolis.
        end

    elseif
        theRequiem == QUEST_ACCEPTED and
        player:hasKeyItem(xi.ki.STAR_RING1)
    then
        player:startEvent(150) -- Finish Quest "The Requiem"

    elseif theRequiem == QUEST_COMPLETED then
        player:startEvent(134) -- Standard dialog after "The Requiem"

    -- DEFAULT DIALOG
    else
        player:startEvent(180)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- PATH OF THE BARD
    if csid == 182 then
        player:setCharVar("PathOfTheBard_Event", 1)

    -- THE REQUIEM
    elseif csid == 145 and option == 0 then
        player:setCharVar("TheRequiemCS", 1) -- player declines quest
    elseif
        (csid == 145 or csid == 148) and
        option == 1
    then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_REQUIEM)
        player:setCharVar("TheRequiemCS", 2)

    elseif csid == 151 then
        player:setCharVar("TheRequiemCS", 3)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4154) -- Holy Water (just message)
        player:setCharVar("TheRequiemRandom", math.random(1, 5)) -- pick a random sarcophagus

    elseif csid == 150 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 14098)
        else
            player:addItem(14098)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 14098) -- Choral Slippers
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_REQUIEM)
        end
    end
end

return entity
