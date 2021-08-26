SMUIZombiesZoneDefinition = ZombiesZoneDefinition or {};


SMUIZombiesZoneDefinition.Army = {

	ArmyInstructorM = {
		name="ArmyInstructor",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=30,
		gender="male",
	},
	ArmyCamoDesert = {
		name="ArmyCamoDesert",
		chance=10,
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=90,
	},
}

SMUIZombiesZoneDefinition.SecretBase = {
	1SoldierMOPP = {
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
	Doctor = {
		name="Doctor",
		chance=10,
	},
}

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SMUIZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};

table.insert(SMUIZombiesZoneDefinition.Default,{name = "ArmyCamoGreen", chance=0.10});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "1SoldierMOPP", chance=0.10});