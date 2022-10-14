ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Deimos"
ENT.Author 			= "Warkin"
ENT.Information		= "Projectiles for my addons"

if (CLIENT) then
	local Name = "Deimos"
	local LangName = "obj_vj_cso_deimos_projectile"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end