-----------------------------------
-- Blade Ei
-- Katana weapon skill
-- Skill Level: 175
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: Dark
-- Modifiers: STR:30%  INT:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 1.25 params.ftp200 = 2 params.ftp300 = 4
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.3 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = xi.magic.ele.DARK
    params.skill = xi.skill.KATANA
    params.includemab = true
    -- to do ignore shadow and blink https://www.bg-wiki.com/ffxi/Blade:_Ei
    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.4 params.int_wsc = 0.6
        params.ftp200 = 2 params.ftp300 = 4
    end

    local damage, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, false, damage
end

return weaponskillObject
