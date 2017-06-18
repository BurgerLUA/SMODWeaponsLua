if CLIENT then
	killicon.Add( "weapon_smod_katana", "vgui/killicons/smod_Sword", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_Sword")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Katana"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Melee"

SWEP.Cost					= 0
SWEP.CSSMoveSpeed			= 300

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 0
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_sword.mdl"
SWEP.WorldModel				= "models/weapons/w_sword.mdl"
SWEP.UseHands				= true
SWEP.VModelFlip 			= false
SWEP.HoldType				= "melee2"

game.AddAmmoType({name = "smod_weeb"})

if CLIENT then 
	language.Add("smod_weeb_ammo","Weeb")
end

SWEP.Primary.Damage			= 60
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 100
SWEP.Primary.SpareClip		= 0
SWEP.Primary.Cone			= 0.05
SWEP.Primary.Delay			= 1/5
SWEP.Primary.Ammo			= "smod_weeb"
SWEP.Primary.Automatic 		= false 

SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.SpareClip	= -1
SWEP.Secondary.Delay		= 1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic 	= false 

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.MeleeSoundMiss			= Sound("Weapon_SMODSword.Slash")
SWEP.MeleeSoundWallHit		= Sound("Weapon_SMODSword.HitWall")
SWEP.MeleeSoundFleshSmall	= Sound("Weapon_SMODSword.Hit")
SWEP.MeleeSoundFleshLarge	= Sound("Weapon_SMODSword.Stab")

SWEP.MoveConeMul			= 0

SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, -45)

SWEP.DamageFalloff			= 1000
SWEP.MeleeRange				= 50
SWEP.MeleeSize 				= 16
SWEP.EnableBlocking			= true
SWEP.MeleeDelay				= 0.1

SWEP.MeleeDamageType		= DMG_SLASH

SWEP.HeatMul				= 0

--[[

1:
		act	=	172
		actname	=	ACT_VM_DRAW
		id	=	1
2:
		act	=	197
		actname	=	ACT_VM_MISSCENTER
		id	=	2
3:
		act	=	197
		actname	=	ACT_VM_MISSCENTER
		id	=	3
4:
		act	=	191
		actname	=	ACT_VM_HITCENTER
		id	=	4
5:
		act	=	191
		actname	=	ACT_VM_HITCENTER
		id	=	5
6:
		act	=	191
		actname	=	ACT_VM_HITCENTER
		id	=	6
7:
		act	=	1911
		actname	=	ACT_VM_HITKILL
		id	=	7
--------------------
0	=	idle01
1	=	draw
2	=	misscenter1
3	=	misscenter2
4	=	hitcenter1
5	=	hitcenter2
6	=	hitcenter3
7	=	hitkill1

--]]

function SWEP:IsStanding()
	return self.Owner:IsOnGround() and self.Owner:WaterLevel() <= 1
end

