if CLIENT then
	killicon.Add( "weapon_smod_mp40", "vgui/killicons/smod_mp40", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_mp40")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "MP40"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

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
SWEP.Primary.Ammo			= "css_9mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.VelConeMul				= 0.5
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
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-4, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000

SWEP.MeleeSoundMiss			= nil
SWEP.MeleeSoundWallHit		= nil
SWEP.MeleeSoundFleshSmall	= nil
SWEP.MeleeSoundFleshLarge	= nil

SWEP.HasSpecialFire			= true

function SWEP:SpecialFire()

	--PrintTable(GetActivities(self))
	
	--if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	self:SetNextPrimaryFire(CurTime() + 0.75)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
	
	--if IsFirstTimePredicted() then
		self:NewSwing(75)
	--end

end