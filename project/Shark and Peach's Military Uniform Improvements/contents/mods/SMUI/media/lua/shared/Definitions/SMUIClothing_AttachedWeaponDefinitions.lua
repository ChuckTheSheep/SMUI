require "Definitions/AttachedWeaponDefinitions"
-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...

-- assault rifle on back
AttachedWeaponDefinitions.assaultRifleM16OnBack = {
	id = "assaultRifleM16OnBack",
	chance = 20,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkNBCSuit",	
"SharkArmyInstructor","SharkArmyCavalry"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.AssaultRifle",
	},
}

AttachedWeaponDefinitions.handgunM9 = {
	id = "handgunM9",
	chance = 30,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkNBCSuit",	
"SharkArmyInstructor","SharkArmyCavalry"},
	weaponLocation = {"Holster Left", "Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
    "Base.Pistol",
	},
}	

AttachedWeaponDefinitions.FragGrenade = {
	id = "FragGrenade",
	chance = 100,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkNBCSuit"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
    "SMUIClothing.M67Grenade",
	},
}	


-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMale = {
	chance = 100;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemale = {
	chance = 30;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertFemale = {
	chance = 30;
	maxitem = 3;	
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertMale = {
	chance = 30;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
} 
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanMale = {
	chance = 30;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanFemale = {
	chance = 30;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanGearedMale = {
	chance = 30;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMaleGasMask = {
	chance = 30;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemaleGasMask = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkNBCSuit = {
	chance = 33;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyInstructor = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCavalry = {
	chance = 30;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
