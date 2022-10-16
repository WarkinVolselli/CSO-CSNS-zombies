AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/regular.mdl"}
ENT.StartHealth = 100
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.HasDeathRagdoll = false

ENT.Walker = false
ENT.Thrower = false
ENT.Stronger = false
ENT.Regen = false
ENT.Toxic = false
ENT.Stalker = false
ENT.Origin = false

ENT.CSO_Infection = true

ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN}

ENT.HasHealthRegeneration = false
ENT.HealthRegenerationAmount = math.random(10,20)
ENT.HealthRegenerationDelay = VJ_Set(1, 2)
ENT.HealthRegenerationResetOnDmg = true

ENT.AnimTbl_MeleeAttack = {"vjges_zbs_attack"}
ENT.MeleeAttackDamage = math.random(10,20)
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.TimeUntilMeleeAttackDamage = false

ENT.MeleeAttackBleedEnemy = false
ENT.MeleeAttackBleedEnemyChance = 1
ENT.MeleeAttackBleedEnemyDamage = math.random(1,2)
ENT.MeleeAttackBleedEnemyTime = math.random(1,2)
ENT.MeleeAttackBleedEnemyReps = math.random(4,8)

ENT.HasRangeAttack = false
ENT.AnimTbl_RangeAttack = {"vjges_zbs_shoot_grenade_idle1"}
ENT.RangeAttackEntityToSpawn = "obj_vj_zombie_grenade"
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 10

ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 60 

ENT.DisableFootStepSoundTimer = true 
	-- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttack = {"vj_cso/zombi_attack_1.wav","vj_cso/zombi_attack_2.wav","vj_cso/zombi_attack_3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_cso/zombi_swing_1.wav","vj_cso/zombi_swing_2.wav","vj_cso/zombi_swing_3.wav"}
ENT.FootSteps = {
	[MAT_ANTLION] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_BLOODYFLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_CONCRETE] = {
		"player/footsteps/concrete1.wav",
		"player/footsteps/concrete2.wav",
		"player/footsteps/concrete3.wav",
		"player/footsteps/concrete4.wav",
	},
	[MAT_DIRT] = {
		"player/footsteps/dirt1.wav",
		"player/footsteps/dirt2.wav",
		"player/footsteps/dirt3.wav",
		"player/footsteps/dirt4.wav",
	},
	[MAT_FLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_GRATE] = {
		"player/footsteps/metalgrate1.wav",
		"player/footsteps/metalgrate2.wav",
		"player/footsteps/metalgrate3.wav",
		"player/footsteps/metalgrate4.wav",
	},
	[MAT_ALIENFLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[74] = { -- Snow
		"player/footsteps/sand1.wav",
		"player/footsteps/sand2.wav",
		"player/footsteps/sand3.wav",
		"player/footsteps/sand4.wav",
	},
	[MAT_PLASTIC] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav",
	},
	[MAT_METAL] = {
		"player/footsteps/metal1.wav",
		"player/footsteps/metal2.wav",
		"player/footsteps/metal3.wav",
		"player/footsteps/metal4.wav",
	},
	[MAT_SAND] = {
		"player/footsteps/sand1.wav",
		"player/footsteps/sand2.wav",
		"player/footsteps/sand3.wav",
		"player/footsteps/sand4.wav",
	},
	[MAT_FOLIAGE] = {
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav",
	},
	[MAT_COMPUTER] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav",
	},
	[MAT_SLOSH] = {
		"player/footsteps/slosh1.wav",
		"player/footsteps/slosh2.wav",
		"player/footsteps/slosh3.wav",
		"player/footsteps/slosh4.wav",
	},
	[MAT_TILE] = {
		"player/footsteps/tile1.wav",
		"player/footsteps/tile2.wav",
		"player/footsteps/tile3.wav",
		"player/footsteps/tile4.wav",
	},
	[85] = { -- Grass
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav",
	},
	[MAT_VENT] = {
		"player/footsteps/duct1.wav",
		"player/footsteps/duct2.wav",
		"player/footsteps/duct3.wav",
		"player/footsteps/duct4.wav",
	},
	[MAT_WOOD] = {
		"player/footsteps/wood1.wav",
		"player/footsteps/wood2.wav",
		"player/footsteps/wood3.wav",
		"player/footsteps/wood4.wav",
		"player/footsteps/woodpanel1.wav",
		"player/footsteps/woodpanel2.wav",
		"player/footsteps/woodpanel3.wav",
		"player/footsteps/woodpanel4.wav",
	},
	[MAT_GLASS] = {
		"physics/glass/glass_sheet_step1.wav",
		"physics/glass/glass_sheet_step2.wav",
		"physics/glass/glass_sheet_step3.wav",
		"physics/glass/glass_sheet_step4.wav",
	}
}
ENT.FootStepPitch = VJ_Set(100, 100)

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "death" then
		VJ_EmitSound(self, "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 70, 100)
	end
	if key == "melee" then
		self:MeleeAttackCode()	
    end		
	if key == "range" then
		self:RangeAttackCode()		
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()

if self.Origin == true then
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_origin_hp")
self.StartHealth = self.StartHealth * 1.75
end

if math.random(1,GetConVar("vj_cso_walker_chance"):GetInt()) == 1 then
self.Walker = true
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_walker_hp")
self.StartHealth = self.StartHealth * 2
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_WALK}
end

