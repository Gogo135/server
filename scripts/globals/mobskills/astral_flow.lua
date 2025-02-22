-----------------------------------
-- Astral Flow
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/msg")
-----------------------------------
local mobskillObject = {}

local avatarOffsets =
{
    [17444883] = 3, -- Vermilion-eared Noberry
    [17444890] = 3, -- Vermilion-eared Noberry
    [17444897] = 3, -- Vermilion-eared Noberry
    [17453078] = 3, -- Duke Dantalian
    [17453085] = 3, -- Duke Dantalian
    [17453092] = 3, -- Duke Dantalian
    [17506670] = 5, -- Kirin
}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.USES)

    local mobID  = mob:getID()
    local pos = mob:getPos()
    local avatar = 0

    if avatarOffsets[mobID] then
        avatar = mobID + avatarOffsets[mobID]
    else
        avatar = mobID + 2 -- default offset
    end

    if not GetMobByID(avatar):isSpawned() then
        GetMobByID(avatar):setSpawn(pos.x + 1, pos.y, pos.z + 1, pos.rot)
        SpawnMob(avatar):updateEnmity(mob:getTarget())
    end

    return xi.effect.ASTRAL_FLOW
end

return mobskillObject
