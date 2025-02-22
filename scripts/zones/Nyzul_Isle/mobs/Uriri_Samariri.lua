-----------------------------------
--  MOB: Uriri Samariri
-- Area: Nyzul Isle
-- Info: Enemy Leader, Spams Water Bomb
-----------------------------------
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
end


entity.onMobWeaponSkillPrepare = function(mob, target)
    return 1959 -- Water Bomb
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
        local instance = mob:getInstance()
        local chars    = instance:getChars()

        for _, entities in ipairs(chars) do
            if player:hasStatusEffect(xi.effect.COSTUME) then
                player:delStatusEffect(xi.effect.COSTUME)
            end
        end
    end
end

return entity
