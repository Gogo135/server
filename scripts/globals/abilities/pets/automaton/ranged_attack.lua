-----------------------------------
-- Ranged Attack
-----------------------------------
require("scripts/globals/automatonweaponskills")
-----------------------------------
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    local params =
    {
        numHits = 1,
        atkmulti = 1.5,
        ftp100 = 1.0,
        ftp200 = 1.0,
        ftp300 = 1.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.5,
        dex_wsc = 0.25,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    if automaton:getMod(xi.mod.AUTOMATON_CAN_BARRAGE) == 1 and master:getLocalVar("lastAutoBarrageUsed") + 180 < os.time() and math.random() < 0.6 then
        local maneuvers = master:countEffect(xi.effect.WIND_MANEUVER)
        if maneuvers > 0 then
            params.numHits = maneuvers + 2
            for i = 1, maneuvers do
                master:delStatusEffect(xi.effect.WIND_MANEUVER)
            end
            master:setLocalVar("lastAutoBarrageUsed",os.time())
        end
    end

    local damage = doAutoRangedWeaponskill(automaton, target, 0, params, 1000, true, skill, action)

    return damage
end

return abilityObject
