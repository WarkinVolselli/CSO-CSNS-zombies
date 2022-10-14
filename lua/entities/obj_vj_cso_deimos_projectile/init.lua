AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_junk/PopCan01a.mdl"} 
ENT.DoesDirectDamage = true
ENT.DirectDamage = 30 
ENT.DirectDamageType = DMG_SLASH 
ENT.SoundTbl_OnCollide = {"vj_cso/deimos/deimos_skill_hit.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:EnableGravity(false)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
ParticleEffect("striderbuster_explode_flash",self:LocalToWorld(Vector(math.random(1,1),math.random(1,1))),Angle(0,0,0),nil)
	util.SpriteTrail(self,10,Color(255,200,0),true,100,0.6,0.6,12/(20+20)*30,"VJ_Base/sprites/vj_trial1.vmt")
	util.SpriteTrail(self,10,Color(255,0,0),true,100,1.2,1.2,24/(40+40)*60,"VJ_Base/sprites/vj_trial1.vmt")
	self:SetNoDraw(true)
	self.StartGlow1 = ents.Create("env_sprite")
	self.StartGlow1:SetKeyValue("model","sprites/orangecore2.vmt")
	self.StartGlow1:SetKeyValue("GlowProxySize","2.0")
	self.StartGlow1:SetKeyValue("HDRColorScale","1.0")
	self.StartGlow1:SetKeyValue("renderfx","14")
	self.StartGlow1:SetKeyValue("rendermode","3")
	self.StartGlow1:SetKeyValue("renderamt","255")
	self.StartGlow1:SetKeyValue("disablereceiveshadows","0")
	self.StartGlow1:SetKeyValue("mindxlevel","0")
	self.StartGlow1:SetKeyValue("maxdxlevel","0")
	self.StartGlow1:SetKeyValue("framerate","10.0")
	self.StartGlow1:SetKeyValue("spawnflags","0")
	self.StartGlow1:SetKeyValue("scale","0.25")
	self.StartGlow1:SetPos(self:GetPos())
	self.StartGlow1:Spawn()
	self.StartGlow1:SetParent(self)
	self:DeleteOnRemove(self.StartGlow1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
ParticleEffect("striderbuster_break_b",self:LocalToWorld(Vector(math.random(1,1),math.random(1,1))),Angle(0,0,0),nil)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/