ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Can"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
	
		self:SetModel("models/props_junk/PopCan01a.mdl") 
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			phys:SetMass(1)
			phys:Wake()
			phys:SetVelocity( self:GetUp()*3000 )
		end
		
		print(self.Owner)
		
		SafeRemoveEntityDelayed(self,60)
		
	end
end


function ENT:PhysicsCollide( data, collider )

	local Victim = data.HitEntity
	local Speed = data.Speed
	
	if Speed > 30 and (Victim:IsPlayer() or Victim:IsNPC()) then
		Victim:TakeDamage( Speed, self.Owner, self )
	end

end


function ENT:Think()

end

function ENT:Draw()
	self:DrawModel(true)
end