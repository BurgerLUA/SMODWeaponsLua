if CLIENT then
	killicon.Add( "ent_smod_flameparticle",		"vgui/killicons/smod_flamethrower",	Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_flamethrower")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "FLAMETHROWER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2000
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_flamethrower.mdl"
SWEP.WorldModel				= "models/weapons/w_flamethrower.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "crossbow"

game.AddAmmoType({name = "ex_gas"})

if CLIENT then 
	language.Add("ex_gas_ammo","Gas")
end

SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/flamethrower/fire.wav")
SWEP.Primary.Cone			= .0025
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 50
SWEP.Primary.Delay			= 0.2
SWEP.Primary.Ammo			= "ex_gas"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.VelConeMul				= 1.25
SWEP.HeatMul				= 0.5

SWEP.BurstConeMul			= 0.5
SWEP.BurstRecoilMul			= 0.5

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.25
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false

SWEP.Object					= "ent_smod_flameparticle"

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-6.43, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000

function SWEP:PrimaryAttack()

	if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	if self.Owner:GetAmmoCount(self.Primary.Ammo) < 1 then return end
	self:TakePrimaryAmmo(1)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)

	if (IsFirstTimePredicted() or game.SinglePlayer()) then
		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

		self:ThrowObject(self.Object,1000)
		
		self:EmitGunSound(self.Primary.Sound)
	end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	
end


function SWEP:ThrowObject(object,force)

	if (CLIENT) then return end
	local EA =  self.Owner:EyeAngles() + AngleRand()*0.01
	local pos = self.Owner:GetShootPos() + EA:Right() * 10 - EA:Up() * 15 + EA:Forward() * 10	

	local ent = ents.Create(object)		
	ent:SetPos(pos)
	ent:SetAngles(EA)
	ent:Spawn()
	ent:Activate()
	ent:Fire()
	ent:SetOwner(self.Owner)
	
	if ent:GetPhysicsObject():IsValid() then
		if object == "ent_cs_gasparticle" then
			ent:GetPhysicsObject():SetVelocity( EA:Forward()*force + EA:Right()*math.random(-20,20) + EA:Up()*math.random(-20,20) + Vector(0,0,-10) )
		else
			ent:GetPhysicsObject():SetVelocity(EA:Forward() * force + EA:Up()*50)
		end
	else
		ent:SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force)
	end
	
	ent.Damage = 100
	ent.Radius = 100
	
end
