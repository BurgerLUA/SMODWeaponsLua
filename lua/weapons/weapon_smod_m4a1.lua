if CLIENT then
	killicon.Add( "weapon_smod_m4a1", "vgui/killicons/smod_m4a1", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_m4a1")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "M4A1 Marksman"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_m4a1.mdl"
SWEP.WorldModel				= "models/weapons/w_m4a1.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"

SWEP.GetMagModel			= Model("models/weapons/magazines/smod_mag_M4A1.mdl")

SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/m4a1/m4a1-1.wav")
SWEP.Primary.Cone			= 0.00125
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 0.09
SWEP.Primary.Ammo			= "bb_556mm"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 0.1
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.CanShootWhileSprinting = false

SWEP.DamageFalloff			= 2000

SWEP.BurstOverride			= 3
SWEP.BurstConeMul			= 2
SWEP.BurstSpeedOverride 	= 1
SWEP.BurstRecoilMul			= 0.5
SWEP.BurstHeatMul			= 0.5
SWEP.BurstSpeedAbs			= 0.4

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.ZoomTime				= 0.25

SWEP.IronSightsPos 			= Vector(2.49, 20, 1.18)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(-10,0,-20)
SWEP.IronRunAng				= Vector(45,-10,-10)

SWEP.IronMeleePos = Vector(5.025, 3.216, -2.814)
SWEP.IronMeleeAng = Vector(24.622, -24.623, 23.215)

SWEP.HasIdle	= true

SWEP.VElements = {
	["element_name"] = { type = "Sprite", sprite = "sprites/eotech", bone = "a_m4", rel = "", pos = Vector(0.004, 2.97, 0), size = { x = 1, y = 1 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}