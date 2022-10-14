AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/undertaker.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_undertaker_hp")
ENT.MeleeAttackDamage = math.random(10,20)

ENT.SoundTbl_Alert = {"vj_cso/stamper/alert.wav","vj_cso/stamper/alert2.wav","vj_cso/stamper/alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/stamper/zombi_hurt_stamper_1.wav","vj_cso/stamper/zombi_hurt_stamper_2.wav"}
ENT.SoundTbl_Pain = {"vj_cso/stamper/zombi_hurt_stamper_1.wav","vj_cso/stamper/zombi_hurt_stamper_2.wav"}
ENT.SoundTbl_Death = {"vj_cso/stamper/zombi_death_stamper_1.wav","vj_cso/stamper/zombi_death_stamper_2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "death" then
		VJ_EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, 100)
	end
	if key == "wood" then
		VJ_EmitSound(self, "vj_cso/stamper/zombi_stamper_iron_maiden_stamping.wav", 70, math.random(110,120))
	    util.ScreenShake(self:GetPos(),16,150,0.2,400) 
	end
	if key == "melee" then
		self:MeleeAttackCode()		
    end		
	if key == "range" then
		self:RangeAttackCode()		
    end
	if key == "skill" then
		self:Skill()		
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Skill()
	effects.BeamRingPoint(self:GetPos(), 0.5, 4, 400, 32, 0, Color(155, 155, 255), {material="VJ_Base/sprites/vj_trial1", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.5, 4, 200, 32, 0, Color(100, 100, 255), {material="VJ_Base/sprites/vj_trial1", framerate=20})
	
	VJ_EmitSound(self,"vj_cso/stamper/zombi_stamper_iron_maiden_stamping.wav",100,math.random(80,100))
	
	util.VJ_SphereDamage(self, self, self:GetPos(), 150, math.random(20,30), DMG_CLUB, true, true, {DisableVisibilityCheck=true, Force=80})
		util.ScreenShake(self:GetPos(),16,300,0.4,400) 
end