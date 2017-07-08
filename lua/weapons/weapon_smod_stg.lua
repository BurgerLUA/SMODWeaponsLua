if CLIENT then
	killicon.AddFont( "weapon_burger_cs_ak47", "csd", "b", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/ak47")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "StG 44"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 221

SWEP.Description			= "AW SHEIT"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_smod_stg44.mdl"
SWEP.WorldModel				= "models/weapons/w_smod_stg44.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 34
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/stg44/stg44-fire.wav")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 0.11
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 2
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 1.125
SWEP.MoveConeMul			= 0.75
SWEP.HeatMul				= 0.5
SWEP.CoolMul				= 0.75
SWEP.CoolSpeedMul			= 1.25
SWEP.MaxHeat				= 3

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
SWEP.HasFirstShotAccurate	= true

SWEP.CanShootWhileSprinting = false
SWEP.DamageFalloff			= 2000

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.ZoomTime				= 0.5

SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng			= Vector(0, 0, 0)

SWEP.IronRunPos 			= Vector(0, 0, 0)
SWEP.IronRunAng 			= Vector(-10, 10, 0)

SWEP.IronMeleePos 			= Vector(-0, 30, 0)
SWEP.IronMeleeAng 			= Vector(0, 45, 0)

SWEP.AddFOV					= -10

SWEP.IronIdlePos			= Vector(0,-3,-4)
SWEP.IronShootPos			= Vector(0,-3,-4)




