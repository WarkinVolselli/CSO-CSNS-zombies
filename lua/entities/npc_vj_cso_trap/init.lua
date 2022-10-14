AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/misc/zombitrap.mdl"}
ENT.StartHealth = 1000

ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.SoundTbl_MeleeAttack = {"vj_cso/zombi_trapped.wav"}

ENT.MeleeAttackAnimationFaceEnemy  = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 0
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 0
ENT.SlowPlayerOnMeleeAttackTime = 3
ENT.MeleeAttackDistance = 10
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 20
ENT.MeleeAttackDamageAngleRadius = 180
ENT.TimeUntilMeleeAttackDamage = 0.4

ENT.FindEnemy_UseSphere = true
ENT.FindEnemy_CanSeeThroughWalls = true

ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_WALK}
ENT.MovementType = VJ_MOVETYPE_AERIAL 

ENT.Aerial_FlyingSpeed_Calm = 1000
ENT.Aerial_FlyingSpeed_Alerted = 1000
ENT.AA_GroundLimit = 10
ENT.AA_MoveAccelerate = 0
ENT.AA_MoveDecelerate = 3
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
util.SpriteTrail(self,10,Color(100,0,0),true,10,1,1,12/(10+10)*10,"sprites/smoke.vmt")

	self.StartGlow1 = ents.Create("env_sprite")
	self.StartGlow1:SetKeyValue("model","sprites/redglow3.vmt")
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

self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
self:DrawShadow(false)
self.VJ_NoTarget = true
self:SetNoDraw(true)
  timer.Simple(10,function() if IsValid(self) then
		   self:Fire("Kill","",0.07)
  end 
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
self:SetNoDraw(false)
self.MovementType = VJ_MOVETYPE_GROUND  

timer.Simple(3,function() if IsValid(self) then
     self:Fire("Kill","",0.07)
  end
end)

end