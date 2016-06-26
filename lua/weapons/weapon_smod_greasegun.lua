if CLIENT then
	killicon.Add( "weapon_smod_greasegun", "vgui/killicons/smod_m3greasegun", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_m3greasegun")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "GREASEGUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_grease.mdl"
SWEP.WorldModel				= "models/weapons/w_grease.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/grease/greasegun_shoot.wav")
SWEP.Primary.Cone			= 0.0075
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 60
SWEP.Primary.Delay			= 1/(450/60)
SWEP.Primary.Ammo			= "css_45acp"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 0.5
SWEP.SideRecoilMul			= 0.25
SWEP.VelConeMul				= 0.5
SWEP.HeatMul				= 0.5

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-4, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000