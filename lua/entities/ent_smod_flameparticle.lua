ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "FLAME"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 
ENT.RenderGroup = RENDERGROUP_BOTH

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
	
		local size = 10
		self:SetModel("models/Items/AR2_Grenade.mdl") 
		self:PhysicsInitSphere( size, "wood" )
		self:SetCollisionBounds( Vector( -size, -size, -size ), Vector( size, size, size ) )
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			phys:EnableGravity(true)
			phys:EnableDrag(true)
			phys:SetMass(1)
		end
		
		SafeRemoveEntityDelayed(self,60)
		
		self.ParticleCount = 0
		
	end
	
	self.SpawnTime = CurTime()
	
	if CLIENT then
		self.RandomSeed = math.random(0,1000)
	end
	
end


function ENT:Think()

	if CLIENT then return end

	if self.SpawnTime + 1 <= CurTime() then
	
		local Players = player.GetAll()
		
		for k,v in pairs(Players) do
			if v:GetPos():Distance(self:GetPos()) <= 100 - (CurTime() - self.SpawnTime) then
				
				local DamageValue = 10 - 10*( (CurTime() - self.SpawnTime)/60)
				
				if v:Health() <= DamageValue then
					local Damage = DamageInfo()
					Damage:SetDamage(DamageValue)
					Damage:SetAttacker(self.Owner)
					Damage:SetInflictor(self)
					Damage:SetDamageType(DMG_BURN)
					
					v:TakeDamageInfo(Damage)
				else
					v:SetHealth(v:Health() - DamageValue)
				end
				
			end
		end
		
		--[[
		if self.ParticleCount < 20 and math.random(1,10) == 1 then
			local ent = ents.Create("ent_smod_smokeparticle")
			ent:SetPos(self:GetPos())
			ent:SetAngles(Angle(0,0,0))
			ent:Spawn()
			ent:Activate()
			ent:SetOwner(self.Owner)
			ent:GetPhysicsObject():SetVelocity(Vector(math.Rand(-5,5),math.Rand(-5,5),math.Rand(0,25)))
			self.ParticleCount = self.ParticleCount + 1
		end
		--]]
		
	end
	
	self:NextThink(CurTime() + 1)
	
	return true
	
end

function ENT:PhysicsCollide(colData, PhysObj)

	local MyPhys = self:GetPhysicsObject()
	
	if colData.HitEntity and colData.HitEntity:IsPlayer() then
		local Damage = DamageInfo()
		Damage:SetDamage(25)
		Damage:SetAttacker(self.Owner)
		Damage:SetInflictor(self)
		Damage:SetDamageType(DMG_BURN)
		colData.HitEntity:TakeDamageInfo(Damage)
		SafeRemoveEntity(self)
	elseif MyPhys:IsMotionEnabled() then
		MyPhys:EnableMotion(false)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	end

end


function ENT:Draw()
	if CLIENT then
		self:DrawShadow(false)
	end
end

function ENT:DrawTranslucent()
	if CLIENT then
	
		local Bonus = CurTime() - self.SpawnTime
		
		local r = 255
		local g = 255
		local b = 255
		local a = 255
		
		local Time = math.ceil( ((math.sin( (CurTime() + self.RandomSeed)*20) + 1)/2)*5 )
		
		cam.Start3D(EyePos(),EyeAngles())
			render.SetMaterial( Material("sprites/flamelet" .. Time ) )
			render.DrawSprite( self:GetPos() - Vector(0,0,Bonus*0.25), 32 + Time*3, 16 + 64 - Bonus, Color(r,g,b,a))
		cam.End3D()
	end
end