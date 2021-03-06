if CLIENT then
	killicon.Add( "weapon_smod_alyxgun","vgui/killicons/smod_AlyxGun", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_AlyxGun")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Alyx's Gun"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 2350
SWEP.CSSMoveSpeed			= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_alyxgun.mdl"
SWEP.WorldModel				= "models/weapons/W_Alyx_Gun.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "revolver"

SWEP.Primary.Damage			= 23
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_AlyxGun.Single")
SWEP.Primary.Cone			= 0.0035
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 30*3
SWEP.Primary.Delay			= 1/(700/60)
SWEP.Primary.Ammo			= "bb_57mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.5
SWEP.SideRecoilMul			= 0.75
SWEP.RecoilSpeedMul			= 0.75
SWEP.MoveConeMul			= 1
SWEP.HeatMul				= 1.5
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 4

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true

SWEP.CanShootWhileSprinting = true
SWEP.DamageFalloff			= 900

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.125

SWEP.IronRunPos				= Vector(0,-10,-20)
SWEP.IronRunAng				= Vector(45,0,0)

SWEP.IronSightsPos 			= Vector(-3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronMeleePos 			= Vector(-6.433, -13.468, -20)
SWEP.IronMeleeAng 			= Vector(70, 0, 0)

SWEP.AnimationRateTable = {}
SWEP.AnimationRateTable[ACT_VM_RELOAD] = 0.8

SWEP.SequenceDurationAdd = {}
SWEP.SequenceDurationAdd[ACT_VM_RELOAD] = -0.1

