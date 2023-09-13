local PZNS_UtilsNPCs = require("02_mod_utils/PZNS_UtilsNPCs");
--------------------------------------- End Framework Requirements ---------------------------------------------
local PZNS_RandomNPCsPresetsOutfits = {};

--- Cows: Random outfits using the vanilla game API
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresetsOutfits.useRandomOutfit(npcSurvivor)
    ---@type IsoPlayer
    local npcIsoPlayerObject = npcSurvivor.npcIsoPlayerObject;
    npcIsoPlayerObject:dressInRandomOutfit();
    return npcSurvivor;
end

--- Cows: Random Melee Weapons
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresetsOutfits.useMeleeRandom(npcSurvivor)
    local roll = ZombRand(1, 11);
    local rolled = "r" .. tostring(roll);
    local weaponMeleeTable = {
        r1 = "Base.Screwdriver",
        r2 = "Base.SpearCrafted",
        r3 = "Base.KitchenKnife",
        r4 = "Base.Machete",
        r5 = "Base.Nightstick",
        r6 = "Base.Hammer",
        r7 = "Base.BaseballBat",
        r8 = "Base.Golfclub",
        r9 = "Base.HandAxe",
        r10 = "Base.Axe"
    };
    -- Cows: Check if if the roll is valid
    if (weaponMeleeTable[rolled] ~= nil) then
        PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, weaponMeleeTable[rolled]);
    else
        PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.BaseballBat");
    end
    return npcSurvivor;
end

--- Cows: Using the vanilla pistol
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresetsOutfits.useGunPistol(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.Pistol");
    PZNS_UtilsNPCs.PZNS_SetLoadedGun(npcSurvivor);
    PZNS_UtilsNPCs.PZNS_AddItemToInventoryNPCSurvivor(npcSurvivor, "Base.9mmClip");
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.Bullets9mm", 15);
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.Bullets9mm", 15);
    return npcSurvivor;
end

--- Cows: Using the vanilla shotgun
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresetsOutfits.useGunShotgun(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.Shotgun");
    PZNS_UtilsNPCs.PZNS_SetLoadedGun(npcSurvivor);
    PZNS_UtilsNPCs.PZNS_AddItemsToInventoryNPCSurvivor(npcSurvivor, "Base.ShotgunShells", 30);
    return npcSurvivor;
end

return PZNS_RandomNPCsPresetsOutfits;
