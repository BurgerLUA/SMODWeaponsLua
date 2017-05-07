if CLIENT then
	killicon.Add( "weapon_smod_oicw", "vgui/killicons/smod_OICW", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_OICW")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "OICW"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 220

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_oicw.mdl"
SWEP.WorldModel				= "models/weapons/w_oicw.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_OICW.Single")
SWEP.Primary.Cone			= 0.001
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 1/(600/60)
SWEP.Primary.Ammo			= "bb_556mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.MaxHeat				= 4

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 4
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasSpecialFire			= true

SWEP.CanShootWhileSprinting = false

SWEP.ColorOverlay			= Color(0,255,0,20)
SWEP.ShootOffsetStrength	= Angle(0.5,0.5,0)

SWEP.DamageFalloff			= 4000

SWEP.BurstOverride			= 3
SWEP.BurstConeMul			= 2
SWEP.BurstSpeedOverride 	= 2
SWEP.BurstRecoilMul			= 0.5
SWEP.BurstHeatMul			= 0.5
SWEP.BurstCoolMul			= 0.75

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false

SWEP.IronSightTime			= 0.5
SWEP.ZoomDelay				= 0.25

SWEP.IronSightsPos 			= Vector(-10, -10, 3)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(-5,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos = Vector(0.602, -10.252, -2.613)
SWEP.IronMeleeAng = Vector(-7.739, 33.064, -41.508)

function SWEP:SpecialConePre(Cone,IsCrosshair)
	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		Cone = Cone*0.1
	end
	return Cone
end

SWEP.SpecialAmmo			= {"bb_556mm","bb_762mm"}

function SWEP:SpecialGiveAmmo()
	--self.Owner:GiveAmmo(30,"bb_762mm",false)
end

function SWEP:HandleShootAnimations()
	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
	else
		self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	end
end

function SWEP:SpecialDamage(damage)
	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		damage = 85
	end
	return damage
end

function SWEP:SpecialFalloff(falloff)
	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		falloff = 8000
	end
	return falloff
end

function SWEP:SpecialRecoil(recoil)
	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		recoil = recoil * 4
	end
	return recoil
end

function SWEP:SpecialDelay(delay)

	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") then
		delay = 0.4
	end

	return delay
	
end

function SWEP:SpareThink()

	if self:GetPrimaryAmmo() == game.GetAmmoID("bb_762mm") and self:GetIsBurst() then
		self:SetIsBurst( false )
	end

end


