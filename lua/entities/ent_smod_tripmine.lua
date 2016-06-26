ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "TRIPMINE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.BounceSound = Sound("AlyxEMP.Charge")
ENT.ExplodeSound = Sound("AlyxEMP.Discharge")
ENT.DebrisSound = Sound("BaseGrenade.Explode")

ENT.Range = 200

AddCSLuaFile()

function ENT:Initialize()

	if SERVER then
		self:SetModel("models/weapons/w_msbomb.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(CONTINUOUS_USE)
		self.Hit = false
		
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
		end
		
		self:SetLagCompensated( true )
		
		self.OldHitPos = nil
		
	else
	
		self:SetRenderBounds( Vector(-self.Range,-self.Range,-self.Range), Vector(self.Range,self.Range,self.Range), Vector(self.Range/2,0,0) )
	
	end
	
	self.Detonated = false
	
end

function ENT:OnTakeDamage(damage)
	self:Detonate(self:GetPos())
end


function ENT:PhysicsCollide(data, physobj)
	
	if self.Hit then return end

	if data.HitEntity:GetClass() == "worldspawn" or data.HitEntity:GetPhysicsObject():IsValid() or data.HitEntity:GetClass() == "player" then 
		if data.HitEntity:GetClass() == self:GetClass() then return end
	
		self.HitP = data.HitPos
		self.HitN = data.HitNormal
		
		self.armTime = CurTime() + 1
		self.soundVar = 0
	
		self.Hit = true
		physobj:SetAngles(self.HitN:Angle()+Angle(180,0,0))
		self:EmitSound("weapons/tripwire/hook.wav")

		if data.HitEntity:GetClass() == "worldspawn" then
			physobj:SetPos(self.HitP)
	
		elseif data.HitEntity:GetClass() == "prop_physics" then
			physobj:SetPos(self.HitP)
			
			timer.Simple(0.1,function()
				--self:SetParent(data.HitEntity)
				if data.HitEntity == nil then return end
				if data.HitEntity:IsValid() == false then return end
				constraint.Weld(self,data.HitEntity,0,0,0,true)
				self.Welded = 1
			end)

			timer.Create("CheckValid"..self:EntIndex(), 0, 0, function()
				if data.HitEntity:IsValid() == false then
					timer.Destroy("CheckValid"..self:EntIndex()) 
				return end
				
				if data.HitEntity:Health() < 0 then 
					--physobj:SetParent(nil) 
					physobj:SetSolid( SOLID_VPHYSICS )
				end
			end)
			
	
		else
			physobj:SetPos(self.HitP+self.HitN*6)
			
			timer.Simple(0.1,function()
				if data.HitEntity:IsValid() == false then return end
				self:SetPos(data.HitPos)
				self:SetParent(data.HitEntity)
				self.Parented = 1
				self.HitEntity = data.HitEntity
			end)
			
			
			timer.Create("CheckValid"..self:EntIndex(), 0, 0, function()
				if data.HitEntity == nil then
					timer.Destroy("CheckValid"..self:EntIndex()) 
					return 
				
				elseif data.HitEntity:IsValid() == false then
					timer.Destroy("CheckValid"..self:EntIndex()) 
					return
				
				elseif data.HitEntity:IsPlayer() and not data.HitEntity:Alive() then
					if self:IsValid() then
						self:Detonate(self,self.HitEntity:GetPos())
						timer.Destroy("CheckValid"..self:EntIndex()) 
					end
				end
				
				
			end)

		end
		
		physobj:EnableMotion(false)
		
		timer.Simple(0.1,function()
			if data.HitEntity:GetClass() ~= "worldspawn" then
				physobj:EnableMotion(true)
			end
		end)
	
	end

end

function ENT:Think()

	if SERVER then
		if not self.FakeOwner:IsValid() then self:Remove() return end
		
		if not self.Hit then return end

		if CurTime() >= self.armTime then
		
			if self.soundVar == 0 then
				self:EmitSound("weapons/tripwire/mine_activate.wav")
				self.soundVar = 1
				self:SetNWBool("IsActivated",true)
			end
			
			local StartPos = self:GetPos()
			local EndPos = self:GetPos() + self:GetForward()*self.Range
			
			local Trace = util.TraceLine( {
				start = StartPos,
				endpos = EndPos,
				filter = self
			} )
			
			local HitPos = Trace.HitPos

			if self.OldHitPos ~= HitPos then
				if self.OldHitPos == nil then
					self.OldHitPos = HitPos
				else
					if Trace.Hit then
						self:Detonate(self:GetPos())
					else
						self.OldHitPos = HitPos
					end
				end
			end

		else 
			return 
		end
		
		self:NextThink( CurTime() )
		return true
		
	end

end

function ENT:Detonate(pos)

	if self.Detonated then return end
	
	self.Detonated = true

	if not self:IsValid() then return end
	local effectdata = EffectData()
		effectdata:SetStart( pos ) // not sure if we need a start and origin (endpoint) for this effect, but whatever
		effectdata:SetOrigin( pos )
		effectdata:SetScale( 1 )
	util.Effect( "Explosion", effectdata )	
	util.BlastDamage(self, self.FakeOwner, pos, self.Range, 75)
	
	self.Pos1 = self.HitP + self.HitN
	self.Pos2 = self.HitP - self.HitN
	util.Decal("Scorch", self.Pos1, self.Pos2)
			
	SafeRemoveEntity(self)
	
end

local Beam = Material("trails/laser")

function ENT:Draw()
	if CLIENT then
		self:DrawModel()
		
		if self:GetNWBool("IsActivated",false) then
		
			local StartPos = self:GetPos()
			local EndPos = self:GetPos() + self:GetForward()*self.Range
			
			local Trace = util.TraceLine( {
				start = StartPos,
				endpos = EndPos,
				filter = self,
			} )

			render.SetMaterial(Beam)
			render.DrawBeam(StartPos,EndPos,2,0,1,Color(0,0,255,255))
			
		end
		
	end
end

