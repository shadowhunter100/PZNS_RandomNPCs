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

---comment
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresets.usePresetLightOutfit(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Tshirt_PoliceBlue");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Police");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Ankle");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_Black");
    PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.Pistol");
    PZNS_UtilsNPCs.PZNS_SetLoadedGun(npcSurvivor);
    PZNS_UtilsNPCs.PZNS_AddItemToInventoryNPCSurvivor(npcSurvivor, "Base.9mmClip");
    PZNS_UtilsNPCs.PZNS_AddItemToInventoryNPCSurvivor(npcSurvivor, "Base.9mmClip");
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.Bullets9mm", 60);
    return npcSurvivor;
end

---comment
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresets.useGunPistol(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.Pistol");
    PZNS_UtilsNPCs.PZNS_SetLoadedGun(npcSurvivor);
    PZNS_UtilsNPCs.PZNS_AddItemToInventoryNPCSurvivor(npcSurvivor, "Base.9mmClip");
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.Bullets9mm", 15);
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.Bullets9mm", 15);
    return npcSurvivor;
end


return PZNS_RandomNPCsPresets;