function SWEP:PrimaryAttack()

	if self:IsUsing() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	if self.Owner:KeyDown(IN_ATTACK2) then return end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	local Damage = self:SpecialDamage(self.Primary.Damage)
	
	if not self:GetIsLeftFire() then
	
		if Damage >= 100 then
			self:SendSequence("misscenter1")
		else
			self:SendSequence("hitcenter1")
		end
		self:SetIsLeftFire(true)
		local SequenceDelay = self:GetDelay()
		self:SetNextPrimaryFire(CurTime() + SequenceDelay)
		self:SetNextSecondaryFire(CurTime() + SequenceDelay)
	else
		self:SendSequence("hitcenter2")
		--self.Owner:ViewPunch(Angle(0,-Damage*0.05,0))	
		self:SetIsLeftFire(false)
		local SequenceDelay = self:GetDelay()
		self:SetNextPrimaryFire(CurTime() + SequenceDelay)
		self:SetNextSecondaryFire(CurTime() + SequenceDelay)
	end

	
	
	local NewDamage = Damage
	
	if self:IsBalanced() then
		NewDamage = NewDamage * 2
	end
	
	self:NewSwing(NewDamage)
	
	if !self.Owner:IsOnGround() and self:GetPower() >= 100 then
	
		self.Owner:SetVelocity( -self:GetVelocity() + self.Owner:GetForward()*600 + Vector(0,0,50)	 )
		self.Owner:ViewPunch(Angle(5,0,0))
		self.Owner:SetGravity( 0.001 )
		
		timer.Simple(0.5,function()
			if self and self:IsValid() then
				local Owner = self.Owner
				
				if Owner and Owner:IsValid() then
					Owner:SetGravity(1)
				end
			end
		end)
		
		
		local Ents = player.GetAll()
		table.Add(Ents,ents.FindByClass("npc_*"))
	
		--PrintTable(Ents)
		
		for k,v in pairs(Ents) do
			if (v:IsPlayer() or v:IsNPC()) and v ~= self.Owner then
				if v:GetPos():Distance(self.Owner:GetPos()) <= 150 then
					local TraceData = {}
					TraceData.start = self.Owner:EyePos()
					TraceData.endpos = v:GetPos()+ v:OBBCenter() + (v:GetPos() + v:OBBCenter() - self.Owner:EyePos()):GetNormalized()*100
					TraceData.filter = self.Owner	
					local TraceResult = util.TraceLine( TraceData )
					
					self:NewSendHitEvent(v,Damage,TraceData,TraceResult)
				end
			end
		end
		
		self:SetNextPrimaryFire(CurTime() + 0.5)
		 
	end

	if IsFirstTimePredicted() then

		self.LastDamageTable[#self.LastDamageTable+1] = math.floor(self:GetPower())
		
		if #self.LastDamageTable > 3 then
			table.remove(self.LastDamageTable,1)
		end

	end
	
	

end

function SWEP:IsBalanced()
	local Highest = math.max(self.LastDamageTable[1],self.LastDamageTable[2],self.LastDamageTable[3], math.floor(self:GetPower()) )
	local Lowest = math.min(self.LastDamageTable[1],self.LastDamageTable[2],self.LastDamageTable[3])
	return Lowest ~= 0 and Highest ~= 100 and math.abs(Highest - Lowest) < 5
end

SWEP.LastDamageTable = {0,0,0}

function SWEP:GetPower()
	return math.Clamp(60 * (self:GetSpecialFloat()^0.3),0,110) - 10
end

function SWEP:SpecialDamage(damage)
	damage = damage * (self:GetPower()/100)
	return damage
end

function SWEP:SpecialConePost(Cone,IsCrosshair)

	if self:IsBalanced() then
		Cone = 0
	else
		Cone = Cone * ( (100 - self:SpecialDamage(self.Primary.Damage))/100 )
	end

	return Cone
	
end

function SWEP:PostSwing(HitEntity,Damage)
	self:SetSpecialFloat(0)
end

--[[
function SWEP:SpecialDelay(Delay)
	if self:GetIsLeftFire() then
		Delay = Delay * 0.75
	else
		Delay = Delay * 1.25
	end

	return Delay
end
--]]

function SWEP:Reload()

	if SERVER then
		if self:GetNextIdle() <= CurTime() then
			self.Owner:Say("I need healing.")
			self:SetNextIdle( CurTime() + 10)
		end
	end

end

function SWEP:SpareThink()

	local IsBlocking = ( self.Owner:KeyDown(IN_ATTACK2) ) or (self:GetSpecialFloat() < 0.25)

	local Add = FrameTime()
	
	if self.Owner:KeyDown(IN_ATTACK2) then
		Add = Add*-1
	elseif self.Owner:IsOnGround() then
		Add = Add*2
	end

	self:SetSpecialFloat( math.Clamp(self:GetSpecialFloat() + Add,0,8) )

	if self.Owner:IsOnGround() then
		self:SetSpecialInt(1)
	elseif not self:IsStanding() and self:GetSpecialInt() == 1 then
		self:SetSpecialInt(2)
	elseif self:GetSpecialInt() == 2 and self.Owner:KeyPressed(IN_JUMP) then
		local CurrentVelocity = self:GetVelocity()
		local NewVelocity = Vector(0,0,0)
		
		if self.Owner:KeyDown(IN_MOVERIGHT) then
			NewVelocity = NewVelocity + self.Owner:GetRight()*200
		elseif self.Owner:KeyDown(IN_MOVELEFT) then
			NewVelocity = NewVelocity + self.Owner:GetRight()*-200
		end

		if self.Owner:KeyDown(IN_FORWARD) then
			NewVelocity = NewVelocity + self.Owner:GetForward()*200
		elseif self.Owner:KeyDown(IN_BACK) then
			NewVelocity = NewVelocity + self.Owner:GetForward()*-200
		end
		self.Owner:SetVelocity(NewVelocity + Vector(0,0,400) - CurrentVelocity )
		self.Owner:ViewPunch(Angle(5,0,0))
		self:SetSpecialInt(0)
	end

	if self:GetNextPrimaryFire() + 1 <= CurTime() then
		if self:GetIsLeftFire() then
			self:SetIsLeftFire(false)
		end
	end

	if self:GetNextMelee() >= CurTime() and not IsBlocking then
		if self:GetPower() >= 100 then
			self.CSSMoveSpeed = 1200
		else
			self.CSSMoveSpeed = 600
		end	
	elseif IsBlocking then
	
		self.CSSMoveSpeed = 300*0.5
		self:SetHoldType("slam")
	else
		self.CSSMoveSpeed = 300
		self:SetHoldType(self.HoldType)
	end

end

function SWEP:SecondaryAttack()

end

function SWEP:AddDurability(amount)

	--[[
	self:SetClip1( math.Clamp(self:Clip1() + amount,0,100) )

	if self:Clip1() <= 0 then
		self.Owner:EmitSound("physics/metal/sawblade_stick1.wav")
		if self and SERVER then
			self.Owner:StripWeapon(self:GetClass())
		end
	end
	--]]
	
	
	--[[
	self.Owner:SetAmmo( math.Clamp(self.Owner:GetAmmoCount(self.Primary.Ammo) + amount,0,100),self.Primary.Ammo)
	if self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then
		self.Owner:EmitSound(Sound("AlyxEMP.Discharge"))
		self.Owner:StripWeapon(self.Weapon:GetClass())
	end
	--]]
end

function SWEP:Deploy()

	self:CheckInventory()
	self:EmitGunSound(Sound("Weapon_SMODSword.Deploy"))
	self.Owner:DrawViewModel(true)
	self:SendWeaponAnim(ACT_VM_DRAW)
	self:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())	
	self:SetSpecialFloat(0)
	
	return true
