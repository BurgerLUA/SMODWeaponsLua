if CLIENT then
	killicon.Add( "weapon_smod_combinecannon", "vgui/killicons/smod_PulseMG", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_PulseMG")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Pulse MG"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 220

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pulsemg.mdl"
SWEP.WorldModel				= "models/weapons/w_pulsemg.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_PulseMG.Single")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 90
SWEP.Primary.SpareClip		= 90*4
SWEP.Primary.Delay			= 1/(800/60)
SWEP.Primary.Ammo			= "ar2"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.75
SWEP.RecoilSpeedMul			= 1.5
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 2

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 3
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true
SWEP.CanShootWhileSprinting = false

SWEP.DamageFalloff			= 2000
SWEP.DamageType				= 2

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.ZoomTime				= 0.1
SWEP.ZoomDelay				= 0.25
SWEP.ColorOverlay			= Color(255,0,0,50)

SWEP.ShootOffsetStrength	= Angle(1,0.5,0)


SWEP.IronSightsPos 			= Vector(-5.52, 0, 2.119)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos = Vector(-0.805, -12.865, -8.844)
SWEP.IronMeleeAng = Vector(0, 70, -70)