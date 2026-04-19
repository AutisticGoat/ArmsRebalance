local inc = 0

--スネーク
function ActBullet_Frontia2And3(bul, level)
	--時間消滅
	if cs.IsMaxExpMyChar(bul.tgt_mc) then
		bul.damage = 12
		bul.life_count = 40
	end

	bul.count1 = bul.count1 + 1

	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end


	--start
	if bul.act_no == 0 then
		bul.ani_no = cs.Random(0, 2)
		bul.act_no = 1
		if bul.direct == cs.DIR_LEFT then
			bul.xm = -1 * cs.VS
		elseif bul.direct == cs.DIR_UP then
			bul.ym = -1 * cs.VS
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm =  1 * cs.VS
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym =  1 * cs.VS
		end

		inc = inc + 1
		if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
			if cs.mod(inc, 2) ~= 0 then
				bul.ym =  cs.VS * 2
			else
				bul.ym = -cs.VS * 2
			end
		elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
			if cs.mod(inc, 2) ~= 0 then
				bul.xm =  cs.VS * 2
			else
				bul.xm = -cs.VS * 2
			end
		end
	else
		if bul.direct == cs.DIR_LEFT then
			bul.xm = bul.xm + cs.div(-cs.VS, 4)
		elseif bul.direct == cs.DIR_UP then
			bul.ym = bul.ym + cs.div(-cs.VS, 4)
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm = bul.xm + cs.div( cs.VS, 4)
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym = bul.ym + cs.div( cs.VS, 4)
		end
		if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
			if cs.mod(bul.count1, 5) == 2 then
				if bul.ym < 0 then
					bul.ym =  cs.VS * 1.25
				else
					bul.ym = -cs.VS * 1.25
				end
			end
		elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
			if cs.mod(bul.count1, 5) == 2 then
				if bul.xm < 0 then
					bul.xm =  cs.VS * 1.25
				else
					bul.xm = -cs.VS * 1.25
				end
			end
		end

		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end

	--アニメーション
	bul.ani_wait = bul.ani_wait + 1
	if bul.ani_wait > 0 then
		bul.ani_wait = 0
		bul.ani_no = bul.ani_no + 1
	end
	if bul.ani_no > 2 then
		bul.ani_no = 0
	end

	local rect = {
		{left = 192, top =  16, right = 208, bottom =  32},
		{left = 208, top =  16, right = 224, bottom =  32},
		{left = 224, top =  16, right = 240, bottom =  32},
	}
	bul.rect = rect[1 + bul.ani_no]
	if level == 2 then
		cs.SetNpChar(129, bul.x, bul.y, 0, -cs.VS, bul.ani_no,     nil, cs.div(cs.MAX_NPC, 2))
	else
		cs.SetNpChar(129, bul.x, bul.y, 0, -cs.VS, bul.ani_no + 3, nil, cs.div(cs.MAX_NPC, 2))
	end
end

local function ActBullet_Frontia2(bul)
	ActBullet_Frontia2And3(bul, 2)
end

return ActBullet_Frontia2
