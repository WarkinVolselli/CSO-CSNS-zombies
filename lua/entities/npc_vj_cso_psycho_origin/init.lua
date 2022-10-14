AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/psycho_origin.mdl"}
ENT.Origin = true

ENT.NextSmoke = 0
 
ENT.MeleeAttackDamage = math.random(15,25)
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 100 

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) &&  math.random(1,50) == 1 && self.VJ_IsBeingControlled == false && CurTime() > self.NextSmoke && (self:Health() > (0)) then
			VJ_EmitSound(self,{"vj_cso/sg_explode.wav"},70,math.random(100,95))
			    ParticleEffectAttach("steam_train",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				self.NextSmoke = CurTime() + math.random(8,16)
  timer.Simple(1,function() if IsValid(self) then
			    ParticleEffectAttach("steam_train",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
  end 
	end)
  timer.Simple(2,function() if IsValid(self) then
			    ParticleEffectAttach("steam_train",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
  end 
	end)
  timer.Simple(3,function() if IsValid(self) then
			    ParticleEffectAttach("steam_train",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
  end 
	end)
		   	  
	end
end