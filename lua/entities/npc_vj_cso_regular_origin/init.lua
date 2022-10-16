AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/regular_origin.mdl"}
ENT.Origin = true

ENT.Berserk = false
ENT.NextBerserk = 0 

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    if IsValid(self:GetEnemy()) && math.random(1,50) == 1 && self.Berserk == false && self.VJ_IsBeingControlled == false && CurTime() > self.NextBerserk && (self:Health() > (0)) then
		        self.Berserk = true 
				self.AnimTbl_Run = {ACT_RUN_AGITATED}
			    self:PlaySoundSystem("Alert")
			    self:SetKeyValue("rendercolor","255 100 100 255")
		   timer.Simple(8,function() if IsValid(self) then
		        self.Berserk = false
			    self:PlaySoundSystem("Pain")
		   	    self.NextBerserk = CurTime() + math.random(10,20)
				self.AnimTbl_Run = {ACT_RUN}
				self:StopParticles()
			    self:SetKeyValue("rendercolor","255 255 255 255")
				if self.Thrower == true then 
			    self:SetKeyValue("rendercolor","155 255 155 255")
				end
				if self.Stronger == true then 
			    self:SetKeyValue("rendercolor","255 155 0 255")
				end
				if self.Regen == true then 
			    self:SetKeyValue("rendercolor","155 155 255 255")
				end
				if self.Toxic == true then 
			    self:SetKeyValue("rendercolor","255 155 255 255")
				end
				if self.Stalker == true then 
			    self:SetKeyValue("rendercolor","50 50 50 255")
				end
    end 
	end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if self.Berserk == true then
		dmginfo:ScaleDamage(1.25)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup) 
	        self.Berserk = false
			    self:SetKeyValue("rendercolor","255 255 255 255")
				if self.Thrower == true then 
			    self:SetKeyValue("rendercolor","155 255 155 255")
				end
				if self.Stronger == true then 
			    self:SetKeyValue("rendercolor","255 155 0 255")
				end
							if self.Regen == true then 
			    self:SetKeyValue("rendercolor","155 155 255 255")
				end
				if self.Toxic == true then 
			    self:SetKeyValue("rendercolor","255 155 255 255")
				end
				if self.Stalker == true then 
			    self:SetKeyValue("rendercolor","50 50 50 255")
				end
end