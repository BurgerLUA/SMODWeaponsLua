if CLIENT then
	killicon.Add( "weapon_smod_katana", "vgui/killicons/smod_Sword", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_Sword")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "KATANA"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 0
SWEP.CSSMoveSpeed				= 300

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

SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 100
SWEP.Primary.SpareClip		= 0
SWEP.Primary.Delay			= 0.75
SWEP.Primary.Ammo			= "smod_weeb"
SWEP.Primary.Automatic 		= true 

SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.SpareClip	= -1
SWEP.Secondary.Delay		= 1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic 	= false 

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
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

SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, -45)

SWEP.DamageFalloff			= 1000

SWEP.EnableBlocking			= true

function SWEP:PrimaryAttack()

	if self:IsUsing() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	if self.Owner:KeyDown(IN_ATTACK2) then return end
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if not self:GetIsLeftFire() then
		self:SendSequence("hitcenter3")
		--self:SendSequence("misscenter1")
		self:SetIsLeftFire(true)
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay*0.5)
		self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	else
		self:SendSequence("hitcenter2")
		--self:SendSequence("misscenter2")
		self:SetIsLeftFire(false)
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	end

	if self:NewSwing(self.Primary.Damage*0.75 + (self.Primary.Damage*0.25*self:Clip1()*0.01) ) then
		self:AddDurability(-1)
	end
	
	--PrintTable(self.Owner:GetSequenceList())
	
end

function SWEP:Reload()
	--PrintTable(GetActivities(self))
	--PrintTable(self:GetSequenceList())
	--[[
	local Viewmodel = self.Owner:GetViewModel()
	PrintTable(Viewmodel:GetMaterials())
	
	Viewmodel:SetSubMaterial(2 - 1,"models/effects/vol_light001")
	--]]
end


function SWEP:SpareThink()

	if self:GetNextPrimaryFire() + self.Primary.Delay <= CurTime() then
		if not self:GetIsLeftFire() then
			self:SetIsLeftFire(false)
		end
	end

	if self.Owner:KeyDown(IN_ATTACK2) then
		self:SetNextPrimaryFire(CurTime() + self.IronSightTime*2)
		self.CSSMoveSpeed				= 300*0.25
	else
		self.CSSMoveSpeed				= 300
	end

	if SERVER then
		if self.Owner:KeyDown(IN_ATTACK2) and self:GetNextSecondaryFire() <= CurTime() then
			self:SetIsBlocking( true )
			self:SetHoldType("slam")
		else
			self:SetHoldType(self.HoldType)
			self:SetIsBlocking( false )
		end
	end

end

function SWEP:SecondaryAttack()

end

function SWEP:AddDurability(amount)

	self:SetClip1( math.Clamp(self:Clip1() + amount,0,100) )

	if self:Clip1() <= 0 then
		self.Owner:EmitSound("physics/metal/sawblade_stick1.wav")
		if self and SERVER then
			self.Owner:StripWeapon(self:GetClass())
		end
	end
	
	
	--[[
	self.Owner:SetAmmo( math.Clamp(self.Owner:GetAmmoCount(self.Primary.Ammo) + amount,0,100),self.Primary.Ammo)
	if self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then
		self.Owner:EmitSound(Sound("AlyxEMP.Discharge"))
		self.Owner:StripWeapon(self.Weapon:GetClass())
	end
	--]]
end

function SWEP:Deploy()

	self:EmitGunSound(Sound("Weapon_SMODSword.Deploy"))
	self.Owner:DrawViewModel(true)
	self:SendWeaponAnim(ACT_VM_DRAW)
	self:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())	
	
	return true
end

function SWEP:BlockDamage(Damage)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendWeaponAnim(ACT_VM_HITCENTER)
	self:EmitGunSound(self.MeleeSoundMiss)
	self.Owner:EmitSound(Sound("FX_RicochetSound.Ricochet"))
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay*0.5)
	--self:SetNextSecondaryFire(CurTime() + self.Primary.Delay*0.25)
	self:AddDurability(- math.ceil(Damage*0.1) )
end

function KATANA_ScalePlayerDamage(victim,hitgroup,dmginfo)

	local attacker = dmginfo:GetAttacker()
	local Weapon = victim:GetActiveWeapon()
	local Damage = dmginfo:GetDamage()
	local WeaponAttacker = dmginfo:GetInflictor()

	if Weapon and Weapon ~= NULL and Weapon:GetClass() == "weapon_smod_katana" then
	
		local VictimKeyDown = Weapon:GetIsBlocking()
		
		local ShouldProceed = true
		
		if attacker:IsPlayer() and attacker:GetActiveWeapon() and attacker:GetActiveWeapon():IsValid() then
			WeaponAttacker = attacker:GetActiveWeapon()
			
			if WeaponAttacker:IsScripted() and (WeaponAttacker.Base == "weapon_cs_base" or WeaponAttacker.BurgerBase) then
				if WeaponAttacker.Primary.NumShots > 1 then
					ShouldProceed = false
				end
			end
		end

		if ShouldProceed and VictimKeyDown and Weapon:GetNextSecondaryFire() <= CurTime() then
		
			if hitgroup == HITGROUP_RIGHTARM and Damage >= 50 then
			
				victim:EmitSound("physics/metal/metal_sheet_impact_soft2.wav")
				
				if SERVER then
					CSS_DropWeapon(victim,Weapon)
				end
				
				return true
			
			elseif (hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG) and !victim:Crouching() then
			
			
			elseif hitgroup == HITGROUP_HEAD and victim:Crouching() then
		
			
			else

				local VictimAngles = victim:GetAngles() + Angle(0,180,0)
				local AttackerAngles = attacker:GetAngles()
				
				VictimAngles:Normalize()
				AttackerAngles:Normalize()
				
				local NewAngles = VictimAngles - AttackerAngles
				
				NewAngles:Normalize()
				
				local Yaw = math.abs(NewAngles.y)
				
				if Yaw < 30 then
					
					if Damage > 1 then
						Weapon:ShootBullet(Damage, 1, 0.025, victim:GetShootPos(), victim:GetAimVector(), true)
					end
					
					Weapon:BlockDamage(Damage)
					
					return true
					
				end
				
			end
			
		end
	end

end

hook.Add("ScalePlayerDamage","KATANA_ScalePlayerDamage",KATANA_ScalePlayerDamage)






