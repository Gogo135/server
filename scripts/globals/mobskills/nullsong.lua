---------------------------------------------
--  Nullsong
--
--  Description: Removes all status effects in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
--  Notes:
---------------------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- can only used if not silenced
    if
        mob:getMainJob() == xi.job.BRD and
        not mob:hasStatusEffect(xi.effect.SILENCE)
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:eraseAllStatusEffect()
    local count = target:dispelAllStatusEffect()
    count = count + target:eraseAllStatusEffect()
    local damagePerBuff = math.random(80,109)

    if count == 0 then
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
    --else
        --skill:setMsg(xi.msg.basic.DISAPPEAR_NUM)
    end
    target:takeDamage(count*damagePerBuff, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return count * damagePerBuff
end

return mobskillObject
