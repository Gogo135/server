-----------------------------------
-- Area: Vunkerl Inlet [S]
--   NM: Big Bang
-----------------------------------
require("scripts/globals/hunts")
mixins = { require("scripts/mixins/families/djinn") }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.MOVE, 12)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 488)
end

return entity
