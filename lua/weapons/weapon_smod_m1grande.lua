if CLIENT then
	killicon.Add( "weapon_smod_m1grande", "vgui/killicons/smod_M1Garand", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_M1Garand")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "M1 GARAND"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2750
SWEP.CSSMoveSpeed			= 220

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_m1garand.mdl"
SWEP.WorldModel				= "models/weapons/w_m1garand.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.UseHands 				= false

--.30-06 Springfield

game.AddAmmoType({
	name = "smod_3006",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("smod_3006_ammo",".30-06 Springfield")
end

SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_Garand.Fire")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 8
SWEP.Primary.SpareClip		= 8*5
SWEP.Primary.Delay			= 1/6
SWEP.Primary.Ammo			= "smod_3006"
SWEP.Primary.Automatic 		= false

SWEP.LastBulletSound		= Sound("Weapon_Garand.ClipDing")

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.MoveConeMul				= 2
SWEP.HeatMul				= 2

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasSpecialFire			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-4.95, 0, 2)
SWEP.IronSightsAng 			= Vector(0, 0.025, 0)

SWEP.DamageFalloff			= 2000

SWEP.DisableReloadUntilEmpty = true

SWEP.HasDryFire	= true

SWEP.MeleeSoundMiss			= Sound("weapons/foot/foot_fire.wav")
SWEP.MeleeSoundWallHit		= Sound("weapons/foot/foot_kickwall.wav")
SWEP.MeleeSoundFleshSmall	= Sound("weapons/foot/foot_kickbody.wav")
SWEP.MeleeSoundFleshLarge	= Sound("weapons/foot/foot_kickbody.wav")

function SWEP:SpecialFire()

	--PrintTable(GetActivities(self))
	
	--if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	self:SetNextPrimaryFire(CurTime() + 0.75)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
	self.Owner:DoAnimationEvent( ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND )
	self:NewSwing(75)

end