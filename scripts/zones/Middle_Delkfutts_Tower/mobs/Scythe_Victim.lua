-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Scythe Victim BLM & WAR
-- Involved In Quest: Blade of Evil
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobFight = function(mob)
    -- mob:setMod(xi.mod.SILENCERESBUILD, 500)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
