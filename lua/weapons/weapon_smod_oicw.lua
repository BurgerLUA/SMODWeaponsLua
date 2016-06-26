if CLIENT then
	killicon.Add( "weapon_smod_oicw", "vgui/killicons/smod_OICW", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_OICW")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "OICW"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2500
SWEP.MoveSpeed				= 221

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_oicw.mdl"
SWEP.WorldModel				= "models/weapons/w_oicw.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_OICW.Single")
SWEP.Primary.Cone			= 0.0075
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 1/(800/60)
SWEP.Primary.Ammo			= "css_556mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 0.5

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 4
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

SWEP.BurstOverride			= 3
SWEP.BurstConeMul			= 1
SWEP.BurstSpeedOverride 	= 1
SWEP.BurstRecoilMul			= 0.5
SWEP.BurstHeatMul			= 0.5

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(-10, 0, -10)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.ColorOverlay			= Color(0,255,0,20)

SWEP.DamageFalloff			= 4000

function SWEP:SpecialFire()

	if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	
	--if not self:CanShoot() then return end
	
	if self:Clip1() < 10 then return end
	self:TakePrimaryAmmo(10)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)

	if (IsFirstTimePredicted() or game.SinglePlayer()) then
		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

		local Damage = self.Primary.Damage*10
		local Shots = 1
		local Cone = self:HandleCone(0)
		local Source = self.Owner:GetShootPos()
		local Direction = self.Owner:GetAimVector()
		
		if self.Owner:IsPlayer() then
			Direction = (self.Owner:EyeAngles() + self.Owner:GetPunchAngle()):Forward()
		end
		
		self:EmitGunSound("beta/fire1.wav")
		
		self:ShootBullet(Damage*0.5,Shots,Cone,Source,Direction,self.EnableTracer)
		self:AddHeat(Damage,Shots)
	end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay*10*2)
	
end