----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- erisPLL_headwearOverride
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.5;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if erisPLL_headwearOverride then
	if erisPLL_headwearOverride.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride = {
	versionNumber = versionNumber,
	IWBUMS = string.match(getCore():getVersionNumber(), "IWBUMS"),
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride.doOverride = function()

	local ISWearClothing_callback = ISWearClothing.perform;
	local ISUnequipAction_callback = ISUnequipAction.perform;
	local ISInventoryTransferAction_callback = ISInventoryTransferAction.removeItemOnCharacter;

	ISWearClothing.perform = function(self)
		ISWearClothing_callback(self);
		if instanceof(self.item, "Clothing") then
			if self.item:getBodyLocation() == ClothingBodyLocation.Head then
				erisPLL_headwearOverride.equipHat(self.character, self.item);
			end;
		end;
	end;

	ISInventoryTransferAction.removeItemOnCharacter = function(self)
		ISInventoryTransferAction_callback(self);
		if self.character:getClothingItem_Head() == self.item then
			erisPLL_headwearOverride.removeHat(self.character, self.item);
		end;
	end;

	ISUnequipAction.perform = function(self)
		ISUnequipAction_callback(self);
		if self.item:getCategory() == "Clothing" then
			if self.item:getBodyLocation() == ClothingBodyLocation.Head then
				erisPLL_headwearOverride.removeHat(self.character, self.item);
			end;
		end;
	end;

end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride.doReEquipHats = function()
	local plObj, plInv;
	local clothingList, clothingItem;
	local playerList = IsoPlayer.getPlayers();
	if playerList then
		for i = 0, playerList:size() - 1 do
			plObj = playerList:get(i);
			if plObj then
				plInv = plObj:getInventory();
				if plInv then
					clothingList = plInv:getItemsFromCategory("Clothing");
					for j = 0, clothingList:size() - 1 do
						clothingItem = clothingList:get(j);
						if clothingItem then
							if clothingItem:getModData()["erisPLL_headwearOverride_isEquipped"] then
								erisPLL_headwearOverride.equipHat(plObj, clothingItem);
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride.equipHat = function(_plObj, _itemObj)
	_plObj:setClothingItem_Head(_itemObj);
	_plObj:initSpritePartsEmpty();
	_itemObj:getModData()["erisPLL_headwearOverride_isEquipped"] = true;
	triggerEvent("OnClothingUpdated", _plObj);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride.removeHat = function(_plObj, _itemObj)
	_plObj:setClothingItem_Head(nil);
	_plObj:initSpritePartsEmpty();
	_itemObj:getModData()["erisPLL_headwearOverride_isEquipped"] = false;
	triggerEvent("OnClothingUpdated", _plObj);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_headwearOverride.init = function()
	erisPLL_headwearOverride.doOverride();
	erisPLL_headwearOverride.doReEquipHats();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
if not erisPLL_headwearOverride.IWBUMS then
	Events.OnGameStart.Add(erisPLL_headwearOverride.init);
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------