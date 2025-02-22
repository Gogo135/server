-----------------------------------
-- Xenoglossia
-- Prepares next spell for instant casting.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:setLocalVar("Xenoglossia", 1)
    skill:setMsg(xi.msg.basic.NONE)
end

return mobskillObject
