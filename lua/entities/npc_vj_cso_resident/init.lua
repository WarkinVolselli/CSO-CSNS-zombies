AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/vj_cso/mobs/resident.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cso_resident_hp")

ENT.SoundTbl_Alert = {"vj_cso/resident/resident_tw.wav","vj_cso/resident/resident_skill2.wav"}
ENT.SoundTbl_Pain = {"vj_cso/resident/resident_hurt1.wav","vj_cso/resident/resident_hurt2.wav"}
ENT.SoundTbl_Death = {"vj_cso/resident/resident_death.wav"}
ENT.SoundTbl_BeforeLeapAttack = {"vj_cso/light/zombi_heal_female.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_cso/zombi_swing_1.wav","vj_cso/zombi_swing_2.wav","vj_cso/zombi_swing_3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

	self.StingAttack = false

	if enemydist > 100 then
		self.StingAttack = true

		self.MeleeAttackDistance = 100
		self.MeleeAttackDamageDistance = 120
		self.AnimTbl_MeleeAttack = {"vjges_zbs_skill1"}
		self.SoundTbl_BeforeMeleeAttack =  {"vj_cso/resident/resident_skill1.wav"}
	    self.NextMeleeAttackTime = 2
	else
		self.MeleeAttackDistance = 60
		self.MeleeAttackDamageDistance = 80
		self.AnimTbl_MeleeAttack = {"vjges_zbs_attack"}
		self.SoundTbl_BeforeMeleeAttack =  {"vj_cso/resident/resident_skill2.wav","vj_cso/resident/resident_tw.wav"}
	    self.NextMeleeAttackTime = 0
	end
end