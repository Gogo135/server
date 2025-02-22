-----------------------------------
-- Area: Halvung
--  Mob: Achamothcampa
-- Author: Spaceballs
-----------------------------------
local entity = {}
local ID = require("scripts/zones/Halvung/IDs")

local function spawnBig(mob, target)
    local mother = GetMobByID(ID.mob.ACHAMOTH) -- should be 17031600
    local big = mother:getLocalVar("bigAdds")
    local mobId = mob:getID()
    local mobPos = mob:getPos()

    -- Determine which mob should grow up, then do so
    if GetMobByID(17031603):isSpawned() then 
        local pet = GetMobByID(17031604)
        pet:setSpawn(mobPos.x + math.random(-2, 2), mobPos.y, mobPos.z + math.random(-2, 2), mobPos.r)
        pet:spawn(17031604) 
        pet:updateEnmity(target)    
    else
        local pet = GetMobByID(17031603)
        pet:setSpawn(mobPos.x + math.random(-2, 2), mobPos.y, mobPos.z + math.random(-2, 2), mobPos.r)
        pet:spawn(17031603)
        pet:updateEnmity(target)
    end
    
    GetMobByID(ID.mob.ACHAMOTH):setLocalVar("bigAdds", big + 1)
    local mobId = mob:getID()
    DespawnMob(mobId)
end


entity.onMobSpawn = function(mob)
    local mother = GetMobByID(ID.mob.ACHAMOTH)
    local motherTarget = mother:getTarget()
    -- "If a pet/avatar/automaton/wyvern has Achamoth's attention when the Achamothcampa spawns, the baby will depop."
    if motherTarget ~= nil and motherTarget:isPet() then
        DespawnMob(mob:getID())
    end
   -- mob:setMod(xi.mobMod.DAMAGE_ENMITY_PERC, 50)
    mob:setLocalVar("clock", os.time() + 40) 
    if math.random(1,2) == 1 then
        mob:setAnimationSub(1) -- weak to magic
        mob:setMod(xi.mod.UDMGPHYS,-100)
        mob:setMod(xi.mod.UDMGMAGIC, 500)
    else
        mob:setAnimationSub(0) -- weak to phys
        mob:setMod(xi.mod.UDMGPHYS, 400)
        mob:setMod(xi.mod.UDMGMAGIC, -100)
    end
end


entity.onMobDeath = function(mob)
end

entity.onMobDespawn = function(mob)
    local mother = GetMobByID(ID.mob.ACHAMOTH) 
    if mother:isSpawned() then
        mother:setLocalVar("smallAdds", mother:getLocalVar("smallAdds") - 1)
    end
end

entity.onMobFight = function(mob, target)
    local now = os.time()
    local popTime = mob:getLocalVar("clock")

    if now >= popTime then
        spawnBig(mob, target)
    end
end 
return entity