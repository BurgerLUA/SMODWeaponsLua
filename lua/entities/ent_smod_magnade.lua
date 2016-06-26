ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "MAG NADE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.BounceSound = Sound("AlyxEMP.Charge")
ENT.ExplodeSound = Sound("AlyxEMP.Discharge")
ENT.DebrisSound = Sound("BaseGrenade.Explode")

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/weapons/w_gravball.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			phys:SetMass(50)
		end
		
		self.Delay = CurTime() + 2
		self.HasJumped = false
		self.HasDetonated = false
		self.ForceMul = 0
		
	end
	
	if CLIENT then
		self.ClientSize = 0
	end
	
end

function ENT:PhysicsCollide(data, physobj)

	if SERVER then
	
		if self:GetVelocity():Length() > 50 then
		
			self:EmitSound(self.BounceSound)
			
			if self:GetVelocity():Length() > 100 then
				if data.HitEntity and data.HitEntity:Health() then

					local dmginfo = DamageInfo()
					
					dmginfo:SetDamage(10)
					dmginfo:SetAttacker(self.Owner or self)
					dmginfo:SetInflictor(self)
					dmginfo:SetDamageType(DMG_CRUSH)
				
					data.HitEntity:TakeDamageInfo(dmginfo)
					
				end
			end

		end

	end
	
end

sound.Add( {
	name = "magnade.loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {125,125},
	sound = "ambient/energy/force_field_loop1.wav"
} )

function ENT:Think()

	if SERVER then
		if (CurTime() > self.Delay) and not self.HasDetonated then 
			self:GetPhysicsObject():SetVelocity(Vector(0,0,0))
			self:GetPhysicsObject():EnableMotion(false)
			self.HasDetonated = true		
			self:SetNWBool("Detonated",true)
			self:EmitSound(Sound("magnade.loop"))
		elseif (CurTime() > self.Delay + 6) and self.HasDetonated then
			self:Detonate(self:GetPos())
			self:StopSound(Sound("magnade.loop"))
			SafeRemoveEntity(self)	
		elseif (CurTime() > self.Delay) and self.HasDetonated then
			
			local Objects = ents.FindInSphere(self:GetPos(),500)

			for k,v in pairs(Objects) do
				if v ~= self and not v:IsWorld() and v:IsLineOfSightClear(self) then
				
					local Force = (self:GetPos() - v:GetPos())
					Force:GetNormalized()
					
					local DistanceMul = ( (500 - self:GetPos():Distance(v:GetPos()))/500 ) ^ 1.5
					
					local TotalForce = Force*10*DistanceMul*1.5
					
					if v:IsPlayer() then

						local ForceMul = 1
					
						if v:IsOnGround() then
							ForceMul = 4
						end
						
						v:SetVelocity(v:GetVelocity() + (TotalForce*ForceMul)/10)
							
					elseif v:GetPhysicsObject() and v:GetPhysicsObject():IsValid() then
						v:GetPhysicsObject():ApplyForceCenter(TotalForce)
					end
					
				end
			end

		elseif (CurTime() > self.Delay - 1) then
			self:GetPhysicsObject():SetVelocity(self:GetVelocity()/2 + Vector(0,0,100))
		end
		
	end
end

function ENT:Detonate(pos)
	if SERVER then
		if not self:IsValid() then return end
		
		local effectdata = EffectData()
			effectdata:SetStart( pos + Vector(0,0,100)) // not sure if we need a start and origin (endpoint) for this effect, but whatever
			effectdata:SetOrigin( pos)
			effectdata:SetScale( 100 )
			effectdata:SetRadius( 5000 )
		util.Effect( "AR2Explosion", effectdata)

		if self.Owner then
			util.BlastDamage(self, self.Owner, pos, 500, 100  )
		end
		
		self:EmitSound(self.ExplodeSound)
		
		if IsValid(self.HitP) then
			self.Pos1 = self.HitP + self.HitN
			self.Pos2 = self.HitP - self.HitN
			util.Decal("Scorch", self.Pos1, self.Pos2)
		end
				
		self:Remove()
	end
end


local Mat = Material("particle/warp2_warp")

function ENT:Draw()
	if CLIENT then
		self:DrawModel()

		if self:GetNWBool("Detonated",false) then
			cam.Start3D(EyePos(),EyeAngles())
				render.SetMaterial( Mat )
				render.DrawSprite( self:GetPos(), 64*2, 64*2, Color(255,255,255,255))
			cam.End3D()
		end

	end
end



