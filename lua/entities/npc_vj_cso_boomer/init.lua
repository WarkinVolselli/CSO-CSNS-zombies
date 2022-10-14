AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/boomer.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_boomer_hp")

ENT.BloodColor = "Yellow"

ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.GibOnDeathDamagesTable = {"All"}

ENT.MeleeAttackDamage = math.random(15,25)

ENT.HasDeathAnimation = false 

ENT.SoundTbl_Alert = {"vj_cso/boomer/Boomer_draw.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/boomer/Boomer_skill.ogg"}
ENT.SoundTbl_Pain = {"vj_cso/boomer/Boomer_hurt1.ogg","vj_cso/boomer/Boomer_hurt2.ogg"}
ENT.SoundTbl_Death = {""}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    ParticleEffectAttach("antlion_spit_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
		util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(0,0),DMG_BLAST,true,true,{Force=20})
	for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
		v:TakeDamage(math.random(60,80))
	end
		util.ScreenShake(self:GetPos(),44,600,1.5,2000)
		VJ_EmitSound(self,{"vj_cso/boomer/Boomer_death.ogg"},100,math.random(80,90))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(191,196,108)))
		bloodeffect:SetScale(240)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_01.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_02.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_03.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_04.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_05.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_06.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_07.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_01.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_02.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_03.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_04.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_05.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_06.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_07.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_03.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_03.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_03.mdl",{BloodType="Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
		return true,{DeathAnim=false,AllowCorpse=false}
end