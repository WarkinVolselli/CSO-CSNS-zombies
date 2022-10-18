AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/fallentitan.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_titan_hp")
ENT.HullType = HULL_LARGE 
ENT.VJ_IsHugeMonster = true

ENT.Bomb = false
ENT.NextBomb = 0 

ENT.MeleeAttackDamage = math.random(90,100)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackDistance = 120
ENT.MeleeAttackDamageDistance = 250
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Forward1 = 600
ENT.MeleeAttackKnockBack_Forward2 = 600
ENT.MeleeAttackKnockBack_Up1 = 400
ENT.MeleeAttackKnockBack_Up2 = 400 
ENT.MeleeAttackAngleRadius = 140

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = {""}
ENT.RangeAttackEntityToSpawn = "obj_vj_titan_rocket"
ENT.RangeAttackAnimationStopMovement = true
ENT.RangeDistance = 3000
ENT.RangeToMeleeDistance = 1000
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 10
ENT.NextRangeAttackTime_DoRand = 20
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "cannon"

ENT.SoundTbl_Breath = {"vj_cso/titan/idle.wav"}
ENT.SoundTbl_Alert = {"vj_cso/titan/appear1.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/titan/evolution.wav","vj_cso/titan/attack.wav"}
ENT.SoundTbl_Pain = {"vj_cso/titan/hurt1.wav","vj_cso/titan/hurt2.wav"}
ENT.SoundTbl_Death = {"vj_cso/zombie_spawn.wav"}

ENT.HasMeleeAttackMissSounds = false

ENT.BreathSoundLevel = 80
ENT.AlertSoundLevel = 90
ENT.BeforeMeleeAttackSoundLevel = 90
ENT.PainSoundLevel = 90
ENT.DeathSoundLevel = 100

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	    VJ_EmitSound(self, "vj_cso/titan/footstep"..math.random(1,2)..".wav", 80, 100)
		util.ScreenShake(self:GetPos(),32,900,1,800) 
	end
	if key == "death" then
	    VJ_EmitSound(self, "vj_cso/titan/zbs_cannon_start.wav", 90, 100)
		util.ScreenShake(self:GetPos(),32,1200,2,1100) 
	end
	if key == "deathscream" then
	    VJ_EmitSound(self, "vj_cso/titan/death1.wav", 90, 100)
	end
	if key == "slam" then
	    VJ_EmitSound(self, "vj_cso/titan/zbs_cannon_start.wav", 90, 100)
		  timer.Simple(0.1,function() if IsValid(self) then
    ParticleEffectAttach("door_pound_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("arm"))
		util.ScreenShake(self:GetPos(),32,900,1,800) 
		end
		end)
	end
	if key == "dash" then

	end
	if key == "melee" then
		self:MeleeAttackCode()	
	    VJ_EmitSound(self, "vj_cso/titan/zbs_attack1_"..math.random(1,2)..".wav", 80, 100)
		util.ScreenShake(self:GetPos(),32,900,1,800) 
    end		
	if key == "range" then
	    VJ_EmitSound(self, "vj_cso/titan/zbs_cannon1.wav", 90, 100)
    ParticleEffectAttach("fire_medium_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("cannon"))
	  timer.Simple(0.25,function() if IsValid(self) then
			    self:StopParticles()
  end 
	end)
		util.ScreenShake(self:GetPos(),32,1200,2,1100) 
		self:RangeAttackCode()		
    end	
	if key == "bomb" then
	    self.NextBomb = CurTime() + math.random(10,20)
		self.Bomb = false
	    VJ_EmitSound(self, "vj_cso/titan/zbs_landmine1.wav", 90, 100)
		util.ScreenShake(self:GetPos(),32,1200,2,1100) 
		local rangeprojectile = ents.Create("obj_vj_titan_mine")
		local rangeprojectile2 = ents.Create("obj_vj_titan_mine")
		local rangeprojectile3 = ents.Create("obj_vj_titan_mine")
		local rangeprojectile4 = ents.Create("obj_vj_titan_mine")
		local rangeprojectile5 = ents.Create("obj_vj_titan_mine")
		local rangeprojectile6 = ents.Create("obj_vj_titan_mine")
			rangeprojectile:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile:Spawn()
			rangeprojectile:SetOwner(self) 
		    rangeprojectile:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
			rangeprojectile2:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile2:Spawn()
			rangeprojectile2:SetOwner(self) 
		    rangeprojectile2:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
			rangeprojectile3:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile3:Spawn()
			rangeprojectile3:SetOwner(self) 
		    rangeprojectile3:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
			rangeprojectile4:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile4:Spawn()
			rangeprojectile4:SetOwner(self) 
		    rangeprojectile4:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
			rangeprojectile5:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile5:Spawn()
			rangeprojectile5:SetOwner(self) 
		    rangeprojectile5:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
			rangeprojectile:SetPos(self:GetPos() + self:GetUp()*160)
			rangeprojectile:Spawn()
			rangeprojectile:SetOwner(self) 
		    rangeprojectile:GetPhysicsObject():SetVelocity( Vector( math.random(-500,500), math.random(-500,500), math.random(-200,200)))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && self.Bomb == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextBomb then
		    self.Bomb = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetCollisionBounds(Vector(100, 50, 250), Vector(-100, -30, 0))
	self.NextBomb = CurTime() + math.random(10,20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
local Type = 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
local begin = VJ_PICK({"vjseq_zbs_cannon_ready"})
local fire = VJ_PICK({"vjseq_zbs_cannon1"})
local stop = VJ_PICK({"vjseq_zbs_cannon_end"})

self:VJ_ACT_PLAYACTIVITY(begin,true,VJ_GetSequenceDuration(self,begin),true)

	timer.Simple(1.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(fire,false,VJ_GetSequenceDuration(self,fire),true)
	end
	end)
	timer.Simple(2.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(fire,false,VJ_GetSequenceDuration(self,fire),true)
	end
	end)
	timer.Simple(3.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(fire,false,VJ_GetSequenceDuration(self,fire),true)
	end
	end)
	timer.Simple(4.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(fire,false,VJ_GetSequenceDuration(self,fire),true)
	end
	end)
	timer.Simple(5.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(fire,false,VJ_GetSequenceDuration(self,fire),true)
	end
	end)
	
	timer.Simple(6.6,function() if IsValid(self) && (self:Health() > (0)) then
self:VJ_ACT_PLAYACTIVITY(stop,true,VJ_GetSequenceDuration(self,stop),true)
	end
	end)
end
function ENT:RangeAttackCode_GetShootPos(projectile)
    return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

	if self.Bomb == true then
		self.AnimTbl_MeleeAttack = {"vjseq_zbs_landmine1"} 
	elseif self.Bomb == false then
		self.AnimTbl_MeleeAttack = {"vjseq_zbs_attack1","vjseq_zbs_attack2"}
	end
end