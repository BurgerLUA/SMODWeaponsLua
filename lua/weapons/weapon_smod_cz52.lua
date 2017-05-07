if CLIENT then
	killicon.Add( "weapon_smod_cz52", "vgui/killicons/smod_cz52", Color( 0, 128, 255, 255 ) )
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/killicons/smod_cz52")
end

SWEP.Category				= "BurgerBase: SMOD"
SWEP.PrintName				= "CZ 52"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 1500
SWEP.CSSMoveSpeed			= 245

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_cz52.mdl"
SWEP.WorldModel				= "models/weapons/w_cz52.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "revolver"
SWEP.UseHands				= false

SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_CZ52.Single")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 8
SWEP.Primary.SpareClip		= 8*4
SWEP.Primary.Delay			= 0.15
SWEP.Primary.Ammo			= "bb_45acp"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 1
SWEP.RecoilSpeedMul			= 1.25
SWEP.MoveConeMul			= 0.75
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false

SWEP.DamageFalloff			= 2000
SWEP.CanShootWhileSprinting = true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125

SWEP.IronSightsPos 			= Vector(-6.761, 0, 2)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.IronRunPos				= Vector(0,-10,-10)
SWEP.IronRunAng				= Vector(20,20,0)

SWEP.IronMeleePos 			= Vector(-6.433, -30, -20)
SWEP.IronMeleeAng 			= Vector(70, 0, 0)

SWEP.DryFireSound			= Sound("weapons/cz52/sliderelease.wav")





--[[

1:
		act	=	524
		actname	=	ACT_VM_IDLE_EMPTY
		id	=	1
2:
		act	=	181
		actname	=	ACT_VM_PRIMARYATTACK
		id	=	2
3:
		act	=	206
		actname	=	ACT_VM_RECOIL1
		id	=	3
4:
		act	=	207
		actname	=	ACT_VM_RECOIL2
		id	=	4
5:
		act	=	208
		actname	=	ACT_VM_RECOIL3
		id	=	5
6:
		act	=	186
		actname	=	ACT_VM_DRYFIRE
		id	=	6
7:
		act	=	172
		actname	=	ACT_VM_DRAW
		id	=	7
8:
		act	=	-1
		actname	=	
		id	=	8
9:
		act	=	183
		actname	=	ACT_VM_RELOAD
		id	=	9
10:
		act	=	173
		actname	=	ACT_VM_HOLSTER
		id	=	10
11:
		act	=	173
		actname	=	ACT_VM_HOLSTER
		id	=	11
12:
		act	=	205
		actname	=	ACT_VM_LOWERED_TO_IDLE
		id	=	12
13:
		act	=	203
		actname	=	ACT_VM_IDLE_TO_LOWERED
		id	=	13
14:
		act	=	204
		actname	=	ACT_VM_IDLE_LOWERED
		id	=	14
--------------------
0	=	idle01
1	=	idle01empty
2	=	fire
3	=	fire1
4	=	fire2
5	=	fire3
6	=	fireempty
7	=	draw
8	=	drawempty
9	=	reload
10	=	holster
11	=	holsterempty
12	=	idletolow
13	=	lowtoidle
14	=	lowidle

--]]

SWEP.HasIdle = false
SWEP.FireAlwaysAnimate = true

function SWEP:IdleAnimation()
	if self:Clip1() == 0 then
		self:SendWeaponAnimation(ACT_VM_IDLE_EMPTY)
	else
		self:SendWeaponAnimation(ACT_VM_IDLE)
	end
end

function SWEP:WeaponAnimation(clip,animation)
	if clip == 0 then
		self:SendWeaponAnimation(ACT_VM_DRYFIRE)
	else
		self:SendWeaponAnimation(animation)
	end
end