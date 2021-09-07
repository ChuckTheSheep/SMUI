-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

SMUI_AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

SMUI_AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- For Specific Outfits --

-- assault rifle on back
SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack = {
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

SMUI_AttachedWeaponDefinitions.handgunM9 = {
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

SMUI_AttachedWeaponDefinitions.FragGrenade = {
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
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit = {}; 

SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMale = {
	chance = 100;
	maxitem = 3;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertFemale = {
	chance = 50;
	maxitem = 3;	
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertMale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
} 
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanMale = {
	chance = 50;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanFemale = {
	chance = 50;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanGearedMale = {
	chance = 50;
	maxitem = 3;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMaleGasMask = {
	chance = 50;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemaleGasMask = {
	chance = 50;
	maxitem = 2;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkNBCSuit = {
	chance = 33;
	maxitem = 3;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.FragGrenade,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyInstructor = {
	chance = 50;
	maxitem = 2;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
	},
}
SMUI_AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCavalry = {
	chance = 50;
	weapons = {
		SMUI_AttachedWeaponDefinitions.handgunM9,
		SMUI_AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
