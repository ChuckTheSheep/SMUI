require "Definitions/AttachedWeaponDefinitions"
-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...

-- assault rifle on back
AttachedWeaponDefinitions.assaultRifleM16OnBack = {
	id = "assaultRifleM16OnBack",
	chance = 30,
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
	chance = 50,
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
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertFemale = {
	chance = 50;
	maxitem = 3;	
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertMale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
} 
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanMale = {
	chance = 50;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanFemale = {
	chance = 50;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanGearedMale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMaleGasMask = {
	chance = 50;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemaleGasMask = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkNBCSuit = {
	chance = 33;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.FragGrenade,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyInstructor = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCavalry = {
	chance = 50;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
