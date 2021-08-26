--Adds new Zones to the world    OnNewGame
local function OnGameStart()
	if getPlayer():getModData().a == nil then	                     --
		getWorld():registerZone("DormitoryQuarantine", "ZombiesType", 10093, 12654, 0, 76, 56)--March Ridge Dormitory				
		getWorld():registerZone("ZoneBorder", "ZombiesType", 12504, 4502, 0, 53, 250)--Northern end of Map above Valley Station (W)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 14361, 4505, 0, 50, 50)--Northern end of Map above Valley Station (E)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 3014, 6140, 0, 46, 50)--West end of map w/ barricade (N)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 3015, 5787, 0, 50, 45)--West end of map w/ barricade (S)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 10583, 13442, 0, 50, 50)--Southern end of map w/ barricade						
	end
end
Events.OnGameStart.Add(OnGameStart)