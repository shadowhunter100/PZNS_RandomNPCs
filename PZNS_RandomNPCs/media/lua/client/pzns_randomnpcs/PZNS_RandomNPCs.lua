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
local PZNS_RandomNPCs = {};
local PZNS_RandomNPCsData = require("pzns_randomnpcs/PZNS_RandomNPCsData");
local PZNS_RandomNPCsPresets = require("pzns_randomnpcs/PZNS_RandomNPCsPresets");
local PZNS_RandomNPCsPresetsOutfits = require("pzns_randomnpcs/PZNS_RandomNPCsPresetsOutfits");

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

--- Cows: Helper function to reduce copy-paste conditional spawn range checks.
---@param spawnX number
---@param spawnY number
---@param spawnZ number
---@return boolean
local function isNPCInSpawnRange(spawnX, spawnY, spawnZ)
    local playerSurvivor = getSpecificPlayer(0);
    return PZNS_WorldUtils.PZNS_IsSquareInPlayerSpawnRange(playerSurvivor, spawnX, spawnY, spawnZ);
end

--- Cows: Credits to "theangrybagel" who said he was too lazy to make a Git PR... so its here
--- Discord: @theangrybagel
---@return IsoGridSquare
local function getNearbySpawnSquare()
    -- WIP - Cows: TODO: Need to add some additional checks in the future, cannot spawn in player sight, cannot spawn in player home base, etc...
    local function getSpawnOffset()
        local maxDistance = SandboxVars.PZNS_RandomNPCs.SpawnDistance;
        local minDistance = math.floor(maxDistance * 2/3);
        local angle = ZombRandFloat(0, 2 * math.pi);
        local distance = ZombRandFloat(minDistance, maxDistance);
        local offset = {};
        offset.x = math.floor(distance * math.cos(angle));
        offset.y = math.floor(distance * math.sin(angle));
        return offset;
    end
    local spawnPos = {};
    local p = getSpecificPlayer(0);
    local spawnOffset = getSpawnOffset();
    spawnPos.x = p:getX() + spawnOffset.x;
    spawnPos.y = p:getY() + spawnOffset.y;
    local spawnSquare = getCell():getGridSquare(spawnPos.x, spawnPos.y, 0);
    return spawnSquare;
end

--- Cows: Initailize an in-game every hour check (about 2-3 minutes in real-life time by default).
local function initalizeRandomNPCsSpawn()
    if (isFrameWorkIsInstalled == true) then
        -- Cows: Do a cleanup before any spawning calls.
        local function cleanUpRandomNPCs()
            local dataTable = PZNS_RandomNPCsData.getOrCreateNPCDataTable();
            -- Cows: Check how many spawned NPCs are in default spawn range
            for _, npcSurvivor in pairs(dataTable) do
                ---@type IsoPlayer
                local npcIsoPlayerObject = npcSurvivor.npcIsoPlayerObject;
                if (npcIsoPlayerObject) then
                    local spawnX, spawnY, spawnZ = npcIsoPlayerObject:getX(), npcIsoPlayerObject:getY(),
                        npcIsoPlayerObject:getZ();
                    -- Cows: If the npc is out of range, remove them from the game world.
                    if (isNPCInSpawnRange(spawnX, spawnY, spawnZ) == false) then
                        PZNS_RandomNPCsData.removeNPCFromTableAndWorld(npcSurvivor);
                    end
                else
                    -- Cows: Else clean up if there's no IsoPlayer in the world.
                    PZNS_RandomNPCsData.removeNPCFromTableAndWorld(npcSurvivor);
                end
            end
        end
        -- Cows: Spawn the NPC conditionally with the sandbox options.
        local function spawnRandomNPCs()
            -- Cows: Spawn up to the number of NPCs specified
            local spawns = 0;
            for i = 1, SandboxVars.PZNS_RandomNPCs.HourlySpawnLimit do
                local spawnRoll = ZombRand(0, 100);
                local isSpawning = SandboxVars.PZNS_RandomNPCs.HourlySpawnChance >= spawnRoll;
                -- Cows: Check if an npc is spawning based on the spawn chance.
                if (isSpawning == true) then
                    spawns = spawns + 1;
                    local spawnLimit = SandboxVars.PZNS_RandomNPCs.MaxSpawnLimit;
                    local isIndoorSpawn = SandboxVars.PZNS_RandomNPCs.IndoorSpawnOnly;
                    -- Cows: Check how many NPCs are currently spawned and do nothing if limit is reached.
                    local currentNPCsCount = PZNS_RandomNPCsData.getNPCsCount();
                    if (currentNPCsCount >= spawnLimit) then
                        return;
                    end
                    local spawnSquare = getNearbySpawnSquare();
                    -- WIP - Cows: Check if indoor spawn is active, and select a random indoor square in the specified range for spawning.
                    if (isIndoorSpawn == true) then
                        -- Cows: If there are no valid indoor squares, do not spawn an NPC.
                    else
                        -- Cows: Else select a random square in the specified range for spawning.
                    end
                    local npcSurvivor = PZNS_RandomNPCs.spawnRandomNPCSurvivor(spawnSquare);
                    PZNS_RandomNPCsData.addNPCToTable(npcSurvivor);
                end
            end
        end
        Events.EveryHours.Add(cleanUpRandomNPCs);
        Events.EveryHours.Add(spawnRandomNPCs);
    end
