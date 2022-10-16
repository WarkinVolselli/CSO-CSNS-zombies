AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/deimos_origin.mdl"}
ENT.Origin = true

ENT.Shockwave = false
ENT.NextShockwave = 0 

ENT.RangeAttackPos_Up = 60
ENT.RangeAttackPos_Right = 5

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && self.Shockwave == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextShockwave && self:GetPos():Distance(self:GetEnemy():GetPos()) < 250 && (self:Health() > (0)) then
		        self.Shockwave = true 
				self:Skill()
				timer.Simple(1,function() if IsValid(self) then
				self.Shockwave = false
				self.NextShockwave = CurTime() + math.random(5,15)
				end
				end)

	end
end
