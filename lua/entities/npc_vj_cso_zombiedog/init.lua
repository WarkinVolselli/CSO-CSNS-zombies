AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/zombiedog.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_zombiedog_hp")
ENT.MeleeAttackDamage = math.random(10,20)

ENT.SoundTbl_Alert = {"vj_cso/zombiedog/zombiedog_howls.wav"}
ENT.SoundTbl_Idle ={"vj_cso/zombiedog/zombiedog_idle.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/zombiedog/zombiedog_attack1.wav","vj_cso/zombiedog/zombiedog_attack_run.wav"}
ENT.SoundTbl_Pain = {"vj_cso/zombiedog/zombiedog_hurt1.wav","vj_cso/zombiedog/zombiedog_hurt2.wav"}
ENT.SoundTbl_Death = {"vj_cso/zombiedog/zombiedog_death1.wav","vj_cso/zombiedog/zombiedog_death2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()

if self.Origin == true then
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_origin_hp")
self.StartHealth = self.StartHealth * 1.75
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
self:SetKeyValue("rendercolor","50 50 50 255")
--self.StartHealth = self.StartHealth * GetConVarNumber("vj_cso_stalker_hp")
self.StartHealth = self.StartHealth * 0.5
self:SetRenderFX(kRenderFxHologram)
end

self:Zombie_CustomOnPreInitialize()

end