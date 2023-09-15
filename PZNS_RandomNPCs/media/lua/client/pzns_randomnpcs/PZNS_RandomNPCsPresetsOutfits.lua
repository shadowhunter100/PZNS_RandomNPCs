local PZNS_UtilsNPCs = require("02_mod_utils/PZNS_UtilsNPCs");
--------------------------------------- End Framework Requirements ---------------------------------------------
local PZNS_RandomNPCsPresetsOutfits = {};

--- Cows: Basic Outfit for Denim Survivor NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitDenimSurvivor(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Hat_HardHat");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shirt_Denim");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_DigitalBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Denim");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Long");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_BlackBoots");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Firefighter/fireman NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitFirefighter(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Hat_Fireman");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Jacket_Fireman");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Tshirt_Profession_FiremanWhite");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_DigitalBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Fireman");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Long");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_BlackBoots");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Office-based NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitOfficeGuy(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Hat_CrashHelmet_Police");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Suit_Jacket");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Suit");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_DigitalBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Ankle");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_Random");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Police NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitPolice(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Hat_CrashHelmet_Police");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Tshirt_PoliceBlue");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Police");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_DigitalBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Ankle");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_Black");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Priest NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitPriest(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shirt_Priest");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_ClassicBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Black");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Ankle");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_Black");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Ranger NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitRanger(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Hat_Ranger");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Tshirt_Profession_RangerGreen");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.WristWatch_Left_DigitalBlack");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Trousers_Ranger");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Long");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_BlackBoots");
    return npcSurvivor;
end

--- Cows: Basic Outfit for Prisoner NPCs.
function PZNS_RandomNPCsPresetsOutfits.useOutfitPrisoner(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Boilersuit_Prisoner");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Socks_Ankle");
    PZNS_UtilsNPCs.PZNS_AddEquipClothingNPCSurvivor(npcSurvivor, "Base.Shoes_Brown");
    return npcSurvivor;
end

--- Cows: Random outfits by roll.
---@param npcSurvivor any
---@return any
function PZNS_RandomNPCsPresetsOutfits.useOutfitRandom(npcSurvivor)
    local roll = ZombRand(1, 8);
    local rolled = "r" .. tostring(roll);
    local outfitsTable = {
        r1 = PZNS_RandomNPCsPresetsOutfits.useOutfitDenimSurvivor,
        r2 = PZNS_RandomNPCsPresetsOutfits.useOutfitFirefighter,
        r3 = PZNS_RandomNPCsPresetsOutfits.useOutfitOfficeGuy,
        r4 = PZNS_RandomNPCsPresetsOutfits.useOutfitPolice,
        r5 = PZNS_RandomNPCsPresetsOutfits.useOutfitPriest,
        r6 = PZNS_RandomNPCsPresetsOutfits.useOutfitRanger,
        r7 = PZNS_RandomNPCsPresetsOutfits.useOutfitPrisoner,
    };
    -- Cows: Check if if the roll is valid
    if (outfitsTable[rolled] ~= nil) then
        outfitsTable[rolled](npcSurvivor);
    else
        PZNS_RandomNPCsPresetsOutfits.useOutfitDenimSurvivor(npcSurvivor)
    end
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
