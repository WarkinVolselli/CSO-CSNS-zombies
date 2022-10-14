AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/resident_origin.mdl"}
ENT.Origin = true

ENT.Lunge = false
ENT.NextLunge = 0 

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {"vjseq_zbs_jump"}
ENT.LeapAttackDamage = 25
ENT.LeapDistance = 1000
ENT.LeapToMeleeDistance = 500
ENT.LeapAttackVelocityForward = 500
ENT.LeapAttackVelocityUp = 300
ENT.LeapAttackVelocityRight = 0
ENT.NextLeapAttackTime = 5
ENT.NextLeapAttackTime_DoRand = 10
ENT.TimeUntilLeapAttackDamage = false