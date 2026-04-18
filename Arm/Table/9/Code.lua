-- Blade
local function ShootBullet_Sword(mc_no, level)
	local bul_no
	if cs.CountArmsBullet(mc_no, 9) > 0 then
		return
	end
	if level == 1 then
		bul_no = cs.BULLET_SWORD1
	elseif level == 2 then
		bul_no = cs.BULLET_SWORD2
	elseif level == 3 then
		bul_no = cs.BULLET_SWORD3
	end
	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
--		cs.DeleteBullet(9) -- Fred: This function is otherwise completely unused.
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 4 * cs.VS, cs.DIR_UP)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 4 * cs.VS, cs.DIR_UP)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 6 * cs.VS, cs.DIR_DOWN)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 6 * cs.VS, cs.DIR_DOWN)
			end
		else
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 6 * cs.VS, cs.gMC[1 + mc_no].y - 3 * cs.VS, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 6 * cs.VS, cs.gMC[1 + mc_no].y - 3 * cs.VS, cs.DIR_RIGHT)
			end
		end
		cs.PlaySoundObject(cs.WAVE_FIRE,  1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	end
end

return {
	weapon_fired = function (mc_no, level)
		-- ブレード
		if level == 1 then
			ShootBullet_Sword(mc_no, 1)
		elseif level == 2 then
			ShootBullet_Sword(mc_no, 2)
		elseif level == 3 then
			ShootBullet_Sword(mc_no, 3)
		end
	end,
	weapon_switched = nil,
	weapon_idle = nil
}
