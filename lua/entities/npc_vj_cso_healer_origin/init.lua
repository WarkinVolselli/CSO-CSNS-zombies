AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/healer_origin.mdl"}
ENT.Origin = true

ENT.NextHeal = CurTime()

function ENT:CustomOnThink_AIEnabled()
	for _,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
		if v:IsNPC() && v:GetClass() != self:GetClass() && v:Disposition(self) == D_LI && (self:Health() > (0)) then
			if v:Health() < v:GetMaxHealth() && CurTime() > self.NextHeal then
				for i = 0,v:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp0",v:GetBonePosition(i),Angle(0,0,0),nil)
				end
				for i = 0,self:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp1",self:GetBonePosition(i),Angle(0,0,0),nil)
				end
	            effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(33, 255, 0, 255), {material="sprites/orangelight1", framerate=20})
	            effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(33, 255, 0, 255), {material="sprites/orangelight1", framerate=20})
				VJ_EmitSound(self,{"vj_cso/td_heal.wav"},100,math.random(100,95))
				v:SetHealth(v:Health() + 100)
				if v:Health() > v:GetMaxHealth() then
					v:SetHealth(v:GetMaxHealth())
				end
				self.NextHeal = CurTime() + (math.Rand(4,8))
			end	
		end
	end
end

function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("You will automatically heal nearby allied NPCs")
end