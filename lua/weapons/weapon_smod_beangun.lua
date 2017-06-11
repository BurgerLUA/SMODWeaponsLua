if CLIENT then
	killicon.Add( "ent_smod_beans", "vgui/killicons/smod_SoyBeans", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_SoyBeans")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Bean Gun"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 220

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4 - 1
SWEP.SlotPos				= 1


SWEP.ViewModel 				= "models/weapons/v_m60.mdl"
SWEP.WorldModel 			= "models/weapons/w_m60.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.UseHands				= false

game.AddAmmoType({name = "smod_beans2"})

if CLIENT then 
	language.Add("smod_beans2_ammo","Spicy Beans")
end


SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/grease/greasegun_shoot.wav")
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 250
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "smod_beans2"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 0.5
SWEP.CoolMul				= 2
SWEP.MaxHeat				= 3

SWEP.HasScope 				= false
SWEP.ZoomAmount				= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDual				= false
SWEP.CanShootWhileSprinting = false

SWEP.DamageFalloff			= 3000
SWEP.AddFOV					= 20

SWEP.UseSpecialProjectile	= true
SWEP.UseMuzzle				= true
SWEP.BulletAngOffset		= Angle(-1,0,0)

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 1

SWEP.IronSightsPos 			= Vector(-3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, -7)

SWEP.IronRunPos				= Vector(0,0,0)
SWEP.IronRunAng				= Vector(-10,0,0)

SWEP.IronMeleePos = Vector(3.015, -2.01, 0)
SWEP.IronMeleeAng = Vector(0, 54.171, -16.885)




local ArrowModel = Model("models/misc/setubun/soybean.mdl")
local ArrowSound = Sound("fofgunsounds/bow/hit1.wav")

SWEP.ViewModelBoneMods = {
	["Bone71"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bone73"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bone70"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["beans"] = { type = "Model", model = "models/weapons/w_msbomb.mdl", bone = "Bone01", rel = "", pos = Vector(3.635, -20.261, 1.557), angle = Angle(0, 180, 0), size = Vector(1.858, 0.69, 1.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["beans2"] = { type = "Model", model = "models/misc/setubun/soybean.mdl", bone = "Bone01", rel = "beans", pos = Vector(0.518, 1.557, 0.518), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:ModProjectileTable(datatable)

	datatable.direction = datatable.direction*3000
	datatable.resistance = (datatable.direction*0.05) + Vector(0,0,25)
	datatable.dietime = CurTime() + 10
	datatable.id = "smod_bean"

	return datatable

end


-- Register Bullet
local datatable = {}
	
datatable.drawfunction = function(datatable)
	if datatable.special and datatable.special ~= NULL then
		datatable.special:SetPos(datatable.pos)
		datatable.special:SetAngles( datatable.direction:GetNormalized():Angle() + Angle(math.random(-180,180),math.random(-180,180),math.random(-180,180) ) )
		datatable.special:DrawModel()
	else
		datatable.special = ClientsideModel(ArrowModel, RENDERGROUP_OPAQUE )
	end
end

datatable.diefunction = function(datatable)
	if CLIENT then
		if datatable.special and datatable.special ~= NULL then
			datatable.special:Remove()
		end
	end
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
	
	if IsValid(Attacker) and IsValid(Victim) and IsValid(Inflictor) then
		local DmgInfo = DamageInfo()
		DmgInfo:SetDamage( datatable.damage )
		DmgInfo:SetAttacker( Attacker )
		DmgInfo:SetInflictor( Inflictor )
		DmgInfo:SetDamageForce( datatable.direction:GetNormalized() )
		DmgInfo:SetDamagePosition( datatable.pos )
		DmgInfo:SetDamageType( DMG_BULLET )
		traceresult.Entity:DispatchTraceAttack( DmgInfo, traceresult )
	end
	
end

BURGERBASE_RegisterProjectile("smod_bean",datatable)




