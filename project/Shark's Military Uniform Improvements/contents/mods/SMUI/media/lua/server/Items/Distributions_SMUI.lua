require 'Items/ProceduralDistributions'

SMUI = SMUI or {};

SMUI.tab_addHatsProcedural_items  = function(x,count)
  ProceduralDistributions = ProceduralDistributions or {};
  ProceduralDistributions.list = ProceduralDistributions.list or {};
  ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
  ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Hat_Army");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Hat_BeretSpecial");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Hat_CavalryHat");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Hat_PatrolCap");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Hat_PatrolCapDesert");
  table.insert(ProceduralDistributions.list[x].items, count);
end

SMUI.tab_addClothesProcedural_items  = function(x,count)
  ProceduralDistributions = ProceduralDistributions or {};
  ProceduralDistributions.list = ProceduralDistributions.list or {};
  ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
  ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Jacket_ArmyCamoDesert");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Jacket_ArmyCamoGreen");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Jacket_ArmyCamoUrban");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Trousers_CamoDesert");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Trousers_CamoGreen");
  table.insert(ProceduralDistributions.list[x].items, count);
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Trousers_CamoUrban");
  table.insert(ProceduralDistributions.list[x].items, count);  
end
SMUI.tab_addShoesProcedural_items  = function(x,count)
  ProceduralDistributions = ProceduralDistributions or {};
  ProceduralDistributions.list = ProceduralDistributions.list or {};
  ProceduralDistributions.list[x] = ProceduralDistributions.list[x] or {};
  ProceduralDistributions.list[x].items = ProceduralDistributions.list[x].items or {};
  table.insert(ProceduralDistributions.list[x].items,"SMUIClothing.Shoes_HazmatBoots");
  table.insert(ProceduralDistributions.list[x].items, count);  
end

SMUI.tab_addHatsProcedural_items("LockerArmyBedroom",0.8);
SMUI.tab_addClothesProcedural_items("LockerArmyBedroom",0.8);
SMUI.tab_addClothesProcedural_items("CampingStoreClothes",0.8);
SMUI.tab_addClothesProcedural_items("CrateCamping",0.8);
SMUI.tab_addShoesProcedural_items("CampingStoreLegwear",1.0);
SMUI.tab_addShoesProcedural_items("CrateCamping",1.0);


