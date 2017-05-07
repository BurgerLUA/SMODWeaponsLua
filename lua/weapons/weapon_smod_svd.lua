if CLIENT then
	killicon.Add( "weapon_smod_svd", "vgui/killicons/smod_SVD", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_SVD")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "SVD-63"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 5000
SWEP.CSSMoveSpeed			= 230

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_svd.mdl"
SWEP.WorldModel				= "models/weapons/w_svd.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_SVD.Fire")
SWEP.Primary.Cone			= 0.001
SWEP.Primary.ClipSize		= 10
SWEP.Primary.SpareClip		= 10*4
SWEP.Primary.Delay			= 0.5
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 0.75
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.MaxHeat				= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 9
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.CanShootWhileSprinting = false


SWEP.CustomScope 			= Material("vgui/svdscope2")
SWEP.CustomScopeSizeMul 	= 0.75

SWEP.AddFOV					= 20
SWEP.DamageFalloff			= 4000
SWEP.ZoomDelay				= 0.25

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5

SWEP.IronSightsPos 			= Vector(-3.921, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos = Vector(0.602, -10.252, -2.613)
SWEP.IronMeleeAng = Vector(-7.739, 33.064, -41.508)




