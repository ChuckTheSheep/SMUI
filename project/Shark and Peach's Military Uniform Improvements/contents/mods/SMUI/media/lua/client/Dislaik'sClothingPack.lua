local Functions = require "Dislaik'sClothingPack/Functions"

ISInventoryMenuElements = ISInventoryMenuElements or {};

ISInventoryMenuElements.DislaiksClothingPackContext = function()
    local self = ISMenuElement.new()
    self.inventoryMenu = ISContextManager.getInstance().getInventoryMenu()

    self.createMenu = function(item)
        local source = getPlayer()

        if instanceof(item, "InventoryContainer") and item:canBeEquipped() == "UpperLegs" and not source:isEquippedClothing(item) then
            self.inventoryMenu.context:addOption(getText("ContextMenu_Equip"), item, self.equipContainer, source);
        end
    end

    self.equipContainer = function(item, source)
        ISTimedActionQueue.add(ISWearClothing:new(source, item, 50))
    end

    return self
end

local onClothingUpdated = function(source)


    Functions.replaceVisualClothing(source, "SMUIClothing.JungleCombatBoots", "Dislaik.LowerArms_ElbowPadsALTER",
    { "SweaterHat", "Sweater", "Jacket", "BathRobe", "Dress", "FullSuitHead", "FullSuit" },
    {   
        "Base.Jacket_CoatArmy", "Base.JacketLong_Doctor", "Base.Jacket_NavyBlue", "Base.Jacket_WhiteTINT",
        "Base.Jacket_Padded", "Base.Jacket_PaddedDOWN", "Base.JacketLong_Santa", "Base.Jacket_Police",
        "Base.WeddingJacket", "Base.Jacket_Fireman", "Base.Jacket_Shellsuit_Black", "Base.Jacket_Shellsuit_Blue",
        "Base.Jacket_Shellsuit_Green", "Base.Jacket_Shellsuit_Pink", "Base.Jacket_Shellsuit_Teal",
        "Base.Jacket_Shellsuit_TINT", "Base.Jacket_Chef", "Base.JacketLong_Random", "Base.Jacket_Ranger",
        "Base.Jacket_ArmyCamoDesert", "Base.Jacket_ArmyCamoGreen", "Base.Jacket_Varsity", "Base.JacketLong_SantaGreen",
        "Base.Ghillie_Top", "Base.Suit_Jacket", "Base.Suit_JacketTINT",  "Base.HoodieUP_WhiteTINT",
        "Base.Jumper_DiamondPatternTINT", "Base.Jumper_PoloNeck", "Base.Jumper_VNeck", "Base.Jumper_RoundNeck",
        "Base.HoodieDOWN_WhiteTINT", "Base.LongCoat_Bathrobe", "Base.HospitalGown", "Base.HazmatSuit",
        "Base.SpiffoSuit", "Base.Boilersuit", "Base.Boilersuit_BlueRed", "Base.Boilersuit_Yellow",
        "Base.Boilersuit_Flying", "Base.Boilersuit_Prisoner", "Base.Boilersuit_PrisonerKhaki", "Dislaik.Jacket_SWAT"
    })

    Functions.replaceVisualClothing(source, "Dislaik.Trousers_SWAT", "Dislaik.Trousers_SWATALTER",
    { "Shoes" },
    {   
        "Base.Shoes_BlackBoots", "Base.Shoes_Wellies", "Base.Shoes_RidingBoots", "Base.Shoes_ArmyBoots",
        "Base.Shoes_ArmyBootsDesert"
    })
end

Events.OnClothingUpdated.Add(onClothingUpdated)

-- NOTE: This is originally Dislaik's code thats been edited for SMUI but is originally from his clothing pack and used with permission. 
-- Check out his mod here: https://steamcommunity.com/sharedfiles/filedetails/?id=2688737276