-----------------------------------
-- Mercy Stroke
-- Dagger weapon skill
-- Skill level: N/A
-- Batardeau/Mandau: Temporarily improves params.critical hit rate.
-- Aftermath gives +5% params.critical hit rate.
-- Must have Batardeau, Mandau, or Clement Skean equipped.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
    params.str_wsc = 0.8 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
        params.str_wsc = 0.8
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
