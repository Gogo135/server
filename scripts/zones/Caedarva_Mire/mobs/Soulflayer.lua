-----------------------------------
-- Area: Caedarva Mire
--  Mob: Soulflayer
-- Note: PH for Vidhuwa the Wrathborn
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.VIDHUWA_PH, 20, 3600) -- 1 hour
end

return entity
