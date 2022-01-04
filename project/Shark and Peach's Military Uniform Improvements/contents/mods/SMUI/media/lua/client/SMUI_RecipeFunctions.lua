SMUI_Recipe = {}

function SMUI_Recipe.CanOpenBoxes(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("CanOpenBoxes"))
end

function SMUI_Recipe.PACKAGETOP(recipe, result, player)
	player:getInventory():AddItems("SMUIClothing.Suit_NBCSuit", 1)
	player:getInventory():AddItems("SMUIClothing.Gloves_HazmatGloves", 1)
end

function SMUI_Recipe.PACKAGEBOTTOM(recipe, result, player)
	player:getInventory():AddItems("SMUIClothing.Trousers_NBCPants", 1)
	player:getInventory():AddItems("SMUIClothing.Shoes_HazmatBoots", 1)
end


SMUI_Recipe.typesThatCanOpenBoxes = SMUI_Recipe.typesThatCanOpenBoxes or {}

---@param list table of type paths
function SMUI_Recipe.addCanOpenBoxTypes(list)
	for _,type in pairs(list) do
		table.insert(SMUI_Recipe.typesThatCanOpenBoxes, type)
	end
end

---Sub-mod authors will have to use the following function to add more types
SMUI_Recipe.addCanOpenBoxTypes(
		{"Base.Fork","Base.ButterKnife","Base.HuntingKnife","Base.KitchenKnife","Base.Scissors",
		 "Base.RedPen","Base.BluePen","Base.Pen","Base.Pencil","Base.Screwdriver","Base.GardenFork",
		 "Base.Scalpel","Base.LetterOpener","Base.IcePick","Base.BreadKnife","Base.MeatCleaver","Base.FlintKnife",
		 "Base.Machete","Base.Katana","Base.HandAxe","Base.Axe","Base.WoodAxe","Base.HandScythe",})


---Adds "CanOpenBoxes" tag to scripts for type
---@param type string
function SMUI_Recipe.addCanOpenBoxesTag(type)
	local item = ScriptManager.instance:getItem(type);
	if item then
		local tags = item:getTags()
		local tagString = "CanOpenBoxes"

		for i=0, tags:size()-1 do
			---@type string
			local tag = tags:get(i)
			tagString = tagString..";"..tag
		end

		item:DoParam("Tags = "..tagString);
		print("--AddTag:"..type..": "..tagString);
	end
end

---For each type in SMUI_Recipe.addCanOpenBoxTypes process SMUI_Recipe.addCanOpenBoxesTag(type)
function SMUI_Recipe.addCanOpenBoxesTagToTypesThatCan()
	for _,type in pairs(SMUI_Recipe.typesThatCanOpenBoxes) do
		SMUI_Recipe.addCanOpenBoxesTag(type)
	end
end

Events.OnGameBoot.Add(SMUI_Recipe.addCanOpenBoxesTagToTypesThatCan)
