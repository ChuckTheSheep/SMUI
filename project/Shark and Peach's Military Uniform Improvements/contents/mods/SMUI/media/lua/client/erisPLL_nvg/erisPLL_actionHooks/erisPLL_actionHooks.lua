----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--
-- erisPLL_actionHooks
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 2.0;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if erisPLL_actionHooks then
	if erisPLL_actionHooks.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------erisPLL_actionHooks

erisPLL_actionHooks = {
	versionNumber = versionNumber,
	hookActions = {},
	hookID = 0,
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------getNextID

erisPLL_actionHooks.getNextID = function(_actionName)
	erisPLL_actionHooks.hookID = erisPLL_actionHooks.hookID + 1;
	return _actionName.."-"..erisPLL_actionHooks.hookID;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------registerHook

erisPLL_actionHooks.registerHook = function(_actionName, _target, _targetFunction, _data1, _data2, _data3, _data4)
	if _actionName and _targetFunction then
		if not erisPLL_actionHooks.hookActions[_actionName] then erisPLL_actionHooks.hookActions[_actionName] = {}; end;
		local hookID = erisPLL_actionHooks.getNextID(_actionName);
		erisPLL_actionHooks.hookActions[_actionName][hookID] = {
			actionName = _actionName,
			data1 = _data1,
			data2 = _data2,
			data3 = _data3,
			data4 = _data4,
			target = _target,
			targetFunction = _targetFunction,
		};
		return hookID;
	end;
	return nil;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------addHook

erisPLL_actionHooks.addHook = erisPLL_actionHooks.registerHook;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------deregisterHook

erisPLL_actionHooks.deregisterHook = function(_actionName, _hookID)
	if erisPLL_actionHooks.hookActions[_actionName] and erisPLL_actionHooks.hookActions[_actionName][_hookID] then
		erisPLL_actionHooks.hookActions[_actionName][_hookID] = nil;
		return _hookID;
	end;
	return nil;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------removeHook

erisPLL_actionHooks.removeHook = erisPLL_actionHooks.deregisterHook;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------init

erisPLL_actionHooks.init = function()
	local callback_ISBaseTimedAction_perform = ISBaseTimedAction.perform;
	ISBaseTimedAction.perform = function(self)
		callback_ISBaseTimedAction_perform(self);
		if self.character and self.Type then
			local hookActions = erisPLL_actionHooks.hookActions[self.Type];
			if hookActions then
				for hookID, hookData in pairs(hookActions) do
					if hookData and hookData.targetFunction then
						hookData.targetFunction(hookData.target, self.Type, self[hookData.data1], self[hookData.data2], self[hookData.data3], self[hookData.data4]);
					end;
				end;
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Events

Events.OnGameStart.Add(erisPLL_actionHooks.init);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------