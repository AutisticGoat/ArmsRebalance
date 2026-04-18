-- Missile
function ShootBullet_Missile(mc_no, level, bSuper)
	local bul_no

	if bSuper then
		if level == 1 then
			bul_no = cs.BULLET_SUPERMISSILE1
		elseif level == 2 then
			bul_no = cs.BULLET_SUPERMISSILE2
		elseif level == 3 then
			bul_no = cs.BULLET_SUPERMISSILE3
		end
		if level == 1 then
			if cs.CountArmsBullet(mc_no, 10) > 0 then
				return
			end
			if cs.CountArmsBullet(mc_no, 11) > 0 then
				return
			end
		elseif level == 2 then
			if cs.CountArmsBullet(mc_no, 10) > 1 then
				return
			end
			if cs.CountArmsBullet(mc_no, 11) > 1 then
				return
			end
		elseif level == 3 then
			if cs.CountArmsBullet(mc_no, 10) > 3 then
				return
			end
			if cs.CountArmsBullet(mc_no, 11) > 3 then
				return
			end
		end
	else
		if level == 1 then
			bul_no = cs.BULLET_MISSILE1
		elseif level == 2 then
			bul_no = cs.BULLET_MISSILE2
		elseif level == 3 then
			bul_no = cs.BULLET_MISSILE3
		end
		if level == 1 then
			if cs.CountArmsBullet(mc_no, 5) > 0 then
				return
			end
			if cs.CountArmsBullet(mc_no, 6) > 0 then
				return
			end
		elseif level == 2 then
			if cs.CountArmsBullet(mc_no, 5) > 1 then
				return
			end
			if cs.CountArmsBullet(mc_no, 6) > 1 then
				return
			end
		elseif level == 3 then
			if cs.CountArmsBullet(mc_no, 5) > 3 then
				return
			end
			if cs.CountArmsBullet(mc_no, 6) > 3 then
				return
			end
		end
	end

	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
		if level < 3 then
			if cs.UseArmsEnergy(mc_no, 1) == false then
--				cs.ChangeToFirstArms()
				cs.PlaySoundObject(cs.WAVE_ARMS_EMPTY, 1)
				if cs._empty[1 + mc_no] == 0 then
					cs.SetCaret(cs.gMC[1 + mc_no].x, cs.gMC[1 + mc_no].y, cs.CARET_EMPTY, cs.DIR_LEFT)
					cs._empty[1 + mc_no] = 50
				end

				return
			end
			if cs.gMC[1 + mc_no].up then
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				end
			elseif cs.gMC[1 + mc_no].down then
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				end
			else
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x -  6 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_LEFT)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 12 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x +  6 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_RIGHT)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 12 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
				end
			end
		else
			if cs.UseArmsEnergy(mc_no, 1) == false then
--				cs.ChangeToFirstArms()
--				cs.PlaySoundObject(cs.WAVE_EMPTY, 1)
				cs.PlaySoundObject(cs.WAVE_ARMS_EMPTY, 1)
				if cs._empty[1 + mc_no] == 0 then
					cs.SetCaret(cs.gMC[1 + mc_no].x, cs.gMC[1 + mc_no].y, cs.CARET_EMPTY, cs.DIR_LEFT)
					cs._empty[1 + mc_no] = 50
				end
				return
			end
			if cs.gMC[1 + mc_no].up then
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y - 0 * cs.VS, cs.DIR_UP)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y - 0 * cs.VS, cs.DIR_UP)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_UP)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y - 0 * cs.VS, cs.DIR_UP)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y - 0 * cs.VS, cs.DIR_UP)
				end
			elseif cs.gMC[1 + mc_no].down then
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_DOWN)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_DOWN)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.DIR_DOWN)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 8 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_DOWN)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y + 0 * cs.VS, cs.DIR_DOWN)
				end
			else
				if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x -  6 * cs.VS, cs.gMC[1 + mc_no].y + 1 * cs.VS, cs.DIR_LEFT)
					cs.SetCaret(                cs.gMC[1 + mc_no].x - 12 * cs.VS, cs.gMC[1 + mc_no].y + 1 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x -  0 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x +  4 * cs.VS, cs.gMC[1 + mc_no].y - 1 * cs.VS, cs.DIR_LEFT)
				else
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x +  6 * cs.VS, cs.gMC[1 + mc_no].y + 1 * cs.VS, cs.DIR_RIGHT)
					cs.SetCaret(                cs.gMC[1 + mc_no].x + 12 * cs.VS, cs.gMC[1 + mc_no].y + 1 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x +  0 * cs.VS, cs.gMC[1 + mc_no].y - 8 * cs.VS, cs.DIR_RIGHT)
					cs.SetBullet(mc_no, bul_no, cs.gMC[1 + mc_no].x -  4 * cs.VS, cs.gMC[1 + mc_no].y - 1 * cs.VS, cs.DIR_RIGHT)
				end
			end
		end
		cs.PlaySoundObject(cs.WAVE_POLESTAR, 1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	end
end

return {
	weapon_fired = function (mc_no, level)
		ShootBullet_Missile(mc_no, level, false)
	end,
	weapon_switched = nil,
	weapon_idle = nil
}
