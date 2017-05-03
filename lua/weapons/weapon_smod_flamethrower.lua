if CLIENT then
	killicon.Add( "ent_smod_flameparticle",		"vgui/killicons/smod_flamethrower",	Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_flamethrower")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "FLAMETHROWER"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2000
SWEP.CSSMoveSpeed			= 200

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
SWEP.Primary.Sound			= nil
SWEP.Primary.Cone			= .0025
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 500
SWEP.Primary.Delay			= ( 1/(600/60) )
SWEP.Primary.Ammo			= "ex_gas"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.MoveConeMul				= 1.25
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

SWEP.DamageFalloff			= 1000

SWEP.CanShootWhileSprinting = false

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 1

SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos 			= Vector(-0.805, -12.865, -8.844)
SWEP.IronMeleeAng 			= Vector(0, 70, -70)

--[[
1:
		act	=	181
		actname	=	ACT_VM_PRIMARYATTACK
		id	=	1
2:
		act	=	206
		actname	=	ACT_VM_RECOIL1
		id	=	2
3:
		act	=	207
		actname	=	ACT_VM_RECOIL2
		id	=	3
4:
		act	=	208
		actname	=	ACT_VM_RECOIL3
		id	=	4
5:
		act	=	182
		actname	=	ACT_VM_SECONDARYATTACK
		id	=	5
6:
		act	=	183
		actname	=	ACT_VM_RELOAD
		id	=	6
7:
		act	=	172
		actname	=	ACT_VM_DRAW
		id	=	7
8:
		act	=	173
		actname	=	ACT_VM_HOLSTER
		id	=	8
9:
		act	=	205
		actname	=	ACT_VM_LOWERED_TO_IDLE
		id	=	9
10:
		act	=	203
		actname	=	ACT_VM_IDLE_TO_LOWERED
		id	=	10
11:
		act	=	204
		actname	=	ACT_VM_IDLE_LOWERED
		id	=	11
12:
		act	=	175
		actname	=	ACT_VM_FIDGET
		id	=	12
13:
		act	=	-1
		actname	=	
		id	=	13
--------------------
0	=	IR_idle
1	=	IR_fire
2	=	fire2
3	=	fire3
4	=	fire4
5	=	IR_fire2
6	=	IR_reload
7	=	IR_draw
8	=	IR_holster
9	=	idletolow
10	=	lowtoidle
11	=	lowidle
12	=	shake
13	=	VentPoses

--]]


function SWEP:Reload()
	--self:GetActivities()
end

function SWEP:PrimaryAttack()

	if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	if self.Owner:GetAmmoCount(self.Primary.Ammo) < 1 then return end
	
	if self:GetSpecialFloat() < 3 then
		self:TakePrimaryAmmo(1)
	end

	self:SetSpecialFloat( math.Clamp(self:GetSpecialFloat() + 1,0,3) )
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay*0.5)
	
end

local NextThink = 0

local ShootSound = Sound("weapons/flamethrower/fire.wav")

function SWEP:SpareThink()

	if NextThink <= CurTime() then
	
		if self:GetSpecialFloat() > 0 then
		
			if not self.Special_CustomLoopingSound then
				self.Special_CustomLoopingSound = CreateSound( self, "weapons/flamethrower/fireloop.wav" )
				self.Special_CustomLoopingSound:Play()
				self:EmitGunSound(ShootSound)
			end
		
		
			self:ShootGun()
			self:SetSpecialFloat(self:GetSpecialFloat() - 1)
		else
			if self.Special_CustomLoopingSound then
				self.Special_CustomLoopingSound:Stop()
				self.Special_CustomLoopingSound = nil
				self:EmitGunSound(ShootSound)
			end
		end
		
		
		
		
		
		NextThink = CurTime() + self.Primary.Delay
	end

end


SWEP.UseSpecialProjectile	= true
SWEP.SourceOverride = Vector(3,0,-5)

local Material1 = Material("sprites/flamelet1")
local Material2 = Material("sprites/flamelet2")
local Material3 = Material("sprites/flamelet3")
local Material4 = Material("sprites/flamelet4")
local Material5 = Material("sprites/flamelet5")

function SWEP:WeaponAnimation(animation,clipsize)

end

function SWEP:ModProjectileTable(datatable)

	local Decay = 1
	local SizeIncrease = 5

	datatable.direction = datatable.direction*500
	datatable.hullsize = 1
	datatable.resistance = datatable.direction*0.5
	datatable.dietime = CurTime() + Decay
	
	datatable.hullsize = 128
	
	datatable.drawfunction = function(datatable)
	
		if not datatable.customrandom then
			datatable.customrandom = math.random(1,1000)
			--print(datatable.customrandom)
		end
	
	
		local Timer = (math.floor( (CurTime() + datatable.customrandom)*20) % 4) + 1
		
		local SizeMul = ( 1 - (datatable.dietime - CurTime()) /  Decay  ) * SizeIncrease
		
		local DrawMaterail = nil
		
		if Timer == 1 then
			DrawMaterail = Material1
		elseif Timer == 2 then
			DrawMaterail = Material2
		elseif Timer == 3 then
			DrawMaterail = Material3
		elseif Timer == 4 then
			DrawMaterail = Material4
		elseif Timer == 5 then
			DrawMaterail = Material5
		end
		
		render.SetMaterial( DrawMaterail )
		render.DrawSprite( datatable.pos,4 + 16*SizeMul,4 + 16*SizeMul,Color(255,255,255,255) )

	end

	datatable.hitfunction = function(datatable,traceresult)
	
		local Victim = traceresult.Entity
		local Attacker = datatable.owner
		local Inflictor = datatable.weapon
		
		if not IsValid(Attacker) then
			Attacker = Victim
		end
		
		if not IsValid(Inflictor) then
			Inflictor = Attacker
		end
		
		if Victim and Victim ~= NULL then
			local DmgInfo = DamageInfo()
			DmgInfo:SetDamage( datatable.damage )
			DmgInfo:SetAttacker( Attacker )
			DmgInfo:SetInflictor( Inflictor )
			DmgInfo:SetDamageForce( datatable.direction:GetNormalized() )
			DmgInfo:SetDamagePosition( datatable.pos )
			DmgInfo:SetDamageType( DMG_BURN )
			traceresult.Entity:DispatchTraceAttack( DmgInfo, traceresult )
			
			if SERVER then
				if !Victim:IsOnFire() then
					Victim:Ignite(3,128)
				end
			end
			
		end
		

		
	end
	
	
	
	return datatable

end
