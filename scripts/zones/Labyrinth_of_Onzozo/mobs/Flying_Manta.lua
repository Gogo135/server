-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Flying Manta
-- Note: PH for Lord of Onzozo and Peg Powler
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/rage")}
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    if mob:getID() == ID.mob.ONZOZO_PH then
        mob:setLocalVar("[rage]timer", 600) -- 10 minutes
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 774, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.LORD_OF_ONZOZO_PH, 4, 57600) -- 16 hour minimum
    xi.mob.phOnDespawn(mob, ID.mob.PEG_POWLER_PH, 4, 7200) -- 2 hour minimum
end

return entity