if math.random(1,GetConVar("vj_cso_thrower_chance"):GetInt()) == 1 && self.Stronger == false && self.Regen == false && self.Toxic == false && self.Stalker == false then
self.Thrower = true 
self:SetKeyValue("rendercolor","155 255 155 255")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_thrower_hp")
self.StartHealth = self.StartHealth * 0.75
self.HasRangeAttack = true
end

if math.random(1,GetConVar("vj_cso_stronger_chance"):GetInt()) == 1 && self.Thrower == false && self.Regen == false && self.Toxic == false && self.Stalker == false then
self.Stronger = true
self:SetKeyValue("rendercolor","255 155 0 255")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_stronger_hp")
self.StartHealth = self.StartHealth * 2
end

if math.random(1,GetConVar("vj_cso_regen_chance"):GetInt()) == 1 && self.Stronger == false && self.Thrower == false && self.Toxic == false && self.Stalker == false then
self.Regen = true
self:SetKeyValue("rendercolor","155 155 255 255")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_regen_hp")
self.StartHealth = self.StartHealth * 1.5
self.HasHealthRegeneration = true
end

if math.random(1,GetConVar("vj_cso_toxic_chance"):GetInt()) == 1 && self.Stronger == false && self.Thrower == false && self.Regen == false && self.Stalker == false then
self.Toxic = true
self:SetKeyValue("rendercolor","255 155 255 255")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_toxic_hp")
self.StartHealth = self.StartHealth * 1.25
self.MeleeAttackBleedEnemy = true
end

if math.random(1,GetConVar("vj_cso_stalker_chance"):GetInt()) == 1 && self.Stronger == false && self.Thrower == false && self.Regen == false && self.Toxic == false then
self.Stalker = true
self:SetKeyValue("rendercolor","50 50 50 200")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_stalker_hp")
self.StartHealth = self.StartHealth * 0.5
self:SetRenderFX(kRenderFxHologram)
end

self:Zombie_CustomOnPreInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(CustomTbl)
	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	if self:IsOnGround() && self:GetGroundEntity() != NULL then
		if self.DisableFootStepSoundTimer == true then
			self:CustomOnFootStepSound()
			return
		elseif self:IsMoving() && CurTime() > self.FootStepT then
			self:CustomOnFootStepSound()
			local CurSched = self.CurrentSchedule
			if self.DisableFootStepOnRun == false && ((VJ_HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or (CurSched != nil  && CurSched.IsMovingTask_Run == true)) /*(VJ_HasValue(VJ_RunActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomRunActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return
			elseif self.DisableFootStepOnWalk == false && (VJ_HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or (CurSched != nil  && CurSched.IsMovingTask_Walk == true)) /*(VJ_HasValue(VJ_WalkActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomWalkActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Walk()
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end