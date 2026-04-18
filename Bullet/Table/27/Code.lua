local function ActBullet_Sword3(bul)
	local rcLeft = {
		{left = 272, top =   0, right = 296, bottom =  24},
		{left = 296, top =   0, right = 320, bottom =  24},
	}
	local rcUp = {
		{left = 272, top =  48, right = 296, bottom =  72},
		{left = 296, top =   0, right = 320, bottom =  24},
	}
	local rcRight = {
		{left = 272, top =  24, right = 296, bottom =  48},
		{left = 296, top =  24, right = 320, bottom =  48},
	}
	local rcDown = {
		{left = 296, top =  48, right = 320, bottom =  72},
		{left = 296, top =  24, right = 320, bottom =  48},
	}

	--start
	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			bul.xm = 0
			bul.ym = 0
		end
		if bul.direct == cs.DIR_LEFT then
			bul.xm = -cs.VS * 4
		elseif bul.direct == cs.DIR_UP then
			bul.ym = -cs.VS * 4
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm = cs.VS * 4
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym = cs.VS * 4
		end
		if bul.life ~= 100 then
			bul.act_no  = 2
			bul.ani_no  = 1
			bul.damage  = -1
			bul.act_wait = 0
		end
		bul.act_wait = bul.act_wait + 1
		if cs.mod(bul.act_wait, 4) == 1 then
			cs.PlaySoundObject(cs.WAVE_SWORD, 1)
			bul.count1 = bul.count1 + 1
			if cs.mod(bul.count1, 2) ~= 0 then
				cs.SetBullet(bul.tgt_mc, cs.BULLET_EDGE, bul.x, bul.y, cs.DIR_LEFT)
			else
				cs.SetBullet(bul.tgt_mc, cs.BULLET_EDGE, bul.x, bul.y, cs.DIR_RIGHT)
			end
		end
		--時間消滅
		bul.count1 = bul.count1 + 1
		if bul.count1 == 5 then
			bul.bbits = bul.bbits & ~cs.BBITS_THROWMAP
		end
		if bul.count1 > bul.life_count then
			bul.cond = 0
			cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
			return
		end
	elseif bul.act_no == 2 then
		bul.xm = 0
		bul.ym = 0
		bul.act_wait = bul.act_wait + 1

		-- if 0 == cs.Random(-1, 1) then
			cs.PlaySoundObject(cs.WAVE_SWORD, 1)
			if cs.mod(cs.Random(0, 1), 2) ~= 0 then
				cs.SetBullet(bul.tgt_mc, cs.BULLET_EDGE, bul.x + cs.Random(-64, 64) * cs.VS, bul.y + cs.Random(-64, 64) * cs.VS, cs.DIR_LEFT)
			else
				cs.SetBullet(bul.tgt_mc, cs.BULLET_EDGE, bul.x + cs.Random(-64, 64) * cs.VS, bul.y + cs.Random(-64, 64) * cs.VS, cs.DIR_RIGHT)
			end
		-- end
		if bul.act_wait > 50 then
			bul.cond = 0
		end
	end
	--移動
	bul.x = bul.x + bul.xm
	bul.y = bul.y + bul.ym
	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcLeft[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_UP then
		bul.rect = rcUp[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_RIGHT then
		bul.rect = rcRight[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_DOWN then
		bul.rect = rcDown[1 + bul.ani_no]
	end

	if cs.mod(bul.act_wait, 2) ~= 0 then
		bul.rect.right = 0
	end
end

return ActBullet_Sword3
