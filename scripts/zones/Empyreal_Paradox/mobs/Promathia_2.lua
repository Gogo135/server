-----------------------------------
-- Area: Empyreal Paradox
--  Mob: Promathia
-- Note: Phase 2
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.UFASTCAST, 50)
    mob:addMobMod(xi.mobMod.SIGHT_RANGE, 15)
    mob:addMobMod(xi.mobMod.SOUND_RANGE, 15)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 15)
end

entity.onMobSpawn = function(mob)
    local battlefield = mob:getBattlefield()
    if GetMobByID(ID.mob.PROMATHIA_OFFSET + battlefield:getArea()):isDead() then
        battlefield:setLocalVar("phaseChange", 0)
    end
end

entity.onMobEngaged = function(mob, target)
    local bcnmAllies = mob:getBattlefield():getAllies()
    for i, v in pairs(bcnmAllies) do
        if v:getName() == "Prishe" then
            if not v:getTarget() then
                v:entityAnimationPacket("prov")
                v:showText(v, ID.text.PRISHE_TEXT + 1)
                v:setLocalVar("ready", mob:getID())
            end
        else
            v:addEnmity(mob, 0, 1)
        end
    end

    mob:setLocalVar("spellWait", os.time() + 50)
end

entity.onMobFight = function(mob, target)
    if mob:getAnimationSub() == 3 and not mob:hasStatusEffect(xi.effect.STUN) then
        mob:setAnimationSub(0)
        mob:stun(1500)
    elseif
        mob:getAnimationSub() == 2 and
        not mob:hasStatusEffect(xi.effect.MAGIC_SHIELD)
    then
        mob:setAnimationSub(0)
    elseif
        mob:getAnimationSub() == 1 and
        not mob:hasStatusEffect(xi.effect.PHYSICAL_SHIELD)
    then
        mob:setAnimationSub(0)
    end

    local bcnmAllies = mob:getBattlefield():getAllies()
    for i, v in pairs(bcnmAllies) do
        if not v:getTarget() then
            v:addEnmity(mob, 0, 1)
        end
    end

    -- Uses Comet or Meteor every minute
    local spellWait = mob:getLocalVar("spellWait")
    if os.time() > spellWait and mob:canUseAbilities() then
        local chance = math.random(1, 4)
        if chance == 1 then
            mob:castSpell(219, target)
        else
            mob:castSpell(218, target)
        end
        mob:setLocalVar("spellWait", os.time() + 66)
    end
end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    elseif spell:getID() == 219 then
        spell:setMPCost(1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
