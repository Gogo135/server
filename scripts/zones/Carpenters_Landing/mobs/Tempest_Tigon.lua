-----------------------------------
-- Area: Carpenters' Landing
--   NM: Tempest Tigon
-----------------------------------
require("scripts/globals/hunts")
local ID = require("scripts/zones/Carpenters_Landing/IDs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    if math.random() > .5 then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENAERO, { chance = 50 })
    else
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENWATER, { chance = 50 })
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 168)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(ID.mob.TEMPEST_TIGON, math.random(3600, 7200)) -- 1 to 2 hours
end

return entity
