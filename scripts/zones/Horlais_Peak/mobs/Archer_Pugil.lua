-----------------------------------
-- Area: Horlais Peak
--  Mob: Archer Pugil
-- BCNM: Shooting Fish
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobSkillAttack(5336)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
