-----------------------------------
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.SACRARIUM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6390, -- Obtained: <item>.
        GIL_OBTAINED                  = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6393, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6404, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS           = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7023, -- Your party is unable to participate because certain members' levels are restricted.
        CONQUEST_BASE                 = 7060, -- Tallying conquest results...
        LARGE_KEYHOLE_DESCRIPTION     = 7226, -- The gate is securely closed with two locks. This keyhole is engraved with a sealion insignia.
        SMALL_KEYHOLE_DESCRIPTION     = 7227, -- The gate is securely closed with two locks. This keyhole is engraved with a coral insignia.
        KEYHOLE_DAMAGED               = 7228, -- The keyhole is damaged.  The gate cannot be opened from this side.
        CANNOT_OPEN_SIDE              = 7229, -- The gate cannot be opened from this side.
        CANNOT_TRADE_NOW              = 7230, -- You cannot trade right now.
        STURDY_GATE                   = 7231, -- A sturdy iron gate. It is secured with two locks--a main lock and a sublock.
        HOLDING_THE_LOCK              = 7233, -- player is holding the lock open...
        HAND_GROWN_NUMB               = 7234, -- player's hand has grown numb!
        CORAL_KEY_BREAKS              = 7235, -- The <item> breaks!
        EVIL_PRESENCE                 = 7269, -- You sense an evil presence!
        DRAWER_OPEN                   = 7270, -- You open the drawer.
        DRAWER_EMPTY                  = 7271, -- There is nothing inside.
        DRAWER_SHUT                   = 7272, -- The drawer is jammed shut.
        CHEST_UNLOCKED                = 7361, -- You unlock the chest!
        START_GET_GOOSEBUMPS          = 7371, -- You start to get goosebumps.
        HEART_RACING                  = 7372, -- Your heart is racing.
        LEAVE_QUICKLY_AS_POSSIBLE     = 7373, -- Your common sense tells you to leave as quickly as possible.
        PRESENCE_FILLS                = 7375, -- An evil presence fills the room!
        NOTHING_HAPPENS               = 7376, -- Nothing happens.
        COMMON_SENSE_SURVIVAL         = 7380, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SWIFT_BELT_NMS          =
        {
            { 16892068, { [xi.race.HUME_M]   = true, [xi.race.HUME_F]   = true } }, -- Balor (hume)
            { 16892069, { [xi.race.ELVAAN_M] = true, [xi.race.ELVAAN_F] = true } }, -- Luaith (elvaan)
            { 16892070, { [xi.race.TARU_M]   = true, [xi.race.TARU_F]   = true } }, -- Lobais (tarutaru)
            { 16892073, { [xi.race.MITHRA]   = true } },                            -- Caithleann (mithra)
            { 16892074, { [xi.race.GALKA]    = true } },                            -- Indich (galka)
        },
        OLD_PROFESSOR_MARISELLE = 16891970,
        ELEL                    = 16891948,
    },
    npc =
    {
        STALE_DRAFT_OFFSET  = 16892097,
        LABYRINTH_OFFSET    = 16892110,
        SMALL_KEYHOLE       = 16892142,
        QM_MARISELLE_OFFSET = 16892155, -- qm_professor_mariselle in npc_list.sql
        TREASURE_CHEST      = 16892183,
        QM_TAVNAZIAN_COOKBOOK = 16892184,
    },
}

return zones[xi.zone.SACRARIUM]
