AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/regular.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_regular_hp")
ENT.MeleeAttackDamage = math.random(10,20)

ENT.SoundTbl_Alert = {"vj_cso/regular/Zombi_pressure.ogg","vj_cso/regular/Zombi_pre_idle_1.ogg","vj_cso/regular/Zombi_pre_idle_2.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_cso/regular/Zombie_death_3.ogg"}
ENT.SoundTbl_Pain = {"vj_cso/regular/Zombi_hurt_01.ogg","vj_cso/regular/Zombi_hurt_02.ogg"}
ENT.SoundTbl_Death = {"vj_cso/regular/Zombi_death_1.ogg","vj_cso/regular/Zombi_death_2.ogg","vj_cso/regular/Zombie_death_3.ogg"}
