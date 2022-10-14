AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/heavy_boss.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_juggernaut_hp")
ENT.HullType = HULL_LARGE 


ENT.AnimTbl_MeleeAttack = {"vjseq_zbs_attack"}
ENT.MeleeAttackDamage = math.random(25,40)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 160

ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 70

ENT.SoundTbl_Alert = {"vj_cso/heavy/Zombi_death_heavy_1.ogg","vj_cso/heavy/Zombi_death_heavy_2.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/heavy/Zombi_heal_heavy.ogg"}
ENT.SoundTbl_Pain = {"vj_cso/heavy/zombi_hurt_heavy_1.wav","vj_cso/heavy/zombi_hurt_heavy_2.wav"}
ENT.SoundTbl_Death = {"vj_cso/heavy/Zombi_death_heavy_1.ogg","vj_cso/heavy/Zombi_death_heavy_2.ogg"}

ENT.MeleeAttackWorldShakeOnMiss = true

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	    VJ_EmitSound(self, "vj_cso/juggernaut/tank_walk0"..math.random(1,6)..".wav", 80, 100)
		util.ScreenShake(self:GetPos(),16,400,0.6,600) 
	end
	if key == "death" then
		VJ_EmitSound(self, "vj_cso/juggernaut/bodyfall.wav", 80, 100)
		util.ScreenShake(self:GetPos(),32,900,1,800) 
	end
	if key == "metal" then
		VJ_EmitSound(self, "physics/metal/metal_canister_impact_hard"..math.random(1,3)..".wav", 70, 100)
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
function ENT:CustomInitialize()
	self:SetCollisionBounds(Vector(57, 66 , 170), Vector(-47, -74, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
local Type = 0
end