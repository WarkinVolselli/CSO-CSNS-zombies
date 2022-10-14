------------------ Addon Information ------------------
local PublicAddonName = "[VJ] Counter Strike Online: Zombies"
local AddonName = "Counter Strike Online: Zombies"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_cso_zombies_autorun.lua" 
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_cso_zombies_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	/* -- Comment box start
	NOTE: The following code is commented out so the game doesn't run it! When copying one of the options below, make sure to put it outside of the comment box!
	
	VJ.AddNPC("Dummy SNPC", "npc_vj_dum_dummy", vCat) -- Adds a NPC to the spawnmenu
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is the category that it should be in
			-- Fourth is optional, which is a boolean that defines whether or not it's an admin-only entity
	VJ.AddNPC_HUMAN("Dummy Human SNPC", "npc_vj_dum_dummy", {"weapon_vj_dummy"}, vCat) -- Adds a NPC to the spawnmenu but with a list of weapons it spawns with
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is a table of weapon, the base will pick a random one from the table and give it to the SNPC when "Default Weapon" is selected
			-- Fourth is the category that it should be in
			-- Fifth is optional, which is a boolean that defines whether or not it's an admin-only entity
	VJ.AddWeapon("Dummy Weapon", "weapon_vj_dummy", false, vCat) -- Adds a weapon to the spawnmenu
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is a boolean that defines whether or not it's an admin-only entity
			-- And the last parameter is the category that it should be in
	VJ.AddNPCWeapon("VJ_Dummy", "weapon_vj_dummy") -- Adds a weapon to the NPC weapon list
		-- Parameters:
			-- First is the name, second is the class name
	VJ.AddEntity("Dummy Kit", "sent_vj_dummykit", "Author Name", false, 0, true, vCat) -- Adds an entity to the spawnmenu
		-- Parameters: 
			-- First is the name, second is the class name and the third is its class name	
			-- Fourth is a boolean that defines whether or not it's an admin-only entity
			-- Fifth is an integer that defines the offset of the entity (When it spawns)
			-- Sixth is a boolean that defines whether or not it should drop to the floor when it spawns
			-- And the last parameter is the category that it should be in

	-- Particles --
	VJ.AddParticle("particles/example_particle.pcf",{
		"example_particle_name1",
		"example_particle_name2",
	})
	
	-- Precache Models --
	util.PrecacheModel("models/example_model.mdl")
	
	-- ConVars --
	VJ.AddConVar("vj_dum_dummy_h",100) -- Example 1
	VJ.AddConVar("vj_dum_dummy_d",20) -- Example 2
	
	*/  -- Comment box end
	
	local vCat = "Counter Strike Online: Zombies" -- Category, you can also set a category individually by replacing the vCat with a string value
		
	-- NPCs --
	
	VJ.AddNPC("Regular", "npc_vj_cso_regular", vCat)
	VJ.AddNPC("Regular Origin", "npc_vj_cso_regular_origin", vCat)
	
	VJ.AddNPC("Light", "npc_vj_cso_light", vCat)
	VJ.AddNPC("Light Origin", "npc_vj_cso_light_origin", vCat)
	
	VJ.AddNPC("Heavy", "npc_vj_cso_heavy", vCat)
	VJ.AddNPC("Heavy Origin", "npc_vj_cso_heavy_origin", vCat)
	
	VJ.AddNPC("Psycho", "npc_vj_cso_psycho", vCat)
	VJ.AddNPC("Psycho Origin", "npc_vj_cso_psycho_origin", vCat)
	
	VJ.AddNPC("Deimos", "npc_vj_cso_deimos", vCat)
	VJ.AddNPC("Deimos Origin", "npc_vj_cso_deimos_origin", vCat)
	
	VJ.AddNPC("Venom Guard", "npc_vj_cso_boomer", vCat)
	VJ.AddNPC("Venom Guard Origin", "npc_vj_cso_boomer_origin", vCat)
	
	VJ.AddNPC("Voodoo Healer", "npc_vj_cso_healer", vCat)
	VJ.AddNPC("Voodoo Healer Origin", "npc_vj_cso_healer_origin", vCat)
	
	VJ.AddNPC("Venom Stinger", "npc_vj_cso_resident", vCat)
	VJ.AddNPC("Venom Stinger Origin", "npc_vj_cso_resident_origin", vCat)
	
	VJ.AddNPC("Stamper", "npc_vj_cso_undertaker", vCat)
	VJ.AddNPC("Stamper Origin", "npc_vj_cso_undertaker_origin", vCat)
	
	-- Bosses --
	
	VJ.AddNPC("Juggernaut", "npc_vj_cso_heavy_boss", vCat)
	VJ.AddNPC("Ganymede", "npc_vj_cso_deimos_boss", vCat)
	
    -- Spawners --

	VJ.AddNPC("[RANDOM ZOMBIE]","sent_vj_cso_randzomb",vCat)
	VJ.AddNPC("[RANDOM MINI-BOSS]","sent_vj_cso_randminiboss",vCat)
	
	-- ConVars --
	
	VJ.AddConVar("vj_cso_thrower_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_stronger_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_walker_chance", 5, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_cso_thrower_enable", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_stronger_enable", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_walker_enable", 1, {FCVAR_ARCHIVE})
	
	-- Stats --

	VJ.AddConVar("vj_cso_origin_hp",1.75, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_cso_thrower_hp",0.75, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_stronger_hp",2, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_cso_walker_hp",2, {FCVAR_ARCHIVE})

	VJ.AddConVar("vj_cso_regular_hp",200)
	VJ.AddConVar("vj_cso_light_hp",100)
	VJ.AddConVar("vj_cso_heavy_hp",300)
	VJ.AddConVar("vj_cso_psycho_hp",200)
	VJ.AddConVar("vj_cso_voodoo_hp",150)
	VJ.AddConVar("vj_cso_resident_hp",200)
	VJ.AddConVar("vj_cso_boomer_hp",400)
	VJ.AddConVar("vj_cso_undertaker_hp",300)
	VJ.AddConVar("vj_cso_deimos_hp",800)
	
	VJ.AddConVar("vj_cso_juggernaut_hp",4000)
	VJ.AddConVar("vj_cso_ganymede_hp",3000)
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if CLIENT then
		chat.AddText(Color(0, 200, 200), PublicAddonName,
		Color(0, 255, 0), " was unable to install, you are missing ",
		Color(255, 100, 0), "VJ Base!")
	end
	
	timer.Simple(1, function()
		if not VJBASE_ERROR_MISSING then
			VJBASE_ERROR_MISSING = true
			if CLIENT then
				// Get rid of old error messages from addons running on older code...
				if VJF && type(VJF) == "Panel" then
					VJF:Close()
				end
				VJF = true
				
				local frame = vgui.Create("DFrame")
				frame:SetSize(600, 160)
				frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
				frame:SetTitle("Error: VJ Base is missing!")
				frame:SetBackgroundBlur(true)
				frame:MakePopup()
	
				local labelTitle = vgui.Create("DLabel", frame)
				labelTitle:SetPos(250, 30)
				labelTitle:SetText("VJ BASE IS MISSING!")
				labelTitle:SetTextColor(Color(255,128,128))
				labelTitle:SizeToContents()
				
				local label1 = vgui.Create("DLabel", frame)
				label1:SetPos(170, 50)
				label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
				label1:SizeToContents()
				
				local label2 = vgui.Create("DLabel", frame)
				label2:SetPos(10, 70)
				label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
				label2:SizeToContents()
				
				local link = vgui.Create("DLabelURL", frame)
				link:SetSize(300, 20)
				link:SetPos(195, 100)
				link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
				link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
				
				local buttonClose = vgui.Create("DButton", frame)
				buttonClose:SetText("CLOSE")
				buttonClose:SetPos(260, 120)
				buttonClose:SetSize(80, 35)
				buttonClose.DoClick = function()
					frame:Close()
				end
			elseif (SERVER) then
				VJF = true
				timer.Remove("VJBASEMissing")
				timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
					print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
				end)
			end
		end
	end)
end