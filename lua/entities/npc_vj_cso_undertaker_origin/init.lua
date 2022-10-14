AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/undertaker_origin.mdl"}
ENT.Origin = true

ENT.Shockwave = false
ENT.NextShockwave = 0 

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && self.Shockwave == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextShockwave then
		    self.Shockwave = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

	if self.Shockwave == true then
		self.MeleeAttackDistance = 125
		self.AnimTbl_MeleeAttack = {"vjges_zbs_skill"}
		self.Shockwave = false
		self.NextShockwave = CurTime() + math.random(5,15)
	elseif self.Shockwave == false then
		self.MeleeAttackDistance = 60
		self.AnimTbl_MeleeAttack = {"vjges_zbs_attack"}
	end
end