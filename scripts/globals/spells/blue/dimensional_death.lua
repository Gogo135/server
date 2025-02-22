-----------------------------------
-- Spell: Dimensional Death
-- Damage varies with TP
-- Spell cost: 48 MP
-- Monster Type: Undead
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 5
-- Stat Bonus: DEX+1, CHR+1, HP+5
-- Level: 60
-- Casting Time: 0.5 seconds
-- Recast Time: 23.75 seconds
-- Skillchain Properties: Transfixion/Impaction
-- Combos: Accuracy Bonus
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
    params.ecosystem = xi.ecosystem.UNDEAD
    params.tpmod = TPMOD_ATTACK
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.H2H
    params.scattr = SC_TRANSFIXION
    params.scattr2 = SC_IMPACTION
    params.numhits = 1
    params.multiplier = 3.0 -- Default: 2.25
    params.tp150 = 3.25
    params.tp300 = 3.50
    params.azuretp = 4.0
    params.duppercap = 70
    params.str_wsc = 0.5
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
