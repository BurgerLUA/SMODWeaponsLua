SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "PURPLE DRANK"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 0
SWEP.SlotPos				= 2

SWEP.ViewModel 				= "models/weapons/v_p_drink.mdl"
SWEP.WorldModel				= "models/weapons/w_p_drink.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "slam"

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/drink/open.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 0
SWEP.Primary.Delay			= 3
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.1
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
SWEP.HasDownRecoil			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-4, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000

function SWEP:PrimaryAttack()
	
	--if not self:CanPrimaryAttack() then	return end
	--if not self:CanShoot() then return end
	--self:TakePrimaryAmmo(1)

	self:WeaponDelay() -- don't predict, has delay
	
	self.MoveSpeed = 0
	
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if (IsFirstTimePredicted() or game.SinglePlayer()) then

		self:WeaponSound()
	
		timer.Simple(1, function()
		
			self.MoveSpeed = 250
		
			if self:IsValid() and self.Owner:IsValid() and self.Owner:Alive() and self.Owner:GetActiveWeapon() == self then
		
				self.Owner:SetHealth(math.Clamp(self.Owner:Health() + self.Primary.Damage,1,self.Owner:GetMaxHealth()))
				
				if (CLIENT or game.SinglePlayer()) then 
					self:AddRecoil() -- Predict
				end
				
				if SERVER then
					timer.Simple(0.25, function()
						if self:IsValid() and self.Owner:IsValid() and self.Owner:Alive() then
							self.Owner:StripWeapon(self:GetClass())
						end
					end)
				end
				
			end

		end)
		
	end
	
	

end