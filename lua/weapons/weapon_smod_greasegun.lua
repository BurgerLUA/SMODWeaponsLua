if CLIENT then
	killicon.Add( "weapon_smod_greasegun", "vgui/killicons/smod_m3greasegun", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_m3greasegun")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "GREASEGUN"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 220

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
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 60
SWEP.Primary.Delay			= 1/(450/60)
SWEP.Primary.Ammo			= "bb_45acp"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 1.5
SWEP.MoveConeMul			= 0.75
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 2

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
SWEP.IronSightTime			= 0.5
SWEP.IronSightsPos 			= Vector(-6.08, 0, 1.12)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.CanShootWhileSprinting = false
SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos = Vector(9.848, -6.633, -6.835)
SWEP.IronMeleeAng = Vector(0, 70, -34.473)

SWEP.AddFOV					= 0

SWEP.DamageFalloff			= 1000