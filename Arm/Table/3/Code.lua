--FireBall
local function ShootBullet_FireBall(mc_no, level)
	local bul_no

	if level == 1 then
		if cs.CountArmsBullet(mc_no, 3) > 1 then
			return
		end
		bul_no = cs.BULLET_FIREBALL1
	elseif level == 2 then
		if cs.CountArmsBullet(mc_no, 3) > 2 then
			return
		end
		bul_no = cs.BULLET_FIREBALL2
	elseif level == 3 then
		if cs.CountArmsBullet(mc_no, 3) > 3 then
			return
		end
		bul_no = cs.BULLET_FIREBALL3
	end

	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
		if cs.UseArmsEnergy(mc_no, 1) == false then
			cs.ChangeToFirstArms(mc_no)
			return
		end
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 4 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 4 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 4 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 4 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 4 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 4 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 4 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 4 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		else
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x -  6 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.DIR_LEFT)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 12 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x +  6 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.DIR_RIGHT)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 12 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		end
		cs.PlaySoundObject(cs.WAVE_FIRE, 1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	end
end

return {
	weapon_fired = ShootBullet_FireBall,
	weapon_switched = nil,
	weapon_idle = nil
}
