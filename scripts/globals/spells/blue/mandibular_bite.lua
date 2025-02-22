-----------------------------------
-- Spell: Mandibular Bite
-- Damage varies with TP
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 44
-- Casting Time: 0.5 seconds
-- Recast Time: 19.25 seconds
-- Skillchain property(ies): Induration
-- Combos: Plantoid Killer
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
    params.tpmod = TPMOD_ATTACK
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = SC_INDURATION
    params.numhits = 1
    params.multiplier = 3.0 -- Default: 2.0
    params.tp150 = 3.2
    params.tp300 = 3.5
    params.azuretp = 4.25
    params.duppercap = 45
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
