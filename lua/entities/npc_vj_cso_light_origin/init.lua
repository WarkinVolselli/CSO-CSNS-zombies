AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/light_origin.mdl"}
ENT.Origin = true

ENT.Hide = false
ENT.NextHide = 0

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && math.random(1,50) == 1 && self.Hide == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextHide && (self:Health() > (0)) then
		        self.Hide = true 
			self:SetMaterial("Models/effects/vol_light001")
			self:DrawShadow(false)
			self.VJ_NoTarget = true
			    self:PlaySoundSystem("Alert")
		   timer.Simple(8,function() if IsValid(self) then
		   self.VJ_NoTarget = false
		   self:PlaySoundSystem("Pain")
		        self.Hide = false
					self:DrawShadow(true)
						self:SetMaterial("")
		   	    self.NextHide = CurTime() + math.random(10,20)
    end 
	end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	        self.Hide = false
	self:DrawShadow(true)
	self.VJ_NoTarget = false
			self:SetMaterial("")
end