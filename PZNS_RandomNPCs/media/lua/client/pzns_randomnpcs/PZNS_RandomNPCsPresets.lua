local PZNS_UtilsNPCs = require("02_mod_utils/PZNS_UtilsNPCs");
--------------------------------------- End Framework Requirements ---------------------------------------------
local PZNS_RandomNPCsPresets = {};

--- Cows: Basic Perks for NPCs.
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresets.usePresetPerks(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddNPCSurvivorPerkLevel(npcSurvivor, "Strength", 5);
    PZNS_UtilsNPCs.PZNS_AddNPCSurvivorPerkLevel(npcSurvivor, "Fitness", 5);
    PZNS_UtilsNPCs.PZNS_AddNPCSurvivorPerkLevel(npcSurvivor, "Aiming", 2);
    PZNS_UtilsNPCs.PZNS_AddNPCSurvivorPerkLevel(npcSurvivor, "Reloading", 2);
    return npcSurvivor;
end

--- Cows: Random Perks for NPCs.
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresets.useRandomPerks(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_SetNPCPerksRandomly(npcSurvivor);
    return npcSurvivor;
end

--- WIP - Cows: Have NPC use weapons based on their Perks.
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresets.usePerksBasedWeapons(npcSurvivor)
    return npcSurvivor;
end

return PZNS_RandomNPCsPresets;
