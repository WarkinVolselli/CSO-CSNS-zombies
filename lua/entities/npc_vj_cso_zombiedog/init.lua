AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/zombiedog.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_zombiedog_hp")
ENT.MeleeAttackDamage = math.random(10,20)
ENT.HullType = HULL_TINY

ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 70

ENT.SoundTbl_Alert = {"vj_cso/zombiedog/zombiedog_howls.wav"}
ENT.SoundTbl_Idle ={"vj_cso/zombiedog/zombiedog_idle.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/zombiedog/zombiedog_attack1.wav","vj_cso/zombiedog/zombiedog_attack_run.wav"}
ENT.SoundTbl_Pain = {"vj_cso/zombiedog/zombiedog_hurt1.wav","vj_cso/zombiedog/zombiedog_hurt2.wav"}
ENT.SoundTbl_Death = {"vj_cso/zombiedog/zombiedog_death1.wav","vj_cso/zombiedog/zombiedog_death2.wav"}
