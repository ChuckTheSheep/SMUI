SMUIZombiesZoneDefinition = ZombiesZoneDefinition or {};


SMUIZombiesZoneDefinition.Army = {

	ArmyInstructorM = {
		name="ArmyInstructor",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	SharkArmyInstructorM = {
		name="SharkArmyInstructor",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	GhillieM = {
		name="Ghillie",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},		
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=15,
		gender="male",
	},
	SharkArmyInstructor = {
		name="SharkArmyInstructor",
		chance=15,
		gender="male",
	},	
	ArmyCamoDesert = {
		name="ArmyCamoDesert",
		chance=5,
	},
	SharkArmyCamoDesertMale = {
		name="SharkArmyCamoDesertMale",
		chance=3,
		gender="male",
	},
	SharkArmyCamoDesertFemale = {
		name="SharkArmyCamoDesertFemale",
		chance=3,
		gender="male",
	},	
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=30,
	},
	SharkArmyCamoGreenMale = {
		name="SharkArmyCamoGreenMale",
		chance=22,
	},
	SharkArmyCamoGreenFemale = {
		name="SharkArmyCamoGreenFemale",
		chance=22,
	},
	SharkArmyCamoGreenNVGMale = {
		name="SharkArmyCamoGreenNVGMale",
		chance=10,
	},
	SharkArmyCamoGreenNVGFemale = {
		name="SharkArmyCamoGreenNVGFemale",
		chance=10,
	},
	SharkArmyCamoUrbanGearedMale = {
		name="SharkArmyCamoUrbanGearedMale",
		chance=3,
	},
	SharkArmyCamoUrbanMale = {
		name="SharkArmyCamoUrbanMale",
		chance=10,
	},
	SharkArmyCamoUrbanFemale = {
		name="SharkArmyCamoUrbanFemale",
		chance=10,
	},
	
}

SMUIZombiesZoneDefinition.SecretBase = {
	ArmyGeneral = {
		name="ArmyGeneral",
		chance=1,
		gender="male",
	},
	Priest = {
		name="Priest",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=5,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=20,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=10,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=10,
		gender="male",
		beardStyles="null:80",
	},
	SharkArmyCamoUrbanGearedMale = {
		name="SharkArmyCamoUrbanGearedMale",
		chance=15,
	},
	SharkArmyCamoUrbanMale = {
		name="SharkArmyCamoUrbanMale",
		chance=10,
	},
	SharkArmyCamoUrbanFemale = {
		name="SharkArmyCamoUrbanFemale",
		chance=10,
	},
	Doctor = {
		name="Doctor",
		chance=10,
	},
}

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SMUIZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};

table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenMale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenNVGMale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenMaleGasmask", chance=0.1});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenFemale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenNVGFemale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenFemaleGasmask", chance=0.1});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenReservist", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyInstructor", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoUrbanGearedMale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoUrbanMale", chance=0.01});