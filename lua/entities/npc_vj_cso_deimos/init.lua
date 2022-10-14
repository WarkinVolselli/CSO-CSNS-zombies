AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/deimos.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_deimos_hp")
ENT.HullType = HULL_MEDIUM_TALL

ENT.AnimTbl_MeleeAttack = {"vjges_zbs_attack"}
ENT.MeleeAttackDamage = math.random(15,25)
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 100 
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Forward1 = 150
ENT.MeleeAttackKnockBack_Forward2 = 150
ENT.MeleeAttackKnockBack_Up1 = 150
ENT.MeleeAttackKnockBack_Up2 = 150 

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = {"vjges_zbs_skill"}
ENT.RangeAttackEntityToSpawn = "obj_vj_cso_deimos_projectile"
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 3000
ENT.RangeToMeleeDistance = 500
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 6
ENT.RangeAttackPos_Up = 60
ENT.RangeAttackPos_Right = 5

ENT.SoundTbl_Alert = {"vj_cso/regular/Zombi_pressure.ogg","vj_cso/regular/Zombi_pre_idle_1.ogg","vj_cso/regular/Zombi_pre_idle_2.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/regular/Zombie_death_3.ogg"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_cso/deimos/deimos_skill_start.wav"}
ENT.SoundTbl_Pain = {"vj_cso/regular/Zombi_hurt_01.ogg","vj_cso/regular/Zombi_hurt_02.ogg"}
ENT.SoundTbl_Death = {"vj_cso/regular/Zombi_death_1.ogg","vj_cso/regular/Zombi_death_2.ogg","vj_cso/regular/Zombie_death_3.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
		VJ_EmitSound(self, "npc/antlion_guard/foot_heavy"..math.random(1,2)..".wav", 70, 90)
		util.ScreenShake(self:GetPos(),16,200,0.1,500) 
	end
	if key == "death" then
		VJ_EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, 100)
		util.ScreenShake(self:GetPos(),16,300,0.4,400) 
	end
	if key == "melee" then
		self:MeleeAttackCode()		
    end		
	if key == "range" then
		self:RangeAttackCode()			
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
if self.Origin == true then
self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_origin_hp")
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Skill()
	effects.BeamRingPoint(self:GetPos(), 0.5, 4, 600, 32, 0, Color(255, 200, 0), {material="VJ_Base/sprites/vj_trial1", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.5, 4, 300, 32, 0, Color(255, 0, 0), {material="VJ_Base/sprites/vj_trial1", framerate=20})
	
	VJ_EmitSound(self,"vj_cso/td_stun.wav",100,math.random(90,100))
	
	util.VJ_SphereDamage(self, self, self:GetPos(), 200, math.random(20,30), DMG_SONIC, true, true, {DisableVisibilityCheck=true, Force=80})
		util.ScreenShake(self:GetPos(),16,300,0.5,500) 
end