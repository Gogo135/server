-----------------------------------
-- Numbing Shot
-- Marksmanship weapon skill
-- Skill level: 290
-- Main of sub must be Ranger or Corsair
-- Aligned with the Thunder & Breeze Gorget.
-- Aligned with the Thunder Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: AGI 80%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.6 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.agi_wsc = 0.8
    end

    params.meleedmg = 0
    params.melee = true

    local weaponDamage       = 4
    local weaponType         = player:getWeaponSkillType(xi.slot.MAIN)
    local meleeWeapon        = player:getWeaponDmg() * 0.9
    local meleeWeaponOffhand = player:getOffhandDmg() * 0.35
    local rangedWeapon       = player:getRangedDmg()

    if weaponType == xi.skill.HAND_TO_HAND then
        weaponDamage = math.floor(player:getSkillLevel(1) * 110 / 276) -- +130 at capped A+ h2h
	else
        weaponDamage = meleeWeapon + rangedWeapon + meleeWeaponOffhand
	end
	
	if weaponDamage < 4 then
		weaponDamage = 4
	end
	
	params.meleedmg = math.ceil(weaponDamage * 1.5)

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, action, primary)

    if damage > 0 and not target:hasStatusEffect(xi.effect.PARALYSIS) then
        local duration = (tp / 1000 * 60) * applyResistanceAddEffect(player, target, xi.magic.ele.ICE, 0)
        target:addStatusEffect(xi.effect.PARALYSIS, 30, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
