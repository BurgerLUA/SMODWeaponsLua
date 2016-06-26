if CLIENT then
	killicon.Add( "weapon_smod_combinecannon", "vgui/killicons/smod_PulseMG", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_PulseMG")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "PULSE MACHINEGUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.MoveSpeed				= 170

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pulsemg.mdl"
SWEP.WorldModel				= "models/weapons/w_pulsemg.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_PulseMG.Single")
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= 90
SWEP.Primary.SpareClip		= 90*4
SWEP.Primary.Delay			= 1/(800/60)
SWEP.Primary.Ammo			= "ar2"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 0.75
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0.25

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
SWEP.HasDownRecoil			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, -7)

SWEP.DamageFalloff			= 1000
SWEP.HasBuildUp				= false

SWEP.TracerName 			= "AR2Tracer"