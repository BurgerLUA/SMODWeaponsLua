if CLIENT then
	killicon.Add( "weapon_smod_mp40", "vgui/killicons/smod_mp40", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_mp40")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "MP40"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 230

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_mp40.mdl"
SWEP.WorldModel				= "models/weapons/w_mp40.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_SMODMP40.Single")
SWEP.Primary.Cone			= 0.006
SWEP.Primary.ClipSize		= 32
SWEP.Primary.SpareClip		= 32*4
SWEP.Primary.Delay			= 1/(500/60)
SWEP.Primary.Ammo			= "bb_9mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 1
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.MaxHeat				= 4

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
SWEP.HasSpecialFire			= true
SWEP.CanShootWhileSprinting = false

SWEP.DamageFalloff			= 1000

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.5

SWEP.IronSightsPos 			= Vector(-8.12, 0, 1.24)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos 			= Vector(0,20,0)
SWEP.IronMeleeAng 			= Vector(0,0,0)

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
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
	self:NewSwing(75)
	self.Owner:DoAnimationEvent( ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND )


end