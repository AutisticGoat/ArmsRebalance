local function ShootBullet_Frontia1(mc_no, level)
	local bul_no

	if level == 1 then
		bul_no = cs.BULLET_FRONTIA1
	elseif level == 2 then
		bul_no = cs.BULLET_FRONTIA2
	elseif level == 3 then
		bul_no = cs.BULLET_FRONTIA3
	end


	if not cs.IsMaxExpMyChar(mc_no) and cs.CountArmsBullet(mc_no, 1) > 3 then
		return
	end
	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
		if cs.UseArmsEnergy(mc_no, 1) == false then
			cs.ChangeToFirstArms(mc_no)
			return
		end
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y - 10 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y - 10 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y - 10 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y - 10 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y + 10 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y + 10 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y + 10 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y + 10 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
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
		cs.PlaySoundObject(cs.WAVE_FRONTIA, 1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	end
end

return {
	weapon_fired = ShootBullet_Frontia1,
	weapon_switched = nil,
	weapon_idle = nil
}
