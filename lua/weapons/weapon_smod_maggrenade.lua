if CLIENT then
	killicon.Add( "weapon_smod_maggrenade", "vgui/killicons/smod_gravitygrenade", Color( 255, 255, 255, 255 ) )
	killicon.Add( "ent_smod_magnade", "vgui/killicons/smod_gravitygrenade", Color( 255, 255, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/hegrenade")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "MAG GRENADE"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Throwable"

SWEP.Cost					= 300
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_gravball.mdl"
SWEP.WorldModel				= "models/weapons/w_gravball.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "grenade"
SWEP.UseHands				= false

game.AddAmmoType({name = "smod_magnade"})

if CLIENT then 
	language.Add("smod_magnade_ammo","Magnade")
end

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ak47/ak47-1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 1
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "smod_magnade"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.IsThrowing 			= false
SWEP.HasAnimated			= false
SWEP.HasThrown				= false
SWEP.CanHolster				= true
SWEP.Object					= "ent_smod_magnade"