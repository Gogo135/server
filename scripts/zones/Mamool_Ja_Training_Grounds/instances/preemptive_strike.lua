-----------------------------------
-- Assault: Preemptive Strike
-----------------------------------
require("scripts/globals/instance")
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
-----------------------------------
local instanceObject = {}

instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.ASSAULT_12_START, 12)
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

instanceObject.onInstanceCreated = function(instance)
    for i, v in pairs(ID.mob[1]) do
        SpawnMob(v, instance)
    end

    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setPos(-57, 1, -101, 49)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setPos(-57, 1, -104, 49)
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    if instance then
        player:setInstance(instance)
        player:setPos(0, 0, 0, 0, instance:getZone():getID())
    end
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    xi.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(102)
    end
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 13 then
        instance:complete()
    end
end

instanceObject.onInstanceComplete = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.RUNE_UNLOCKED_POS, 8, 8)
    end

    GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance):setStatus(xi.status.NORMAL)
    GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance):setStatus(xi.status.NORMAL)
end

instanceObject.onEventUpdate = function(player, csid, option)
end

instanceObject.onEventFinish = function(player, csid, option)
end

return instanceObject
