-----------------------------------
-- Area: Mhaura
--  NPC: Pikini-Mikini
-- Standard Merchant NPC
-- !pos -48 -4 30 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4150, 2335,    -- Eye Drops
        4148,  284,    -- Antidote
        4151,  720,    -- Echo Drops
        4112,  819,    -- Potion
        4509,   10,    -- Distilled Water
        917,  1821,    -- Parchment
        17395,   9,    -- Lugworm
        1021,  450,    -- Hatchet
        4376,  108,    -- Meat Jerky
        5299,  133,    -- Salsa
        2867, 9000,    -- Mhaura Waystone
        xi.items.SCROLL_OF_REGEN,     3974,
        xi.items.SCROLL_OF_REGEN_II,  7203,
        xi.items.SCROLL_OF_SLEEPGA,  10304,
    }

    player:showText(npc, ID.text.PIKINIMIKINI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
