if CLIENT then
	killicon.Add( "ent_smod_beans", "vgui/killicons/smod_SoyBeans", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_SoyBeans")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "SOY BEANS"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_mamehands.mdl"
SWEP.WorldModel				= "models/weapons/w_mamehands.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "slam"
SWEP.UseHands				= false

game.AddAmmoType({name = "smod_beans"})

if CLIENT then 
	language.Add("smod_beans_ammo","Handfuls of Soy Beans")
end


SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 10
SWEP.Primary.Sound			= Sound("weapons/iceaxe/iceaxe_swing1.wav")
SWEP.Primary.Cone			= 0.1
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 3
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "smod_beans"
SWEP.Primary.Automatic 		= true

SWEP.EnableTracers			= false

SWEP.RecoilMul 				= -0.1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 1
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

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 1
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 100


function SWEP:PrimaryAttack()
	
	if not self:CanPrimaryAttack() then	return end
	if not self:CanShoot() then return end
	self:TakePrimaryAmmo(1)

	self:WeaponDelay() -- don't predict, has delay
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if (IsFirstTimePredicted() or game.SinglePlayer()) then

		timer.Simple(0.4, function()
		
			if self:IsValid() and self.Owner:IsValid() and self.Owner:Alive() then
		
				if self:Ammo1() == 0 then
					self:EmitGunSound("bill/POCKET SAND.wav")
				else
					self:WeaponSound()
				end
			
				if SERVER then
				
					local Count = 10
				
					local Mul = math.rad(360)/Count
					
					for i=1, Count do

						local Shoot = self.Owner:GetShootPos()
						local Eye= self.Owner:EyeAngles()
						local ShootEdit = Shoot + Eye:Up()*math.sin(Mul*i)*5 + Eye:Right()*math.cos(Mul*i)*2.5 + Eye:Right()*3

						self:ShootBean(ShootEdit, Eye + Angle(0,math.Rand(-1,1),0) )
						
					end
				end
			
			
			
			
			
				if (CLIENT or game.SinglePlayer()) then 
					self:AddRecoil() -- Predict
				end
				
			end
		end)
		
	end

end

function SWEP:ShootBean(ShootPos,ShootAng)

	local ent = ents.Create("ent_smod_beans")
	ent:SetPos(ShootPos)
	ent:SetAngles(ShootAng)
	ent.FakeOwner = self.Owner
	ent:Spawn()
	
	local phys = ent:GetPhysicsObject();
	if IsValid(phys) then
		phys:ApplyForceCenter(ShootAng:Forward()*400 + self.Owner:GetVelocity())
	end
	
end



