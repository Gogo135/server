-----------------------------------
-- Spell: Death Scissors
-- Damage varies with TP
-- Spell cost: 51 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 5
-- Stat Bonus: MND+2, CHR+2, HP+5
-- Level: 60
-- Casting Time: 0.5 seconds
-- Recast Time: 24.5 seconds
-- Skillchain Properties: Compression/Reverberation
-- Combos: Attack Bonus
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
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = SC_COMPRESSION
    params.scattr2 = SC_REVERBERATION
    params.numhits = 1
    params.multiplier = 3.0 -- Default: 1.5
    params.tp150 = 3.15
    params.tp300 = 3.25
    params.azuretp = 4.0
    params.duppercap = 100 -- 74
    params.str_wsc = 0.6
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
