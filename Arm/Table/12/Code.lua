-- Nemesis
local function ShootBullet_Nemesis(mc_no, level)
	local bul_no

	if level == 1 then
		bul_no = cs.BULLET_NEMESIS1
	elseif level == 2 then
		bul_no = cs.BULLET_NEMESIS2
	elseif level == 3 then
		bul_no = cs.BULLET_NEMESIS3
	end

	if cs.CountArmsBullet(mc_no, 12) > 1 then
		return
	end
	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
		if cs.UseArmsEnergy(mc_no, 1) == false then
			cs.PlaySoundObject(cs.WAVE_ARMS_EMPTY, 1)
			return
		end
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 12 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 12 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 12 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 12 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 12 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 12 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 12 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 12 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		else
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 22 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_LEFT)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 16 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 22 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_RIGHT)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 16 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		end
		if level == 1 then
			cs.PlaySoundObject(cs.WAVE_NEMESIS,    1)
		elseif level == 2 then
			cs.PlaySoundObject(cs.WAVE_POLEST2,    1)
		elseif level == 3 then
			cs.PlaySoundObject(cs.WAVE_CHARGE_LV2, 1)
		end
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	end
end

return {
	weapon_fired = ShootBullet_Nemesis,
	weapon_switched = nil,
	weapon_idle = nil
}
