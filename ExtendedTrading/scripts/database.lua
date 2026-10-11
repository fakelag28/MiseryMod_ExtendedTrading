local DB = {}

local CURRENCY = "Resource_Rubles"

local BUY_MULTIPLIER  = 1.35 -- продажа
local SELL_MULTIPLIER = 0.55 -- скупка

local Vendors = {
    BP_Barman_C_1 = {
        { id = "Food_BreadGood", base = 15 },
        { id = "Food_Bread", base = 10 },
        { id = "Food_TushenkaGood", base = 35 },
        { id = "Food_Tushenka", base = 25 },
        { id = "Food_TushenkaSmall", base = 18 },
        { id = "Food_MRE", base = 50 },
        { id = "Food_Sausage", base = 20 },
        { id = "Food_Cheese", base = 22 },
        { id = "Food_SgushenkaGood", base = 30 },
        { id = "Food_Sgushenka", base = 20 },
        { id = "Food_KabachkiGood", base = 20 },
        { id = "Food_Cucumber", base = 8 },
        { id = "Food_Tomato", base = 8 },
        { id = "Food_Carrot", base = 8 },
        { id = "Food_BankaCucumber", base = 25 },
        { id = "Food_BankaTomaatos", base = 25 },
        { id = "Food_SeedsCarrot", base = 3 },
        { id = "Food_SeedsCucumber", base = 3 },
        { id = "Food_SeedsTomato", base = 3 },
        { id = "Food_SeedsWheat", base = 3 },
        { id = "Drink_WaterBottle", base = 15 },
        { id = "Drink_Vodka", base = 35 },
        { id = "Drink_Beer", base = 25 },
        { id = "Drink_Energetic", base = 25 },
        { id = "Drink_Cola", base = 20 },
        { id = "Drink_Kvas", base = 18 },
        { id = "Drink_Champain", base = 40 },
        { id = "Consumable_Cigaret", base = 22 },
    },

    BP_GunDealerReal_C_1 = {
        { id = "Ammo_9mm", base = 80, amount = 10 },
        { id = "Ammo_Buckshot", base = 100, amount = 10 },
        { id = "Ammo_5.45", base = 180, amount = 30 },
        { id = "Ammo_7.62", base = 220, amount = 20 },
        { id = "Ammo_9.39", base = 250, amount = 20 },
        { id = "Magazine_PM", base = 40 },
        { id = "Magazine_TT33", base = 45 },
        { id = "Magazine_PPSH", base = 70 },
        { id = "Magazine_Kiparis", base = 80 },
        { id = "Magazine_AK74", base = 110 },
        { id = "Magazine_Saiga12", base = 130 },
        { id = "Magazine_Val", base = 140 },
        { id = "Magazine_SVD", base = 160 },
        { id = "Weapon_PM", base = 90 },
        { id = "Weapon_TT33", base = 110 },
        { id = "Weapon_PPSH", base = 160 },
        { id = "Weapon_Kiparis", base = 200 },
        { id = "Weapon_AK74", base = 350 },
        { id = "Weapon_Saiga12", base = 400 },
        { id = "Weapon_VAL", base = 500 },
        { id = "Weapon_SVD", base = 600 },
        { id = "Weapon_PKM", base = 900 },
        { id = "Weapon_RPG7", base = 1200 },
        { id = "Holdable_RGD5", base = 150 },
        { id = "Holdable_Detector", base = 180 },
    },

    BP_Hunter_C_1 = {
        { id = "Weapon_TOZ", base = 180 },
        { id = "Weapon_Obrez", base = 120 },
        { id = "Weapon_Mosin", base = 220 },
        { id = "Weapon_HunterKnife", base = 70 },
        { id = "Weapon_Knife", base = 50 },
        { id = "Weapon_CombatKnife", base = 85 },
        { id = "Holdable_SplittingAxe", base = 80 },
        { id = "Food_DeerMeatRaw", base = 25 },
        { id = "Food_DeerMeatCooked", base = 45 },
        { id = "Food_SwamperMeatRaw", base = 30 },
        { id = "Food_SwamperMeatCooked", base = 60 },
        { id = "Food_CoackroachRaw", base = 10 },
        { id = "Food_CoackroachCooked", base = 25 },
        { id = "Food_Caviar", base = 90 },
        { id = "Food_Caviar_Crab", base = 140 },
        { id = "Food_DriedFish", base = 35 },
        { id = "Resource_BoarHead", base = 50 },
        { id = "Resource_DeerHead", base = 60 },
        { id = "BuildPart_DeerSkin", base = 40 },
        { id = "Resource_DogHead", base = 45 },
        { id = "Resource_DogTail", base = 30 },
        { id = "Resource_RatwolfHead", base = 90 },
        { id = "Equipment_RatWolfHide", base = 80 },
        { id = "Resource_TwinsFeet", base = 65 },
        { id = "Resource_TwinsHead", base = 80 },
        { id = "Resource_GhoulParts", base = 150 },
        { id = "Resource_ChuvirlaFist", base = 200 },
        { id = "Resource_ChuvirlaHead", base = 180 },
        { id = "Resource_CrabEye", base = 70 },
        { id = "Resource_CrabLeg", base = 60 },
        { id = "Resource_CrayFishTail", base = 90 },
        { id = "Resource_ScreamerHead", base = 80 },
        { id = "Resource_ScreamerLungs", base = 75 },
        { id = "Resource_WendigoHead", base = 250 },
        { id = "Resource_WendigoHorns", base = 300 },
        { id = "Resource_SwamperMoss", base = 40 },
    },

    BP_Medic_C_2 = {
        { id = "Consumable_Bandage", base = 20 },
        { id = "Consumable_Vitamins", base = 25 },
        { id = "Consumable_Medkit", base = 50 },
        { id = "Consumable_CarMedkit", base = 65 },
        { id = "Consumable_MilitaryMedkit", base = 100 },
        { id = "Consumable_UN_LightMedkit", base = 70 },
        { id = "Consumable_UN_MilitaryMedkit", base = 120 },
        { id = "Consumable_AntiRadPils", base = 45 },
        { id = "Consumable_AntiRad", base = 75 },
        { id = "Consumable_AntiDipressPils", base = 85 },
        { id = "Consumable_BloodPackEmpty", base = 25 },
        { id = "Consumable_BloodPackFull", base = 80 },
        { id = "Consumable_UN_Adrenaline", base = 140 },
        { id = "Artifact_Calculator", base = 120 },
        { id = "Artifact_Soap", base = 100 },
        { id = "Artifact_Iron", base = 110 },
        { id = "Artifact_Star", base = 130 },
        { id = "Artifact_GP5Filter", base = 140 },
        { id = "Artifact_Yola", base = 160 },
        { id = "Artifact_Dosimeter", base = 190 },
        { id = "Artifact_ToyTruck", base = 200 },
        { id = "Artifact_Clocks", base = 220 },
        { id = "Artifact_Rubiks", base = 240 },
        { id = "Artifact_Nevolyashka", base = 280 },
        { id = "Artifact_Shkatulka", base = 350 },
    },

    BP_ResourseSaler_C_3 = {
        { id = "Resource_Scrap", base = 5 },
        { id = "Resource_Wood", base = 5 },
        { id = "Resource_Glass", base = 6 },
        { id = "Resource_Plastic", base = 6 },
        { id = "Resource_Iron", base = 12 },
        { id = "Resource_Cement", base = 15 },
        { id = "Resource_Coalbag", base = 40 },
        { id = "Resource_Gasoline", base = 90 },
        { id = "Resource_BegginerToolbox", base = 45 },
        { id = "Holdable_Shovel", base = 30 },
        { id = "Holdable_Wrench", base = 25 },
        { id = "Weapon_Crowbar", base = 35 },
        { id = "Holdable_SledgeHammer", base = 60 },
        { id = "Weapon_Handsaw", base = 30 },
        { id = "Holdable_Scythe", base = 40 },
        { id = "Holdable_Pitchfork", base = 35 },
        { id = "Holdable_Hoe", base = 25 },
        { id = "Holdable_Rake", base = 20 },
        { id = "BuildPart_SmallStorageBox", base = 40 },
        { id = "BuildPart_StorageBox", base = 80 },
        { id = "BuildPart_WoodenBox", base = 30 },
    },

    BP_Technician2_C_1 = {
        { id = "Resource_Wires", base = 15 },
        { id = "Resource_Electronics", base = 25 },
        { id = "Resource_LeghtBulb", base = 18 },
        { id = "Resource_Radio", base = 50 },
        { id = "Resource_Drill", base = 45 },
        { id = "Resource_Ducktape", base = 20 },
        { id = "Resource_RegularToolbox", base = 80 },
        { id = "Resource_AdvancedToolbox", base = 140 },
        { id = "Resource_GunCleaningKit", base = 60 },
        { id = "Resource_LocksmithKit", base = 75 },
        { id = "Resource_GunPowder", base = 30 },
        { id = "Resource_ArmorPlate", base = 35 },
        { id = "Resource_GunPartsPistols", base = 12 },
        { id = "Resource_GunPartsShotguns", base = 16 },
        { id = "Resource_GunPartsRifle", base = 22 },
        { id = "Resource_GunPartsAssultRifle", base = 28 },
        { id = "Resource_Weapon_PM", base = 40 },
        { id = "Resource_Weapon_TT33", base = 50 },
        { id = "Resource_Weapon_Obrez", base = 55 },
        { id = "Resource_Weapon_Mosin", base = 60 },
        { id = "Resource_Weapon_PPSH", base = 75 },
        { id = "Resource_Weapon_TOZ", base = 80 },
        { id = "Resource_Weapon_Kiparis", base = 85 },
        { id = "Resource_Weapon_AK74", base = 120 },
        { id = "Resource_Weapon_AK74SU", base = 110 },
        { id = "Resource_Weapon_Saiga12", base = 140 },
        { id = "Resource_Weapon_VAL", base = 170 },
        { id = "Resource_Weapon_SVD", base = 200 },
    },

    BP_Vasya_C_5 = {
        { id = "Equipment_SchoolBackpack", base = 80 },
        { id = "Equipment_SovietBackpack", base = 130 },
        { id = "Equipment_HunterBackpack", base = 200 },
        { id = "Equipment_TacticalBackpack", base = 250 },
        { id = "Equipment_HikingBackpack", base = 320 },
        { id = "Equipment_LargeBackpack", base = 380 },
        { id = "Equipment_UNTacticalBackpack", base = 420 },
        { id = "Equipment_GasmaskRespirator", base = 70 },
        { id = "Equipment_Gasmask", base = 150 },
        { id = "Equipment_HamsterGasmask", base = 180 },
        { id = "Equipment_GasmaskPKM2", base = 240 },
        { id = "Equipment_MilitaryGasmask", base = 260 },
        { id = "Equipment_GasmaskM50", base = 290 },
        { id = "Equipment_Hazmatsuit", base = 350 },
        { id = "Equipment_SovietHazmatsuit", base = 380 },
        { id = "Equipment_UnitedNorthHazmatsuit", base = 450 },
        { id = "Equipment_WorkerSuit", base = 50 },
        { id = "Equipment_BanditSuit", base = 65 },
        { id = "Equipment_HunterSuit", base = 110 },
        { id = "Equipment_HunterVest", base = 60 },
        { id = "Equipment_FieldJacket", base = 70 },
        { id = "Equipment_FurCoat", base = 60 },
        { id = "Equipment_SportUniform", base = 45 },
        { id = "Equipment_MilitaryUniform", base = 160 },
        { id = "Equipment_MilitaryJacket", base = 140 },
        { id = "Equipment_SpetsnazUnifrom", base = 220 },
        { id = "Equipment_WinterUniform", base = 150 },
        { id = "Equipment_MiliaryVest", base = 120 },
        { id = "Equipment_MilitaryAssaultVest", base = 180 },
        { id = "Equipment_SpetstazVest", base = 200 },
        { id = "Equipment_UnitedNorthVest", base = 230 },
        { id = "Equipment_SovietTacticalRig", base = 100 },
        { id = "Equipment_TacticalRig", base = 140 },
        { id = "Equipment_TacticalHelmet", base = 150 },
        { id = "Equipment_SovietHelmet", base = 110 },
        { id = "Equipment_AssaultHelmet", base = 240 },
        { id = "Equipment_Ushanka", base = 30 },
        { id = "Equipment_Petushok", base = 25 },
        { id = "Resource_SewingKit", base = 35 },
        { id = "Resource_SewingKit_Military", base = 60 },
        { id = "Resource_SewingKit_UN", base = 80 },
        { id = "Resource_SewingKit_threads", base = 15 },
        { id = "Resource_ItemTrash_01", base = 40 },
        { id = "Resource_ItemTrash_02", base = 30 },
        { id = "Resource_ItemTrash_03", base = 25 },
        { id = "Resource_ItemTrash_04", base = 20 },
        { id = "Resource_ItemTrash_05", base = 25 },
        { id = "Resource_ItemTrash_06", base = 35 },
        { id = "Resource_ItemTrash_07", base = 70 },
        { id = "Resource_ItemTrash_08", base = 30 },
        { id = "Resource_ItemTrash_09", base = 45 },
        { id = "Resource_Musor", base = 5 },
        { id = "Resource_OldPhoto", base = 50 },
    }
}

function DB.GetVendorProfile(vendorName)
    local items = Vendors[vendorName]
    if not items then return nil end

    local buyList = {}
    local sellList = {}

    for _, entry in ipairs(items) do
        local count = entry.amount or 1
        
        local buyPrice = math.max(1, math.floor(entry.base * BUY_MULTIPLIER))
        local sellPrice = math.max(1, math.floor(entry.base * SELL_MULTIPLIER))

        table.insert(buyList, {
            itemName = entry.id,
            amount = count,
            price = {
                { itemName = CURRENCY, amount = buyPrice }
            }
        })

        table.insert(sellList, {
            itemName = entry.id,
            amount = count,
            price = {
                { itemName = CURRENCY, amount = sellPrice }
            }
        })
    end

    return {
        BuyList = buyList,
        SellList = sellList
    }
end

function DB.GetAllVendorNames()
    local names = {}
    for name, _ in pairs(Vendors) do
        table.insert(names, name)
    end
    return names
end

return DB