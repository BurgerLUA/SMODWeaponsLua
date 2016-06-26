if CLIENT then
	killicon.Add( "weapon_smod_cz52", "vgui/killicons/smod_cz52", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_cz52")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "CZ 52"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_cz52.mdl"
SWEP.WorldModel				= "models/weapons/w_cz52.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "revolver"
SWEP.UseHands				= false

SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_CZ52.Single")
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= 8
SWEP.Primary.SpareClip		= 8*4
SWEP.Primary.Delay			= 0.15
SWEP.Primary.Ammo			= "css_45acp"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 1
SWEP.HeatMul				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-6, 0, 2)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000