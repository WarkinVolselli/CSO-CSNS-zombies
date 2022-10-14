AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/light.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_light_hp")

ENT.MeleeAttackDamage = math.random(5,15)

ENT.SoundTbl_Alert = {"vj_cso/light/zombi_heal_female.wav"}
ENT.SoundTbl_BeforeMeleeAttack =  {"vj_cso/light/zombi_attack_female.wav","vj_cso/light/zombi_attack_female2.wav"}
ENT.SoundTbl_Pain = {"vj_cso/light/zombi_hurt_female_1.mp3","vj_cso/light/zombi_hurt_female_2.mp3"}
ENT.SoundTbl_Death = {"vj_cso/light/zbs_death_female_1.wav","vj_cso/light/zombi_death_female_1.mp3","vj_cso/light/zombi_death_female_2.mp3"}