local wait = 0

-- Bubbline Lv1
local function ShootBullet_Bubblin1(mc_no)
	if cs.CountArmsBullet(mc_no, 7) > 3 then
		return
	end
	if cs.gKeyMCTrg[1 + mc_no] & cs.gKeyShot ~= 0 then
		if cs.UseArmsEnergy(mc_no, 1) == false then
			cs.PlaySoundObject(cs.WAVE_ARMS_EMPTY, 1)
			if cs._empty[1 + mc_no] == 0 then
				cs.SetCaret(cs.gMC[1 + mc_no].x, cs.gMC[1 + mc_no].y, cs.CARET_EMPTY, cs.DIR_LEFT)
				cs._empty[1 + mc_no] = 50
			end
			return
		end
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 2 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y - 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 2 * cs.VS, cs.DIR_UP)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y - 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x - 1 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x + 1 * cs.VS, cs.gMC[1 + mc_no].y + 2 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		else
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x -  6 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_LEFT)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x - 12 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, cs.BULLET_BUBBLIN1, cs.gMC[1 + mc_no].x +  6 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_RIGHT)
				cs.SetCaret(                            cs.gMC[1 + mc_no].x + 12 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		end
		cs.PlaySoundObject(cs.WAVE_BUBBLIN, 1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	else
		wait = wait + 1
		if wait > 20 then
			wait = 0
			cs.ChargeArmsEnergy(mc_no, 1)
		end
	end
end

local wait2 = {}
for mc_no = 1, cs.MAX_MYCHAR do
	wait2[mc_no] = 0
end

-- Bubbline Lv2
local function ShootBullet_Bubblin2(mc_no, level)
	if cs.CountArmsBullet(mc_no, 7) > 15 then
		return
	end
	level = level + (cs.BULLET_BUBBLIN2 - 2)

	if cs.gKeyMC[1 + mc_no] & cs.gKeyShot == 0 then
		cs.gMC[1 + mc_no].rensha = 6
	end
	if cs.gKeyMC[1 + mc_no] & cs.gKeyShot ~= 0 then
		cs.gMC[1 + mc_no].rensha = cs.gMC[1 + mc_no].rensha + 1
		if cs.gMC[1 + mc_no].rensha < 7 then
			return
		end
		cs.gMC[1 + mc_no].rensha = 0

		if cs.UseArmsEnergy(mc_no, 1) == false then
			cs.PlaySoundObject(cs.WAVE_ARMS_EMPTY, 1)
			if cs._empty[1 + mc_no] == 0 then
				cs.SetCaret(cs.gMC[1 + mc_no].x, cs.gMC[1 + mc_no].y, cs.CARET_EMPTY, cs.DIR_LEFT)
				cs._empty[1 + mc_no] = 50
			end
			return
		end
		if cs.gMC[1 + mc_no].up then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y -  8 * cs.VS, cs.DIR_UP)
				cs.SetCaret(               cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y - 16 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y -  8 * cs.VS, cs.DIR_UP)
				cs.SetCaret(               cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y - 16 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		elseif cs.gMC[1 + mc_no].down then
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y +  8 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(               cs.gMC[1 + mc_no].x - 3 * cs.VS, cs.gMC[1 + mc_no].y + 16 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y +  8 * cs.VS, cs.DIR_DOWN)
				cs.SetCaret(               cs.gMC[1 + mc_no].x + 3 * cs.VS, cs.gMC[1 + mc_no].y + 16 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		else
			if cs.gMC[1 + mc_no].direct == cs.DIR_LEFT then
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x -  6 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_LEFT)
				cs.SetCaret(               cs.gMC[1 + mc_no].x - 12 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			else
				cs.SetBullet(mc_no, level, cs.gMC[1 + mc_no].x +  6 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.DIR_RIGHT)
				cs.SetCaret(               cs.gMC[1 + mc_no].x + 12 * cs.VS, cs.gMC[1 + mc_no].y + 3 * cs.VS, cs.CARET_FLASH, cs.DIR_LEFT)
			end
		end
		cs.PlaySoundObject(cs.WAVE_BUBBLIN, 1)
		cs.gMC[1 + mc_no].muzzle = cs.MUZZLE_FLASH_DURATION
	else
		wait2[1 + mc_no] = wait2[1 + mc_no] + 1
		if wait2[1 + mc_no] > 1 then
			wait2[1 + mc_no] = 0
			cs.ChargeArmsEnergy(mc_no, 1)
		end
	end
end

local ChargeCounter = 0

local function Idle(mc_no, level, slot)
	-- Bubbline
	if ChargeCounter == 0 then
		ChargeCounter = level > 1 and 5 or 42
		cs.ChargeUnequippedEnergy(mc_no, slot, 1)
	end
	ChargeCounter = ChargeCounter - 1
end


return {
	weapon_fired = function (mc_no, level)
		-- バブリン
		if level == 1 then
			ShootBullet_Bubblin1(mc_no)
		elseif level == 2 then
			ShootBullet_Bubblin2(mc_no, 2)
		elseif level == 3 then
			ShootBullet_Bubblin2(mc_no, 3)
		end
	end,
	weapon_switched = nil,
	weapon_idle = Idle
}
