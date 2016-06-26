if CLIENT then
	killicon.Add( "weapon_smod_tripmine", "vgui/killicons/smod_motionsensor", Color( 255, 255, 255, 255 ) )
	killicon.Add( "ent_smod_tripmine", "vgui/killicons/smod_motionsensor", Color( 255, 255, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_motionsensor")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "TRIPMINE"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Throwable"

SWEP.Cost					= 300
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_msbomb.mdl"
SWEP.WorldModel				= "models/weapons/w_msbomb.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "grenade"
SWEP.UseHands				= false

game.AddAmmoType({name = "smod_tripmine"})

if CLIENT then 
	language.Add("smod_tripmine_ammo","Tripmine")
end

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ak47/ak47-1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 1
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "smod_tripmine"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.IsThrowing 			= false
SWEP.HasAnimated			= false
SWEP.HasThrown				= false
SWEP.CanHolster				= true
SWEP.Object					= "ent_smod_tripmine"

SWEP.HasPreThrow			= false

function SWEP:ThrowObject(object,force)

	force = 400

	if (CLIENT) then return end
	local EA =  self.Owner:EyeAngles()
	local pos = self.Owner:GetShootPos() + EA:Right() * 5 - EA:Up() * 4 + EA:Forward() * 8	

	local ent = ents.Create(object)		
	ent:SetPos(pos)
	ent:SetAngles(EA)
	ent.FakeOwner = self.Owner
	ent:Spawn()
	ent:Activate()
	ent:Fire()
	--ent:SetOwner(self.Owner)
	
	
	if ent:GetPhysicsObject():IsValid() then
		if object == "ent_cs_gasparticle" then
			ent:GetPhysicsObject():SetVelocity( EA:Forward()*force + EA:Right()*math.random(-20,20) + EA:Up()*math.random(-20,20) + Vector(0,0,-10) )
		else
			ent:GetPhysicsObject():SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force + EA:Up()*50)
		end
	else
		ent:SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force)
	end
	
	ent.Damage = 100
	ent.Radius = 100
	
end