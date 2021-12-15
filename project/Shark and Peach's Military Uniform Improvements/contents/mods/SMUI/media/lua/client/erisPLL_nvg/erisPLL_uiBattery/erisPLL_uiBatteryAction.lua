----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- erisPLL_uiBatteryAction
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.4;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if erisPLL_uiBatteryAction then
	if erisPLL_uiBatteryAction.versionNumber >= versionNumber then
		return;
	end;
end;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

erisPLL_uiBatteryAction = ISBaseTimedAction:derive("erisPLL_uiBatteryAction");

erisPLL_uiBatteryAction.versionNumber = versionNumber;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------isValid

function erisPLL_uiBatteryAction:isValid()
	if self.doAction and self.manager then
		return self["isValid"..self.doAction](self);
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------perform

function erisPLL_uiBatteryAction:perform()
	if self.doAction and self.manager then
		self["perform"..self.doAction](self);
	end
	ISBaseTimedAction.perform(self)
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Activate

function erisPLL_uiBatteryAction:isValidActivate()
	if self.doAction and self.manager then
		return (not self.manager:updateActiveState()) and (self.manager:hasBattery() and self.manager:hasPower() or self.manager:hasAlternatePower()) or false;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Activate

function erisPLL_uiBatteryAction:performActivate()
	if self:isValidActivate() then
		self.manager:activate();
	end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------AddBattery

function erisPLL_uiBatteryAction:isValidAddBattery()
	if self.doAction and self.manager and self.itemObj then
		return (not self.manager:hasBattery());
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------AddBattery

function erisPLL_uiBatteryAction:performAddBattery()
	if self:isValidAddBattery() and self.itemObj then
		self.manager:addBattery(self.itemObj);
	end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Deactivate

function erisPLL_uiBatteryAction:isValidDeactivate()
	if self.doAction and self.manager then
		return self.manager:updateActiveState() or false;
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Deactivate

function erisPLL_uiBatteryAction:performDeactivate()
	if self:isValidDeactivate() then
		self.manager:deactivate();
	end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------RemoveBattery

function erisPLL_uiBatteryAction:isValidRemoveBattery()
	if self.doAction and self.manager then
		return self.manager:hasBattery();
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------RemoveBattery

function erisPLL_uiBatteryAction:performRemoveBattery()
	if self:isValidRemoveBattery() then
		self.manager:removeBattery();
	end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------SetPowerLevel

function erisPLL_uiBatteryAction:isValidSetPowerLevel()
	return self.manager and true or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------SetPowerLevel

function erisPLL_uiBatteryAction:performSetPowerLevel()
	if self.manager and self.arg1 then
		self.manager:setPowerLevel(self.arg1);
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------update

function erisPLL_uiBatteryAction:update()

end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------new

function erisPLL_uiBatteryAction:new(_plObj, _manager, _doAction, _itemObj, _itemObj2, _itemObj3, _itemObj4, _arg1, _arg2, _arg3, _arg4)
	local o = {};

	setmetatable(o, self);

	self.__index = self;

	o.character = _plObj;

	o.manager = _manager;

	o.doAction = _doAction;

	o.itemObj = _itemObj;
	o.itemObj2 = _itemObj2;
	o.itemObj3 = _itemObj3;
	o.itemObj4 = _itemObj4;

	o.arg1 = _arg1;
	o.arg2 = _arg2;
	o.arg3 = _arg3;
	o.arg4 = _arg4;

	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = 30;

	return o;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------