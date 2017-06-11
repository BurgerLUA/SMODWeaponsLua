if CLIENT then
	killicon.Add( "ent_smod_launcher", "vgui/killicons/smod_A35GL",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/smod_A35GL")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Grenade Launcher"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2000
SWEP.CSSMoveSpeed			= 220

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 2

SWEP.ViewModel				= "models/weapons/v_a35.mdl"
SWEP.WorldModel				= "models/weapons/w_a35.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"

game.AddAmmoType({name = "ex_launcher"})

if CLIENT then 
	language.Add("ex_launcher_ammo","Popcan")
end

SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 6
SWEP.Primary.SpareClip		= 6
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Ammo			= "ex_launcher"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.RecoilSpeedMul			= 0.75
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.MaxHeat				= 5

SWEP.HasScope 				= true
SWEP.ZoomAmount				= 3
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDual				= false
SWEP.CanShootWhileSprinting = false
SWEP.HasHL2Pump				= false

SWEP.DamageFalloff			= 100
SWEP.AddFOV					= 20

SWEP.UseMuzzle				= true
SWEP.BulletAngOffset		= Angle(0,0,0)
SWEP.UseSpecialProjectile	= true

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false

SWEP.IronSightTime			= 0.5
SWEP.ZoomTime				= 0.125
SWEP.ZoomDelay				= 0.125

SWEP.IronSightsPos 			= Vector(2.24, 0, 1.32)
SWEP.IronSightsAng			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,0,0)
SWEP.IronRunAng				= Vector(-10,0,0)

SWEP.IronMeleePos = Vector(0, 0, -1.81)
SWEP.IronMeleeAng = Vector(16.18, -40.805, 44.321)



local NadeModel = Model("models/weapons/ar2_grenade.mdl")
local NadeSound = Sound("fofgunsounds/melee/axe_hit2.wav")

function SWEP:ModProjectileTable(datatable)

	datatable.direction = datatable.direction*1000
	datatable.hullsize = 1
	datatable.resistance = datatable.direction*0.1 + Vector(0,0,100)
	datatable.dietime = CurTime() + 10
	datatable.id = "launched_grenade"
	
	datatable.hullsize = 1

	return datatable

end

local datatable = {}

datatable.drawfunction = function(datatable)
	if datatable.special and datatable.special ~= NULL then
		datatable.special:SetPos(datatable.pos)
		datatable.special:SetAngles( datatable.direction:GetNormalized():Angle() )
		datatable.special:DrawModel()
	else
		datatable.special = ClientsideModel(NadeModel, RENDERGROUP_OPAQUE )
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
	
	if IsValid(Attacker) and IsValid(Inflictor) then
	
		local DmgInfo = DamageInfo()
		DmgInfo:SetDamage( datatable.damage )
		DmgInfo:SetAttacker( Attacker )
		DmgInfo:SetInflictor( Inflictor )
		DmgInfo:SetDamageForce( datatable.direction:GetNormalized() )
		DmgInfo:SetDamagePosition( traceresult.HitPos )
		DmgInfo:SetDamageType( DMG_SHOCK )
		util.BlastDamageInfo( DmgInfo, traceresult.HitPos, 512 )
		
		if IsFirstTimePredicted() then
			local effectdata = EffectData()
			effectdata:SetStart( traceresult.HitPos + datatable.direction:GetNormalized()*100)
			effectdata:SetOrigin( traceresult.HitPos)
			effectdata:SetScale( 1 )
			effectdata:SetRadius( 1 )
			util.Effect( "Explosion", effectdata)
		end
		
	
	end
	
end

datatable.diefunction = function(datatable)
	if CLIENT then
		if datatable.special and datatable.special ~= NULL then
			datatable.special:Remove()
		end
	end
end

BURGERBASE_RegisterProjectile("launched_grenade",datatable)


SWEP.AnimationRateTable = {}
SWEP.AnimationRateTable[ACT_VM_PRIMARYATTACK] = 0.75
SWEP.AnimationRateTable[ACT_SHOTGUN_PUMP] = 0.75
SWEP.AnimationRateTable[ACT_VM_RELOAD] = 0.5
SWEP.AnimationRateTable[ACT_SHOTGUN_RELOAD_START] = 0.75
SWEP.AnimationRateTable[ACT_SHOTGUN_RELOAD_FINISH] = 0.75

SWEP.SequenceDurationAdd = {}
SWEP.SequenceDurationAdd[ACT_VM_RELOAD] = 0.25
