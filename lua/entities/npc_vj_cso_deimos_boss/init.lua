AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/deimos_boss.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_ganymede_hp")

ENT.Shockwave = false
ENT.NextShockwave = 0 

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 80

ENT.MeleeAttackDistance = 90
ENT.MeleeAttackDamageDistance = 110 
ENT.MeleeAttackKnockBack_Forward1 = 200 
ENT.MeleeAttackKnockBack_Forward2 = 200
ENT.MeleeAttackKnockBack_Up1 = 200
ENT.MeleeAttackKnockBack_Up2 = 200 

ENT.RangeAttackPos_Up = 70
ENT.RangeAttackPos_Right = 6

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && self.Shockwave == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextShockwave && self:GetPos():Distance(self:GetEnemy():GetPos()) < 150 && (self:Health() > (0)) then
		        self.Shockwave = true 
				self:Skill()
				timer.Simple(1,function() if IsValid(self) then
				self.Shockwave = false
				self.NextShockwave = CurTime() + math.random(5,15)
				end
				end)

	end
end