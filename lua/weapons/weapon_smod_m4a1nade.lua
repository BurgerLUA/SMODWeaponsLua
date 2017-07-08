if CLIENT then
	killicon.Add( "weapon_ex_combinesniper", "vgui/killicons/ew2_combinesniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_combinesniper")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "M4A1 + M203"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.CSSMoveSpeed			= 221

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_m4a1m203.mdl"
SWEP.WorldModel				= "models/weapons/w_m4a1m203.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 33
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/havoc-ak/fire.wav")
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.WorldModel1			= "models/weapons/w_m4a1m203.mdl"
SWEP.WorldModel2 			= "models/weapons/w_m4a1m203.mdl"

SWEP.Secondary.Sound		= Sound("weapons/m4a1/m4a1-1.wav")
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.SpareClip	= 3

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 1.5
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 5

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 3
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= true 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasFirstShotAccurate	= true

SWEP.CanShootWhileSprinting = false
SWEP.DamageFalloff			= 3000

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.ZoomTime				= 0.25
SWEP.ZoomDelay				= 0.25

SWEP.IronSightsPos 			= Vector(3.039, 0, 0.479)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos 			= Vector(0, 0, -1)
SWEP.IronRunAng 			= Vector(0, -20, 0)

SWEP.IronMeleePos 			= Vector(0, -1.609, -0.202)
SWEP.IronMeleeAng 			= Vector(-5.628, -35.879, -52.061)

SWEP.CustomScope			= Material("sprites/light_ignorez")
SWEP.CustomScopeSOverride	= 32
SWEP.CustomScopeCOverride	= Color(255,0,0,255)

SWEP.UseMuzzle = true

function SWEP:SpecialConePre(Cone,IsCrosshair)
	if self:GetZoomed() then
		return 0
	else
		return Cone*2
	end
end

function SWEP:SpecialRecoil(recoil)
	if self:GetZoomed() then
		return recoil*2
	else
		return recoil*0.5
	end
end

function SWEP:SpecialHeatMath(CoolDown)

	if self:GetZoomed() then
		return CoolDown*0.25
	else
		return CoolDown
	end

	return CoolDown
end


function SWEP:CanQuickThrow()
	return false
end

function SWEP:QuickThrowOverride()

	--if self:GetNextPrimaryFire() > CurTime() then return end
	if self:GetNextSecondaryFire() > CurTime() then return end
	if self:IsBusy() then return end
	if !self:HasSecondaryAmmoToFire() then return end
	
	self:TakeSecondaryAmmo(1)

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)

	if (IsFirstTimePredicted() or game.SinglePlayer()) then
		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

		self:ShootProjectile(50, 1, 0, self.Owner:GetShootPos(), self.Owner:GetAimVector(),true)
		
		self:EmitGunSound("weapons/ar2/ar2_altfire.wav")
	end
	
	self:SetNextPrimaryFire(CurTime() + 0.5)
	self:SetNextSecondaryFire(CurTime() + 1)
	
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