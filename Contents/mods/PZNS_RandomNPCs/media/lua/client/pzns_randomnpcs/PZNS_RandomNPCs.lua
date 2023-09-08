local PZNS_DebuggerUtils = require("02_mod_utils/PZNS_DebuggerUtils");
local PZNS_UtilsDataNPCs = require("02_mod_utils/PZNS_UtilsDataNPCs");
local PZNS_UtilsNPCs = require("02_mod_utils/PZNS_UtilsNPCs");
local PZNS_WorldUtils = require("02_mod_utils/PZNS_WorldUtils");
local PZNS_NPCGroupsManager = require("04_data_management/PZNS_NPCGroupsManager");
local PZNS_NPCsManager = require("04_data_management/PZNS_NPCsManager");
--------------------------------------- End Framework Requirements ---------------------------------------------
-- Cows: Mod Variables.
local isFrameWorkIsInstalled = false;
local frameworkID = "PZNS_Framework";
local PZNS_RandomNPCsPresets = require("pzns_randomnpcs/PZNS_RandomNPCsPresets");
local PZNS_RandomNPCs = {};

--- Cows: Helper function to reduce copy-paste conditional spawn range checks.
---@param spawnX number
---@param spawnY number
---@param spawnZ number
---@return boolean
local function isNPCInSpawnRange(spawnX, spawnY, spawnZ)
    local playerSurvivor = getSpecificPlayer(0);
    local isInSpawnRange = PZNS_WorldUtils.PZNS_IsSquareInPlayerSpawnRange(playerSurvivor, spawnX, spawnY, spawnZ);
    return isInSpawnRange;
end

--- Cows: Example of spawning in a random NPC.
---@return boolean
function PZNS_RandomNPCs.spawnRandomNPCSurvivor(targetSquare, survivorID)
    local isFemale = ZombRand(100) > 50; -- Cows: 50/50 roll for female spawn
    local npcForeName = SurvivorFactory.getRandomForename(isFemale);
    local npcSurname = SurvivorFactory.getRandomSurname();
    local gameTimeStampString = tostring(getTimestampMs());
    -- Cows: I recommend replacing the "PZNS_Survivor_" prefix if another modder wants to create their own random spawns. As long as the ID is unique, there shouldn't be a problem
    local npcSurvivorID = "PZNS_RandomNPC_" .. npcForeName .. "_" .. npcSurname .. "_" .. gameTimeStampString;
    if (survivorID ~= nil) then
        npcSurvivorID = survivorID;
    end
    --
    local npcSurvivor = PZNS_NPCsManager.createNPCSurvivor(
        npcSurvivorID,
        isFemale,
        npcSurname,
        npcForeName,
        targetSquare
    );
    npcSurvivor.affection = ZombRand(100); -- Cows: Random between 0 and 100 affection, not everyone will love the player.
    npcSurvivor.canSaveData = false;
    -- Cows: Setup the skills and outfit, plus equipment...
    PZNS_UtilsNPCs.PZNS_SetNPCPerksRandomly(npcSurvivor);
    --
    PZNS_RandomNPCsPresets.usePresetLightOutfit(npcSurvivor);
    local spawnWithGun = ZombRand(0, 100) > 50;
    if (spawnWithGun) then
        PZNS_RandomNPCsPresets.usePistol(npcSurvivor);
    else
        PZNS_UtilsNPCs.PZNS_AddEquipWeaponNPCSurvivor(npcSurvivor, "Base.BaseballBat");
    end
    -- Cows: Set the job last, otherwise the NPC will function as if it didn't have a weapon.
    npcSurvivor.jobName = "Wander In Cell";
    local activeNPCs = PZNS_UtilsDataNPCs.PZNS_GetCreateActiveNPCsModData();
    activeNPCs[npcSurvivorID] = npcSurvivor; -- Cows: This saves it to modData, which allows the npc to run while in-game, but does not create a save file.
    return npcSurvivor;
end

--- Cows: Check if the Framework installed and create a group if true (and if needed)
---@return boolean
local function checkIsFrameWorkIsInstalled()
    local activatedMods = getActivatedMods();
    if (activatedMods:contains(frameworkID)) then
        isFrameWorkIsInstalled = true;
    else
        local function callback()
            getSpecificPlayer(0):Say("!!! PZNS_Framework IS NOT INSTALLED !!!");
        end
        Events.EveryOneMinute.Add(callback); -- Cows: Else alert user about not having PZNS_Framework installed...
    end

    return isFrameWorkIsInstalled;
end

--- Cows: This is an in-game every one minute check (about 2 seconds in real-life time by default)
--- This is needed because not all NPCs will spawn within range of the player's loaded cell and must therefore be checked regularly to spawn in-game.
local function npcsSpawnCheck()
    if (isFrameWorkIsInstalled == true) then
        -- Cows: These callbacks are essential to clean up the EveryOneMinute event calls, otherwise they remain in-game forever.

        --
        local function checkIsNPCSpawned()
        end
        Events.EveryOneMinute.Add(checkIsNPCSpawned);
    end
end

Events.OnGameStart.Add(checkIsFrameWorkIsInstalled);
Events.OnGameStart.Add(npcsSpawnCheck);

return PZNS_RandomNPCs;
