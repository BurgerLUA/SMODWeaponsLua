if CLIENT then
	killicon.Add( "weapon_ex_bishot", "vgui/killicons/ew2_bishot", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_bishot")
end

SWEP.Category				= "BurgerBase: Extras"
SWEP.PrintName				= "MP5k"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 221

SWEP.Description			= "AW SHEIT"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_mp5.mdl"
SWEP.WorldModel				= "models/weapons/w_mp5.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/mp5/mp5-1.wav")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 20
SWEP.Primary.SpareClip		= 20*8
SWEP.Primary.Delay			= 1/(900/60)
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.SpareClip	= 3

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 1.125
SWEP.MoveConeMul			= 0.5
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 3

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
SWEP.HasFirstShotAccurate	= true

SWEP.CanShootWhileSprinting = false
SWEP.DamageFalloff			= 3000

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.ZoomTime				= 0.5

SWEP.IronSightsPos 			= Vector(-6.64, 20, 1)
SWEP.IronSightsAng			= Vector(2.5, 0, 0)

SWEP.IronRunPos 			= Vector(0, -3, 0)
SWEP.IronRunAng 			= Vector(0, 45, 0)

SWEP.IronMeleePos 			= Vector(0, -1.609, -0.202)
SWEP.IronMeleeAng 			= Vector(-5.628, 35.879, -52.061)


function SWEP:CanQuickThrow()
	return false
end

SWEP.UseMuzzle = true

function SWEP:QuickThrowOverride()

	if self:GetNextPrimaryFire() > CurTime() then return end
	if self:GetNextSecondaryFire() > CurTime() then return end
	if self:IsBusy() then return end
	if !self:HasSecondaryAmmoToFire() then return end
	
	self:TakeSecondaryAmmo(1)

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)

	if (IsFirstTimePredicted() or game.SinglePlayer()) then
		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

		self:ShootProjectile(50, 1, 0, self.Owner:GetShootPos(), self.Owner:GetAimVector(),true)
		
		self:EmitGunSound("weapons/ar2/ar2_altfire.wav")
	end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay*10*2)
	
end

function SWEP:ModProjectileTable(datatable)

	datatable.direction = datatable.direction*800
	datatable.hullsize = 1
	datatable.resistance = datatable.direction*0.1 + Vector(0,0,200)
	datatable.dietime = CurTime() + 10
	datatable.id = "launched_grenade"
	
	datatable.hullsize = 1

	return datatable

end




