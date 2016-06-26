if CLIENT then
	killicon.Add( "weapon_smod_anna", "vgui/killicons/smod_annabelle", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_annabelle")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "MODEL 1892"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
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

SWEP.Primary.Damage			= 95
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_SMODAnnabelle.Single")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 15
SWEP.Primary.SpareClip		= 15*2
SWEP.Primary.Delay			= 0.35
SWEP.Primary.Ammo			= "ex_4440"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("weapons/winchester/win_reload1.wav")

SWEP.RecoilMul				= 0.3
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 0.75
SWEP.HeatMul				= 1
SWEP.CoolMul				= 2.25

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 2
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDryFire				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-4, 0, 3)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 3000

SWEP.AddFOV 				= 10

SWEP.HasHL2Pump				= true