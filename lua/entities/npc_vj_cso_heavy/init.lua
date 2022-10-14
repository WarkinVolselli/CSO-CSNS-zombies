AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/heavy.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_heavy_hp")

ENT.MeleeAttackDamage = math.random(15,30)
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 100 

ENT.SoundTbl_Alert = {"vj_cso/heavy/Zombi_death_heavy_1.ogg","vj_cso/heavy/Zombi_death_heavy_2.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/heavy/Zombi_heal_heavy.ogg"}
ENT.SoundTbl_Pain = {"vj_cso/heavy/zombi_hurt_heavy_1.wav","vj_cso/heavy/zombi_hurt_heavy_2.wav"}
ENT.SoundTbl_Death = {"vj_cso/heavy/Zombi_death_heavy_1.ogg","vj_cso/heavy/Zombi_death_heavy_2.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "death" then
		VJ_EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, 100)
	end
	if key == "metal" then
		VJ_EmitSound(self, "physics/metal/metal_solid_impact_soft"..math.random(1,3)..".wav", 70, 100)
	end
	if key == "melee" then
		self:MeleeAttackCode()		
    end		
	if key == "range" then
		self:RangeAttackCode()		
    end	
end