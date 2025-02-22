-----------------------------------
--  MOB: Cumin Custard
-- Area: Nyzul Isle
-- Info: Enemy Leader, Absorbs wind elemental damage
-----------------------------------
mixins = { require('scripts/mixins/families/flan') }
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.WIND_ABSORB, 100)
end

entity.onSpellPrecast = function(mob, spell)
    if (mob:getLocalVar("Xenoglossia") > 0) then
        mob:setLocalVar("Xenoglossia", 0)
        spell:castTime(1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
