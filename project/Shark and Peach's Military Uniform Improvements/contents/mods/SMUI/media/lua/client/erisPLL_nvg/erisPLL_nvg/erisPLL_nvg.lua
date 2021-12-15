----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- erisPLL_nvg - night vision goggles
--
-- item artwork: Lith
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.5;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if erisPLL_nvg then
	if erisPLL_nvg.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local erisPLL_nvg = {
	versionNumber = versionNumber,
	batteryManagers = {},
	numActiveNVG = 0,
	activeNVG = {},
	playerScreenBounds = {},
	brightnessOverlay = getTexture("media/textures/overlayBrightness.png"),
	managedItems = {
		["SMUIClothing.Hat_MilitaryHelmetNVGDOWN"] = true,
	},
	IWBUMS = string.match(getCore():getVersionNumber(), "IWBUMS"),
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.doCheck = function(_plObj)
	for itemID, batteryManager in pairs(erisPLL_nvg.batteryManagers) do
		batteryManager:update();
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.doMenu = function(_plID, _context, _items)
	local itemObj, itemID;
	local plObj = getPlayer(_plID);
	for i, items in ipairs(_items) do
		if not instanceof(items, "InventoryItem") then itemObj = items.items[1]; else itemObj = items; end;
		if itemObj then
			if erisPLL_nvg.isInPlayerInventory(nil, plObj, itemObj) and erisPLL_nvg.managedItems[itemObj:getFullType()] then
				itemID = erisPLL_nvg.getItemID(itemObj);
				if not erisPLL_nvg.batteryManagers[itemID] then erisPLL_nvg.initialiseNVG(itemID, plObj, itemObj); end;
				if erisPLL_nvg.isWearing(nil, plObj, itemObj) then
					erisPLL_nvg.batteryManagers[itemID]:doActionMenu(_context);
				end;
				erisPLL_nvg.batteryManagers[itemID]:doPowerLevelMenu(_context);
				erisPLL_nvg.batteryManagers[itemID]:doBatteryMenu(_context);
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.isActive = function(_, _plObj, _itemObj)
	return _plObj:isWearingNightVisionGoggles() or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.isWearing = function(_, _plObj, _itemObj)
	return _plObj:getClothingItem_Head() == _itemObj or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.isWearing41 = function(_, _plObj, _itemObj)
	local wornItem;
	local wornItems = _plObj:getWornItems();
	for i = 0, wornItems:size() - 1 do
		wornItem = wornItems:get(i);
		if wornItem and wornItem:getItem() == _itemObj then
			return true;
		end;
	end;
	return false;
end

if erisPLL_nvg.IWBUMS then erisPLL_nvg.isWearing = erisPLL_nvg.isWearing41; end;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.isInPlayerInventory = function(_, _plObj, _itemObj)
	return _itemObj:getContainer() == _plObj:getInventory() or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.isValid = function(_, _plObj, _itemObj)
	if _plObj and _itemObj then
		return erisPLL_nvg.isWearing(_, _plObj, _itemObj) or false;
	else
		return nil;
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.onActivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(true);
	erisPLL_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = _manager;
	erisPLL_nvg.numActiveNVG = erisPLL_nvg.numActiveNVG + 1;
	erisPLL_nvg.updateScreenBounds();
	_plObj:getEmitter():playSound("nvgON", true);  
	Events.OnPreUIDraw.Add(erisPLL_nvg.doBrightnessOverlay);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.onBatteryDead = function(_, _plObj, _itemObj, _manager)
	erisPLL_nvg.onDeactivate(_, _plObj, _itemObj, _manager);
	-- erisPLL_nvg.batteryManagers[_itemObj:getType() .. _itemObj:getID()] = nil;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.onDeactivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(false);
	erisPLL_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = nil;
	erisPLL_nvg.numActiveNVG = erisPLL_nvg.numActiveNVG - 1; if erisPLL_nvg.numActiveNVG < 0 then erisPLL_nvg.numActiveNVG = 0; end;
	erisPLL_nvg.updateScreenBounds();
	_plObj:getEmitter():playSound("nvOFF", true); 
	Events.OnPreUIDraw.Remove(erisPLL_nvg.doBrightnessOverlay);
end


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.initialiseNVG = function(_itemID, _plObj, _itemObj)
	local nvgObj = {
		plObj = _plObj,
		itemObj = _itemObj,
		runtime = 4,
		target = nil,
		adjustablePower = true,
		itemWeightNoBattery = 0.7,
		itemWeightWithBattery = 1.2,
		isValid = erisPLL_nvg.isValid,
		isActive = erisPLL_nvg.isActive,
		onActivate = erisPLL_nvg.onActivate,
		onDeactivate = erisPLL_nvg.onDeactivate,
		onBatteryDead = erisPLL_nvg.onBatteryDead,
	};
	erisPLL_nvg.batteryManagers[_itemID] = erisPLL_uiBattery:new(nvgObj);
	erisPLL_nvg.batteryManagers[_itemID]:initialise();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.getItemID = function(_itemObj)
	return _itemObj:getType() .. _itemObj:getID();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.init = function()
	erisPLL_nvg.updateScreenBounds();
	Events.OnClothingUpdated.Add(erisPLL_nvg.doCheck);
	Events.OnFillInventoryObjectContextMenu.Add(erisPLL_nvg.doMenu);
	erisPLL_inventoryBar.registerItem("SMUIClothing.Hat_MilitaryHelmetNVGDOWN", "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ");
	erisPLL_inventoryTooltip.registerItem("SMUIClothing.Hat_MilitaryHelmetNVGDOWN", "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ");
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnGameStart.Add(erisPLL_nvg.init);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.doBrightnessOverlay = function()
	local nvgItem;
	local bounds, powerLevel;
	for plID, manager in pairs(erisPLL_nvg.activeNVG) do
		if manager then
			bounds = erisPLL_nvg.playerScreenBounds[plID];
			powerLevel = manager:getPowerLevel();
			if bounds and powerLevel then
				UIManager.DrawTexture(erisPLL_nvg.brightnessOverlay, bounds.x, bounds.y, bounds.w, bounds.h, 1 - powerLevel);
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_nvg.updateScreenBounds = function()
	local plID;
	local player, playerNum;
	local x, y, w, h;
	local playerList = IsoPlayer.getPlayers();
	if playerList then
		for i = 0, playerList:size() - 1 do
			player = playerList:get(i);
			if player then
				playerNum = player:getPlayerNum();
				plID = player:getDisplayName() .. playerNum;
				erisPLL_nvg.playerScreenBounds[plID] = {
					x = getPlayerScreenLeft(playerNum),
					y = getPlayerScreenTop(playerNum),
					w = getPlayerScreenWidth(playerNum),
					h = getPlayerScreenHeight(playerNum),
				};
				-- print("updating player " ..i)
				-- for k, v in pairs(erisPLL_nvg.playerScreenBounds[plID]) do
					-- print(k, v)
				-- end;
			end;
		end;
	end;
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnCreatePlayer.Add(erisPLL_nvg.updateScreenBounds);
Events.OnResolutionChange.Add(erisPLL_nvg.updateScreenBounds);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------