ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "SMOKE PARTICLE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 
ENT.RenderGroup = RENDERGROUP_BOTH

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
	
		local size = 1
		self:SetModel("models/Items/AR2_Grenade.mdl") 
		self:PhysicsInitSphere( size, "wood" )
		self:SetCollisionBounds( Vector( -size, -size, -size ), Vector( size, size, size ) )
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			phys:EnableGravity(false)
			phys:EnableDrag(true)
			phys:SetMass(1)
		end
		
		SafeRemoveEntityDelayed(self,20)
		
	end
	
	self.SpawnTime = CurTime()
	
end

local mat1 = Material( "particle/particle_smokegrenade" )

function ENT:Draw()
	if CLIENT then
		--self:DrawModel()
		self:DrawShadow(false)
	end
end

function ENT:DrawTranslucent()
	if CLIENT then
	
		local bonus = CurTime() - self.SpawnTime
		
		local r = 100
		local g = 100
		local b = 100
		local a = 255 - (bonus)*0.5*25.5
		
		cam.Start3D(EyePos(),EyeAngles()) -- Start the 3D function so we can draw onto the screen.
			render.SetMaterial( mat1 ) -- Tell render what material we want, in this case the flash from the gravgun
			render.DrawSprite( self:GetPos(), 2 + bonus*10, 2 + bonus*10, Color(r,g,b,a)) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
		cam.End3D()
		
	end
end