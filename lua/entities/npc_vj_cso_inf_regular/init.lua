AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/infected/regular_infected.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_regular_hp")
ENT.MeleeAttackDamage = math.random(10,20)

ENT.SoundTbl_Alert = {"vj_cso/regular/Zombi_pressure.ogg","vj_cso/regular/Zombi_pre_idle_1.ogg","vj_cso/regular/Zombi_pre_idle_2.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/regular/Zombie_death_3.ogg"}
ENT.SoundTbl_Pain = {"vj_cso/regular/Zombi_hurt_01.ogg","vj_cso/regular/Zombi_hurt_02.ogg"}
ENT.SoundTbl_Death = {"vj_cso/regular/Zombi_death_1.ogg","vj_cso/regular/Zombi_death_2.ogg","vj_cso/regular/Zombie_death_3.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
timer.Simple(0.1,function()
self:VJ_ACT_PLAYACTIVITY("infectiondeath",true,4,false)
self.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE  
self.GodMode = true
self.VJ_NoTarget = true
self.DisableMakingSelfEnemyToNPCs = true
self.DisableChasingEnemy = true
self.DisableFindEnemy = true
self.DisableWandering = true
self.MovementType = VJ_MOVETYPE_STATIONARY
self.CanTurnWhileStationary = false
self.HasSounds = false
self.GodMode = true
self.CanFlinch = 0
end)

timer.Simple(4,function()
if IsValid(self) then
self:VJ_ACT_PLAYACTIVITY("infectionrise",true,4,false)
self.GodMode = false
self.VJ_NoTarget = false
self.DisableMakingSelfEnemyToNPCs = false
self.DisableChasingEnemy = false
self.DisableFindEnemy = false
self.DisableWandering = false
self.HasSounds = true
self.GodMode = false
		
timer.Simple(4,function()
if IsValid(self) then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE 
self.MovementType = VJ_MOVETYPE_GROUND
self.CanFlinch = 1
end
end)
end
end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
if self.Origin == true then
self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_origin_hp")
end
end