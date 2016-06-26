if CLIENT then
	killicon.Add( "ent_smod_launcher", "vgui/killicons/smod_A35GL",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_A35GL")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "GRENADE LAUNCHER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2000
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 2

SWEP.ViewModel				= "models/weapons/v_a35.mdl"
SWEP.WorldModel				= "models/weapons/w_a35.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"

game.AddAmmoType({name = "ex_launcher"})

if CLIENT then 
	language.Add("ex_launcher_ammo","20MM HE")
end

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 6
SWEP.Primary.SpareClip		= 12
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Ammo			= "ex_launcher"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul 				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 1
SWEP.HeatMul				= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount				= 3
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDual				= false

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(2, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 100
SWEP.AddFOV					= 10

SWEP.HasHL2Pump				= false

SWEP.BulletEnt				= "ent_smod_launcher"
SWEP.SourceOverride			= Vector(2,0,-6)
SWEP.BulletAngOffset		= Angle(90 - 3,0,0)
