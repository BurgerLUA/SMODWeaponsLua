if CLIENT then
	killicon.Add( "weapon_smod_dualcolts", "vgui/killicons/smod_dualcolts", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_dualcolts")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "COLT AKIMBO"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_colts.mdl"
SWEP.WorldModel				= "models/weapons/w_colts.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "duel"
SWEP.UseHands				= false

SWEP.Primary.Damage			= 45
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/colts/fire.wav")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 14
SWEP.Primary.SpareClip		= 14*4
SWEP.Primary.Delay			= 1/10
SWEP.Primary.Ammo			= "bb_45acp"
SWEP.Primary.Automatic 		= false

SWEP.EnableTracer			= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= -1
SWEP.MoveConeMul				= 2
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
SWEP.HasDual				= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(0.75, 5, 2)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.BurstSpeedAbs			= 1/5
SWEP.BurstOverride			= 2
SWEP.BurstSpeedOverride		= 0

SWEP.DamageFalloff			= 1000

SWEP.SideRecoilBasedOnDual	= true



