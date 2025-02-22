-----------------------------------
-- ID: 5656
-- Item: coffeecake_muffin_+1
-- Food Effect: 1Hr, All Races
-----------------------------------
-- Mind 2
-- Strength -1
-- MP % 10 (cap 90)
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) then
        result = xi.msg.basic.IS_FULL
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5656)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MND, 2)
    target:addMod(xi.mod.STR, -1)
    target:addMod(xi.mod.FOOD_MPP, 10)
    target:addMod(xi.mod.FOOD_MP_CAP, 90)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MND, 2)
    target:delMod(xi.mod.STR, -1)
    target:delMod(xi.mod.FOOD_MPP, 10)
    target:delMod(xi.mod.FOOD_MP_CAP, 90)
end

return itemObject
