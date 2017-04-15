if CLIENT then
	killicon.Add( "weapon_smod_kar98", "vgui/killicons/smod_Karabiner98", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_Karabiner98")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "KARABINER 98K"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2750
SWEP.CSSMoveSpeed			= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_kar98.mdl"
SWEP.WorldModel				= "models/weapons/w_kar98.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.UseHands 				= false

game.AddAmmoType({
	name = "smod_mauser",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("smod_mauser_ammo","7.92x57mm Mauser")
end

SWEP.Primary.Damage			= 110
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/kar98/kar_shoot.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 5
SWEP.Primary.SpareClip		= 5*6
SWEP.Primary.Delay			= 2
SWEP.Primary.Ammo			= "smod_mauser"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 0.5
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 0.5
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 5
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasSpecialFire			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-4, -1, 2)
SWEP.IronSightsAng 			= Vector(-3, 0.05, 0)

SWEP.DamageFalloff			= 1500

SWEP.MeleeSoundMiss			= Sound("Weapon_Knife.Slash")
SWEP.MeleeSoundWallHit		= Sound("Weapon_Knife.HitWall")
SWEP.MeleeSoundFleshSmall	= Sound("Weapon_Knife.Hit")
SWEP.MeleeSoundFleshLarge	= Sound("Weapon_Knife.Stab")

SWEP.CanShootWhileSprinting = false
SWEP.IronRunPos				= Vector(0,0,0)
SWEP.IronRunAng				= Vector(-10,0,0)

function SWEP:SpecialFire()

	--if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	self:SetNextPrimaryFire(CurTime() + 1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
	self.Owner:DoAnimationEvent( ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND )
	self:NewSwing(90)

end