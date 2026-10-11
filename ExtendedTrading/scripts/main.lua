local ModName = "ExtendedTrading"
local ModVersion = "1.0"

package.path = package.path .. ";./ue4ss/Mods/" .. ModName .. "/scripts/?.lua"

local database = require("database")

local isInitialized = false

local function log(message)
    print("[" .. ModName .. "] " .. tostring(message) .. "\n")
end

local function safe_get(object, propertyName)
    local status, result = pcall(function() return object[propertyName] end)
    if status then return result end
    return nil
end

local function safe_call(object, methodName)
    local func = safe_get(object, methodName)
    if type(func) ~= "function" then return nil end
    local status, result = pcall(function() return func(object) end)
    if status then return result end
    return nil
end

local function find_vendor(vendorName)
    local vendors = FindAllOf("BP_VendorComponent_C")
    if not vendors then return nil end
    for _, vendor in ipairs(vendors) do
        local name = safe_call(vendor, "GetFullName")
        if name and name:find(vendorName) then
            return vendor
        end
    end
    return nil
end

local function serialize_vendor_list(data)
    local str = "("
    for listIndex, list in ipairs(data) do
        str = str .. "(Item_14_070A36824EDC84B7D36215B209442FF9=(Item_2_75DA1F3645FDA366094190A853658F2B=(RowName=\"" .. list.itemName .. "\"),Amount_5_9BB6E2444CD3AA340121BA986DA11205=" .. list.amount .. "),Price_13_FBBBC2BD486FD812AFE6BA947CE8EDD7=("
        for priceIndex, price in ipairs(list.price) do
            str = str .. "(Item_2_75DA1F3645FDA366094190A853658F2B=(DataTable=\"/Script/Engine.CompositeDataTable'/Game/SurvivalGameKitV2/Blueprints/Items/MasterLists/MasterItemList.MasterItemList'\",RowName=\"" .. price.itemName .. "\"),Amount_5_9BB6E2444CD3AA340121BA986DA11205=" .. price.amount
            if priceIndex ~= #list.price then
                str = str .. "),"
            else
                str = str .. ")"
            end
        end
        if listIndex ~= #data then
            str = str .. ")),"
        else
            str = str .. "))"
        end
    end
    str = str .. ")"
    return str
end

local function apply_economy()
    log("Injecting balanced mirrored economy...")

    local vendorNames = database.GetAllVendorNames()

    for _, npcVendorName in ipairs(vendorNames) do
        local vendor = find_vendor(npcVendorName)
        if not vendor then
            log("Vendor not found: " .. npcVendorName)
            return false
        end

        local vendorData = database.GetVendorProfile(npcVendorName)
        if not vendorData then
            log("No data for: " .. npcVendorName)
            return false
        end

        local refl = vendor:Reflection()

        local buyListData = serialize_vendor_list(vendorData.BuyList)
        local buyProp = refl:GetProperty("BuyList")
        local buyData = buyProp:ContainerPtrToValuePtr(vendor, 0)
        buyProp:ImportText(buyListData, buyData, 0, vendor)

        local sellListData = serialize_vendor_list(vendorData.SellList)
        local sellProp = refl:GetProperty("SellList")
        local sellData = sellProp:ContainerPtrToValuePtr(vendor, 0)
        sellProp:ImportText(sellListData, sellData, 0, vendor)

        log("Vendor updated: " .. npcVendorName)
    end

    return true
end

local function init_sequence()
    if isInitialized then return end

    local inventory = FindFirstOf("BP_PlayerInventory_C")
    if not inventory or not inventory:IsValid() then
        ExecuteWithDelay(1500, init_sequence)
        return
    end

    local barman = find_vendor("BP_Barman_C_1")
    if not barman then
        ExecuteWithDelay(1500, init_sequence)
        return
    end

    local success = apply_economy()
    if success then
        isInitialized = true
    else
        ExecuteWithDelay(1500, init_sequence)
    end
end

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(self, NewPawn)
    isInitialized = false
    ExecuteWithDelay(2000, init_sequence)
end)

log("Mod " .. ModName .. " v" .. ModVersion .. " loaded.")