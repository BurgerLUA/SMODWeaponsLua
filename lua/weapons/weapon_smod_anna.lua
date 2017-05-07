if CLIENT then
	killicon.Add( "weapon_smod_anna", "vgui/killicons/smod_annabelle", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_annabelle")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Model 1892"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2350
SWEP.CSSMoveSpeed			= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4 - 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_annabelle.mdl"
SWEP.WorldModel				= "models/weapons/rifle_zm_3rd.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.UseHands 				= false

game.AddAmmoType({
	name = "ex_4440",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_4440_ammo",".44-40")
end

SWEP.Primary.Damage			= 90
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_SMODAnnabelle.Single")
SWEP.Primary.Cone			= 0.003
SWEP.Primary.ClipSize		= 15
SWEP.Primary.SpareClip		= 15*2
SWEP.Primary.Delay			= 0.35
SWEP.Primary.Ammo			= "ex_4440"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("weapons/winchester/win_reload1.wav")

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 0.5
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 2.25
SWEP.CoolSpeedMul			= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDryFire				= false

SWEP.HasHL2Pump				= true
SWEP.CanShootWhileSprinting = false

SWEP.DamageFalloff			= 3000

SWEP.AddFOV 				= 10

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.5

SWEP.MeleeDelay				= 0.1

SWEP.IronMeleePos 			= Vector(0, -100, 0)
SWEP.IronMeleeAng 			= Vector(-5.628, 35.879, -52.061)

SWEP.IronRunPos				= Vector(0,-10,-20)
SWEP.IronRunAng				= Vector(45,0,0)

SWEP.IronSightsPos 			= Vector(-8, 0, 3)
SWEP.IronSightsAng 			= Vector(0, 0, 0)