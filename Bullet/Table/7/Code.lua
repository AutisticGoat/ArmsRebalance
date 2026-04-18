--ファイアボール
function ActBullet_FireBall(bul, level)
	local bBreak

	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end

	bBreak = false
	--壁消滅
	if bul.flag & cs.FLAG_HIT_TOP  ~= 0 and bul.flag & cs.FLAG_HIT_BOTTOM ~= 0 then
		bBreak = true
	end
	if bul.flag & cs.FLAG_HIT_LEFT ~= 0 and bul.flag & cs.FLAG_HIT_RIGHT  ~= 0 then
		bBreak = true
	end
	if bul.direct == cs.DIR_LEFT  and bul.flag & cs.FLAG_HIT_LEFT  ~= 0 then
		bul.direct = cs.DIR_RIGHT
--		bBreak = true
	end
	if bul.direct == cs.DIR_RIGHT and bul.flag & cs.FLAG_HIT_RIGHT ~= 0 then
		bul.direct = cs.DIR_LEFT
--		bBreak = true
	end

	if bBreak then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_SMOKE, cs.DIR_LEFT)
		cs.PlaySoundObject(cs.WAVE_SMOKE, 1)
		return
	end

	--start
	if bul.act_no == 0 then
		bul.act_no = 1
		if bul.direct == cs.DIR_LEFT then
			bul.xm = -2 * cs.VS
		elseif bul.direct == cs.DIR_UP then
			bul.xm = cs.gMC[1 + bul.tgt_mc].xm
			if cs.gMC[1 + bul.tgt_mc].xm < 0 then
				bul.direct = cs.DIR_LEFT
			else
				bul.direct = cs.DIR_RIGHT
			end
			if cs.gMC[1 + bul.tgt_mc].direct == cs.DIR_LEFT then
				bul.xm = bul.xm - cs.div(cs.VS, 4)
			else
				bul.xm = bul.xm + cs.div(cs.VS, 4)
			end
			bul.ym = -cs.MAX_MOVE
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm = 2 * cs.VS
		elseif bul.direct == cs.DIR_DOWN then
			bul.xm = cs.gMC[1 + bul.tgt_mc].xm
			if cs.gMC[1 + bul.tgt_mc].xm < 0 then
				bul.direct = cs.DIR_LEFT
			else
				bul.direct = cs.DIR_RIGHT
			end
			bul.ym =  cs.MAX_MOVE
		end
	else
		--移動
		if bul.flag & cs.FLAG_HIT_BOTTOM ~= 0 then
			bul.ym = -cs.VS * 2
		elseif bul.flag & cs.FLAG_HIT_LEFT ~= 0 then
			bul.xm =  2 * cs.VS
		elseif bul.flag & cs.FLAG_HIT_RIGHT ~= 0 then
			bul.xm = -2 * cs.VS
		end
		bul.ym = bul.ym + cs.div(cs.VS, 6)
		if bul.ym > 2 * cs.VS - 1 then
			bul.ym = cs.VS * 2 - 1
		end
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
		--効果音
		if bul.flag & (cs.FLAG_HIT_LEFT | cs.FLAG_HIT_RIGHT | cs.FLAG_HIT_BOTTOM) ~= 0 then
			cs.PlaySoundObject(cs.WAVE_FIRE, 1)
		end
	end

	local rect_left1 = {
		{left = 128, top =   0, right = 144, bottom =  16},
		{left = 144, top =   0, right = 160, bottom =  16},
		{left = 160, top =   0, right = 176, bottom =  16},
		{left = 176, top =   0, right = 192, bottom =  16},
	}
	local rect_right1 = {
		{left = 128, top =  16, right = 144, bottom =  32},
		{left = 144, top =  16, right = 160, bottom =  32},
		{left = 160, top =  16, right = 176, bottom =  32},
		{left = 176, top =  16, right = 192, bottom =  32},
	}

	local rect_left2 = {
		{left = 192, top =  16, right = 208, bottom =  32},
		{left = 208, top =  16, right = 224, bottom =  32},
		{left = 224, top =  16, right = 240, bottom =  32},
	}
	local rect_right2 = {
		{left = 224, top =  16, right = 240, bottom =  32},
		{left = 208, top =  16, right = 224, bottom =  32},
		{left = 192, top =  16, right = 208, bottom =  32},
	}

	bul.ani_no = bul.ani_no + 1
	if level == 1 then
		if bul.ani_no > 3 then
			bul.ani_no = 0
		end
		if bul.direct == cs.DIR_LEFT then
			bul.rect = rect_left1[1 + bul.ani_no]
		else
			bul.rect = rect_right1[1 + bul.ani_no]
		end
	else
		if bul.ani_no > 2 then
			bul.ani_no = 0
		end
		if bul.direct == cs.DIR_LEFT then
			bul.rect = rect_left2[1 + bul.ani_no]
		else
			bul.rect = rect_right2[1 + bul.ani_no]
		end
		if level == 2 then
			cs.SetNpChar(129, bul.x, bul.y, 0, -cs.VS, bul.ani_no,     nil, cs.div(cs.MAX_NPC, 2))
		else
			cs.SetNpChar(129, bul.x, bul.y, 0, -cs.VS, bul.ani_no + 3, nil, cs.div(cs.MAX_NPC, 2))
		end
	end
end

local function ActBullet_FireBall1(bul)
	ActBullet_FireBall(bul, 1)
end

return ActBullet_FireBall1