end

function SWEP:BlockDamage(Damage,Attacker)

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendWeaponAnim(ACT_VM_HITCENTER)
	self:EmitGunSound(self.MeleeSoundMiss)
	self.Owner:EmitSound(Sound("FX_RicochetSound.Ricochet"))

	if Attacker and Attacker ~= NULL then
		local AttackerWeapon = Attacker:GetActiveWeapon()
		if AttackerWeapon and AttackerWeapon ~= NULL and AttackerWeapon.WeaponType == "Melee" then
			local Delay = 1
			self:SetNextPrimaryFire(CurTime() + Delay*0.5)
			self:SetNextSecondaryFire(CurTime() + Delay*0.5)
			AttackerWeapon:SetNextPrimaryFire(CurTime() + Delay)
			AttackerWeapon:SetNextSecondaryFire(CurTime() + Delay)
		end
	end
	
	--self:AddDurability(- math.ceil(Damage*0.1) )
	
end

function KATANA_ScalePlayerDamage(victim,hitgroup,dmginfo)

	local attacker = dmginfo:GetAttacker()
	local Weapon = victim:GetActiveWeapon()
	local Damage = dmginfo:GetDamage()
	local WeaponAttacker = dmginfo:GetInflictor()
	
	if attacker and attacker ~= NULL then
		local Temp = attacker:GetActiveWeapon()
		if Temp and Temp ~= NULL then
			WeaponAttacker = Temp
		end
	end
	
	

	if Weapon and Weapon ~= NULL and Weapon:GetClass() == "weapon_smod_katana" and WeaponAttacker and WeaponAttacker ~= NULL and WeaponAttacker.Primary and WeaponAttacker.Primary.NumShots <= 3 then

		local NormalBlock = (Weapon:GetSpecialFloat() > 0 and Weapon:GetIsBlocking())
		
		
		local VictimKeyDown = (Weapon:IsBalanced() or ( victim:GetGravity() < 0.01 and victim:GetGravity() ~= 0 ) or NormalBlock)

		if VictimKeyDown then

			if (hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG) and !victim:Crouching() then
			
			
			elseif hitgroup == HITGROUP_HEAD and victim:Crouching() then
		
			
			else

				local VictimAngles = victim:GetAngles() + Angle(0,180,0)
				local AttackerAngles = attacker:GetAngles()
				
				VictimAngles:Normalize()
				AttackerAngles:Normalize()
				
				local NewAngles = VictimAngles - AttackerAngles
				
				NewAngles:Normalize()
				
				local Yaw = math.abs(NewAngles.y)
				
				if Yaw < 30 or ( victim:GetGravity() < 0.01 and victim:GetGravity() ~= 0 ) then
					
					if Damage > 1 then
						Weapon:ShootBullet(Damage, 1, Weapon:HandleCone(Weapon.Primary.Cone,false), victim:GetShootPos(), victim:GetAimVector(), attacker)
					end

					Weapon:BlockDamage(Damage)
					
					return true
					
				end
				
			end
			
		end
	end

