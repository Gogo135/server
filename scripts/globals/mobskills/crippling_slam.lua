-----------------------------------
--  Crippling Slam
--
--  Description: Delivers an area attack. Additional effect duration varies with TP. Additional effect: Paralysis.
--  Type: Physical
--  Shadow per hit
--  Range: Unknown range
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 1.5
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
    local typeEffect = xi.effect.PARALYSIS
    local duration = 20 * (math.random(1,2) / 1)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 30, 0, duration)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskillObject
