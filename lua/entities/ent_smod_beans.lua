ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "SMOD Bean"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
	
		self:SetModel("models/misc/setubun/soybean.mdl") 
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		SafeRemoveEntityDelayed(self,60)
		
	end
end

function ENT:PhysicsCollide( data, collider )

	local Victim = data.HitEntity
	local Speed = data.Speed
	
	if Victim:IsPlayer() or Victim:IsNPC() then
		Victim:TakeDamage( 10, self.FakeOwner, self )
		SafeRemoveEntity(self)	
	elseif Speed > 30 then
		self:EmitSound("weapons/mamehand/soy.wav")
	end

end

function ENT:Think()

end

function ENT:Draw()
	self:DrawModel(true)
end