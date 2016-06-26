if CLIENT then
	killicon.Add( "weapon_smod_dbarrel", "vgui/killicons/smod_Sawedoff", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_Sawedoff")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "DOUBLE BARREL"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1700
SWEP.MoveSpeed				= 230

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_sawedoff.mdl"
SWEP.WorldModel				= "models/weapons/w_sawedoff.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= (56*2) / 12
SWEP.Primary.NumShots		= 12
SWEP.Primary.Sound			= Sound("Weapon_Sawedoff.Single")
SWEP.Primary.Cone			= 0.05
SWEP.Primary.ClipSize		= 2
SWEP.Primary.SpareClip		= 32
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "css_12gauge"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 1.25
SWEP.HeatMul				= 1

SWEP.BurstOverride			= 2
SWEP.BurstSpeedOverride 	= 0.1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.25
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-5, -10, 4)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.AddFOV					= 20

SWEP.DamageFalloff			= 250

SWEP.PenetrationLossScale	= 0.25