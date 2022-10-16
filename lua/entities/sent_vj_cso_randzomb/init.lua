AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hunter/plates/plate.mdl"} -- The models it should spawn with | Picks a random one from the table
local ent_tbl = {
	"npc_vj_cso_regular",
	"npc_vj_cso_regular_origin:4",
	"npc_vj_cso_psycho:4",
	"npc_vj_cso_psycho_origin:8",
	"npc_vj_cso_light",
	"npc_vj_cso_light_origin:6",
	"npc_vj_cso_heavy:2",
	"npc_vj_cso_heavy_origin:6",
	"npc_vj_cso_boomer:5",
	"npc_vj_cso_boomer_origin:8",
	"npc_vj_cso_resident:4",
	"npc_vj_cso_resident_origin:7",
	"npc_vj_cso_healer:4",
	"npc_vj_cso_healer_origin:6",
	"npc_vj_cso_deimos:16",
	"npc_vj_cso_deimos_origin:32",
	"npc_vj_cso_undertaker:4",
	"npc_vj_cso_undertaker_origin:7",
	"npc_vj_cso_zombiedog:4"
}
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = ent_tbl},
}

ENT.SingleSpawner = true

function ENT:CustomOnInitialize() 
self:SetMaterial("nodraw")
end


/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/