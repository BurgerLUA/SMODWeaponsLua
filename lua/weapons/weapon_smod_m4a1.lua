if CLIENT then
	killicon.Add( "weapon_smod_m4a1", "vgui/killicons/smod_m4a1", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_m4a1")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "M4A1 MARKSMAN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.MoveSpeed				= 221

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_m4a1.mdl"
SWEP.WorldModel				= "models/weapons/w_m4a1.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/m4a1/m4sil-1.wav")
SWEP.Primary.Cone			= 0.00125
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 1/15
SWEP.Primary.Ammo			= "css_556mm"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 0.5
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0.5
SWEP.CoolMul				= 2

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.BurstOverride			= 3
SWEP.BurstConeMul			= 1
SWEP.BurstSpeedOverride 	= 2
SWEP.BurstRecoilMul			= 1
SWEP.BurstHeatMul			= 0.5

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(0, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 2000
