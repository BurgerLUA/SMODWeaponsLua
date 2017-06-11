if CLIENT then
	killicon.Add( "weapon_smod_dualcolts", "vgui/killicons/smod_dualcolts", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_dualcolts")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "Colt Akimbo"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_colts.mdl"
SWEP.WorldModel				= "models/weapons/w_colts.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "duel"
SWEP.UseHands				= false

SWEP.Primary.Damage			= 45
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/colts/fire.wav")
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ClipSize		= 14
SWEP.Primary.SpareClip		= 14*4
SWEP.Primary.Delay			= 1/10
SWEP.Primary.Ammo			= "bb_45acp"
SWEP.Primary.Automatic 		= false

SWEP.EnableTracer			= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= -1
SWEP.MoveConeMul			= 2
SWEP.HeatMul				= 3
SWEP.CoolMul				= 0
SWEP.CoolSpeedMul			= 0.5

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDual				= true
SWEP.CanShootWhileSprinting = true
SWEP.SideRecoilBasedOnDual	= true

SWEP.HasDryFire				= true
SWEP.FireAlwaysAnimate		= true

SWEP.HasIdle			 	= true

SWEP.BurstSpeedAbs			= 1/5
SWEP.BurstOverride			= 2
SWEP.BurstSpeedOverride		= 0

SWEP.DamageFalloff			= 2000

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25

SWEP.IronSightsPos 			= Vector(0.75, 5, 2)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos 			= Vector(0, -30, -20)
SWEP.IronMeleeAng 			= Vector(70, 0, 0)

--[[
1:
		act	=	524
		actname	=	ACT_VM_IDLE_EMPTY
		id	=	1
2:
		act	=	498
		actname	=	ACT_VM_IDLE_EMPTY_LEFT
		id	=	2
3:
		act	=	2091
		actname	=	ACT_VM_IDLE_EMPTY_RIGHT
		id	=	3
4:
		act	=	182
		actname	=	ACT_VM_SECONDARYATTACK
		id	=	4
5:
		act	=	186
		actname	=	ACT_VM_DRYFIRE
		id	=	5
6:
		act	=	181
		actname	=	ACT_VM_PRIMARYATTACK
		id	=	6
7:
		act	=	499
		actname	=	ACT_VM_DRYFIRE_LEFT
		id	=	7
8:
		act	=	172
		actname	=	ACT_VM_DRAW
		id	=	8
9:
		act	=	-1
		actname	=	
		id	=	9
10:
		act	=	183
		actname	=	ACT_VM_RELOAD
		id	=	10
11:
		act	=	173
		actname	=	ACT_VM_HOLSTER
		id	=	11
12:
		act	=	173
		actname	=	ACT_VM_HOLSTER
		id	=	12
--------------------
0	=	idle01_2
1	=	idle01empty_2
2	=	idle01empty_l_2
3	=	idle01empty_r_2
4	=	fire_r
5	=	fireempty_r
6	=	fire_l
7	=	fireempty_l
8	=	draw_2
9	=	drawempty_2
10	=	reload_2
11	=	holster_2
12	=	holsterempty_2
--]]


function SWEP:IdleAnimation()

	local Animation = nil

	if !self:GetIsLeftFire() and self:Clip1() == 1 then
		Animation = nil
		self:SendSequence("idle01empty_r_2")
	elseif self:GetIsLeftFire() and self:Clip1() == 1 then
		Animation = nil
		self:SendSequence("idle01empty_l_2")
	elseif self:Clip1() == 0 then
		Animation = ACT_VM_IDLE_EMPTY
	else
		Animation = ACT_VM_IDLE
	end

	if Animation then
		self:SendWeaponAnimation(Animation)
	end
end



SWEP.AnimationRateTable = {}
SWEP.AnimationRateTable[ACT_VM_RELOAD] = 1.5

SWEP.SequenceDurationAdd = {}
SWEP.SequenceDurationAdd[ACT_VM_RELOAD] = -0.1
SWEP.SequenceDurationAdd[ACT_VM_DRYFIRE_LEFT] = -0.25
SWEP.SequenceDurationAdd[ACT_VM_DRYFIRE] = -0.25



