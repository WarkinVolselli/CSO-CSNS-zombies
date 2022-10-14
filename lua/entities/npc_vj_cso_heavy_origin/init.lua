AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/heavy_origin.mdl"}
ENT.Origin = true

ENT.NextTrap = 0

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && math.random(1,50) == 1 && self.VJ_IsBeingControlled == false && CurTime() > self.NextTrap && (self:Health() > (0)) then
	
	self:PlaySoundSystem("Alert")
	self:VJ_ACT_PLAYACTIVITY("vjges_zbs_attack",true,VJ_GetSequenceDuration(self,tbl),false)
	
		   timer.Simple(0.5,function() if IsValid(self) then
		   self.Trap = ents.Create("npc_vj_cso_trap")
		   self.Trap:SetPos(self:GetPos() + self:GetForward()*60)
		   self.Trap:Spawn()
		   self.Trap:SetOwner(self)	
		   self.NextTrap = CurTime() + math.random(10,20)
		   end
		   end)
	end
end
