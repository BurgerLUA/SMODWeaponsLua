if CLIENT then
	killicon.Add( "weapon_smod_m60", "vgui/killicons/smod_M60", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_M60")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "M60"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.MoveSpeed				= 170

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_m60.mdl"
SWEP.WorldModel				= "models/weapons/w_m60.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"

SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/m60/fire1.wav")
SWEP.Primary.Cone			= 0.0075
SWEP.Primary.ClipSize		= 100
SWEP.Primary.SpareClip		= 200
SWEP.Primary.Delay			= 1/(500/60)
SWEP.Primary.Ammo			= "css_762mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.VelConeMul				= 5
SWEP.HeatMul				= 0.25
SWEP.CoolMul				= 2

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
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
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-3, 20, 1)
SWEP.IronSightsAng 			= Vector(0, 0, -7)

SWEP.DamageFalloff			= 3000