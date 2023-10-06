local PZNS_UtilsNPCs = require("02_mod_utils/PZNS_UtilsNPCs");
--------------------------------------- End Framework Requirements ---------------------------------------------

local PZNS_RandomNPCsData = {};
local randomNPCsTable = {};

---comment
---@return integer
function PZNS_RandomNPCsData.getNPCsCount()
    return #randomNPCsTable;
end

---comment
---@return table
function PZNS_RandomNPCsData.getOrCreateNPCDataTable()
    randomNPCsTable = ModData.getOrCreate("PZNS_RandomNPCsDataTable");
    return randomNPCsTable;
end

---comment
---@param npcSurvivor any
---@return table
function PZNS_RandomNPCsData.addNPCToTable(npcSurvivor)
    randomNPCsTable[npcSurvivor.survivorID] = npcSurvivor;
    return randomNPCsTable;
end

--- Cows: If the random NPC is invited by the player (canSaveData = true), the npc will be managed and saved by the main PZNS framework.
---@param npcSurvivor any
---@return table
function PZNS_RandomNPCsData.removeNPCFromTableAndWorld(npcSurvivor)
    PZNS_UtilsNPCs.PZNS_ClearQueuedNPCActions(npcSurvivor);
    local npcIsoPlayer = npcSurvivor.npcIsoPlayerObject;
    -- Cows Check if IsoPlayer object exists.
    if (npcIsoPlayer ~= nil) then
        -- Cows: Remove the IsoPlayer from the world then nil the table key-value data.
        npcIsoPlayer:removeFromSquare();
        npcIsoPlayer:removeFromWorld();
    end
    randomNPCsTable[npcSurvivor.survivorID] = nil;
    return randomNPCsTable;
end

---comment
---@return table
function PZNS_RandomNPCsData.wipeData()
    for k1, v1 in pairs(randomNPCsTable) do
        local npcSurvivor = v1;
        local npcSurvivorID = k1;
        PZNS_UtilsNPCs.PZNS_ClearQueuedNPCActions(npcSurvivor);
        PZNS_RandomNPCsData.removeNPCFromTableAndWorld(npcSurvivorID);
    end
    randomNPCsTable = {};
    ModData.remove("PZNS_RandomNPCsDataTable");
    return randomNPCsTable;
end

return PZNS_RandomNPCsData;
