if CLIENT then
	killicon.Add( "ent_smod_beans", "vgui/killicons/smod_SoyBeans", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_SoyBeans")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "BEAN GUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_grease.mdl"
SWEP.WorldModel				= "models/weapons/w_grease.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "slam"
SWEP.UseHands				= false

game.AddAmmoType({name = "smod_beans2"})

if CLIENT then 
	language.Add("smod_beans2_ammo","Spicy Beans")
end


SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/grease/greasegun_shoot.wav")
SWEP.Primary.Cone			= 0.04
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 30
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "smod_beans2"
SWEP.Primary.Automatic 		= true

SWEP.EnableTracers			= false

SWEP.RecoilMul 				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 0
SWEP.HeatMul				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount				= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDual				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-5, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 100


function SWEP:PrimaryAttack()
	
	if not self:CanPrimaryAttack() then	return end
	if not self:CanShoot() then return end
	self:TakePrimaryAmmo(1)

	self:WeaponSound()
	self:WeaponDelay() -- don't predict, has delay
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if (IsFirstTimePredicted() or game.SinglePlayer()) then
			
		if SERVER then
			local Shoot = self.Owner:GetShootPos()
			local Eye= self.Owner:EyeAngles()
			self:ShootSpicyBean(Shoot, Eye + AngleRand()*0.01 )
		end

		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

	end

end

function SWEP:ShootSpicyBean(ShootPos,ShootAng)

	local ent = ents.Create("ent_smod_beans")
	ent:SetPos(ShootPos)
	ent:SetAngles(ShootAng + AngleRand())
	ent.FakeOwner = self.Owner
	ent:Spawn()
	
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then
		phys:ApplyForceCenter(ShootAng:Forward()*1000 + self.Owner:GetVelocity())
	end
	
end