end


local MovementBullshit = 0

function SWEP:DrawSpecial(Cone)

	if self:GetIsBlocking() then
		MovementBullshit = math.Clamp(MovementBullshit + FrameTime()*2,0,1)
	else
		MovementBullshit = math.Clamp(MovementBullshit - math.max(FrameTime()*0.25,MovementBullshit*FrameTime()),0,1)
	end
	
	local x = ScrW()
	local y = ScrH()
	
	local w = 200
	local h = 20
		local BorderSize = 10
	
	local DamageMul = math.Clamp(self:GetPower()/100,0,1)
	local BasePosX = x/2 - w/2
	local BasePosY = y*0.75 - MovementBullshit*100

	surface.SetDrawColor( 255, 255, 255, 100 )
	surface.DrawRect( BasePosX, BasePosY, w, h )	
	surface.DrawRect( BasePosX, BasePosY, w * DamageMul, h )
	surface.DrawRect( BasePosX-BorderSize/2, BasePosY - BorderSize/2, w * DamageMul + BorderSize, h + BorderSize)
	
	draw.SimpleText( math.floor(DamageMul*100) .. "%", "TargetID", BasePosX + w - 5, BasePosY, Color( 255, 255, 255, 255 ),TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP )
	
	if DamageMul >= 1 then
		draw.SimpleText( "DASH RDY", "TargetID", BasePosX + w - 5, BasePosY - 25, Color( 255, 255, 255, 255 ),TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP )
	end
	
	if self:GetSpecialInt() ~= 0 then
		draw.SimpleText( "JUMP RDY", "TargetID", BasePosX - 5, BasePosY - 25, Color( 255, 255, 255, 255 ),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP )
	end
	
	local ColorTable = Color(255,255,255,255)
	
	if self:IsBalanced() then
		ColorTable = Color(0,255,0,255)
	end
	
	for num,value in pairs(self.LastDamageTable) do
		draw.SimpleText( value .. "%", "TargetID", BasePosX + w - 5, BasePosY + 5 + 20*4 - num*20, ColorTable,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP )
	end
	
	
end


hook.Add("ScalePlayerDamage","KATANA_ScalePlayerDamage",KATANA_ScalePlayerDamage)