end

--- Cows: Example of spawning in a random NPC.
---@param spawnSquare any
---@param survivorID any
---@return nil | unknown
function PZNS_RandomNPCs.spawnRandomNPCSurvivor(spawnSquare, survivorID)
    if (spawnSquare == nil) then
        return;
    end
    local isFemale = ZombRand(100) > 50; -- Cows: 50/50 roll for female spawn
    local npcForeName = SurvivorFactory.getRandomForename(isFemale);
    local npcSurname = SurvivorFactory.getRandomSurname();
    local gameTimeStampString = tostring(getTimestampMs());
    -- Cows: I recommend replacing the "PZNS_RandomNPCs_" prefix if another modder wants to create their own random spawns. As long as the ID is unique, there shouldn't be a problem
    local npcSurvivorID = "PZNS_RandomNPCs_" .. npcForeName .. "_" .. npcSurname .. "_" .. gameTimeStampString;
    if (survivorID ~= nil) then
        npcSurvivorID = survivorID;
    end
    --
    local npcSurvivor = PZNS_NPCsManager.createNPCSurvivor(
        npcSurvivorID,
        isFemale,
        npcSurname,
        npcForeName,
        spawnSquare
    );
    npcSurvivor.canSaveData = false; -- Cows: Default to false, so random NPCs will be cleaned up and removed as soon as they are unloaded.
    -- Cows: Setup the skills and outfit, plus equipment...
    PZNS_RandomNPCsPresets.useRandomPerks(npcSurvivor);
    PZNS_RandomNPCsPresetsOutfits.useOutfitRandom(npcSurvivor); -- Cows: Assign an outfit
    PZNS_RandomNPCsPresetsOutfits.useMeleeRandom(npcSurvivor);  -- Cows: Assign a random melee weapon.
    local isSpawnWithGun = SandboxVars.PZNS_RandomNPCs.SpawnChanceWithGun >= ZombRand(0, 100);
    -- Cows: Spawn with a gun using the sandboxVars value.
    if (isSpawnWithGun) then
        PZNS_RandomNPCsPresetsOutfits.useGunPistol(npcSurvivor);
    end
    -- Cows: Check if spawned NPC is hostile using sandboxVars value.
    local isNPCHostile = SandboxVars.PZNS_RandomNPCs.SpawnChanceHostile >= ZombRand(0, 100);
    if (isNPCHostile == true) then
        npcSurvivor.affection = 0;
        npcSurvivor.textObject:setDefaultColors(225, 0, 0, 0.8); -- Red text
    end
    -- Cows: Set the job last, otherwise the NPC will function as if it didn't have a weapon.
    npcSurvivor.jobName = "Wander In Cell";
    local activeNPCs = PZNS_UtilsDataNPCs.PZNS_GetCreateActiveNPCsModData();
    activeNPCs[npcSurvivorID] = npcSurvivor; -- Cows: This saves it to modData, which allows the npc to run while in-game, but does not create a save file.
    return npcSurvivor;
end

Events.OnGameStart.Add(checkIsFrameWorkIsInstalled);
Events.OnGameStart.Add(initalizeRandomNPCsSpawn);

return PZNS_RandomNPCs;
