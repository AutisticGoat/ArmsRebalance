--スネーク
local function ActBullet_Frontia1(bul)
	--時間消滅
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
			bul.xm = -3 * cs.VS
		elseif bul.direct == cs.DIR_UP then
			bul.ym = -3 * cs.VS
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm =  3 * cs.VS
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym =  3 * cs.VS
		end
	else
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
	if bul.ani_no > 3 then
		bul.ani_no = 0
	end

	local rcLeft = {
		{left = 136, top =  80, right = 152, bottom =  96},
		{left = 120, top =  80, right = 136, bottom =  96},
		{left = 136, top =  64, right = 152, bottom =  80},
		{left = 120, top =  64, right = 136, bottom =  80},
	}
	local rcRight = {
		{left = 120, top =  64, right = 136, bottom =  80},
		{left = 136, top =  64, right = 152, bottom =  80},
		{left = 120, top =  80, right = 136, bottom =  96},
		{left = 136, top =  80, right = 152, bottom =  96},
	}
	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcLeft[ 1 + bul.ani_no]
	else
		bul.rect = rcRight[1 + bul.ani_no]
	end

--	cs.SetNpChar(129, bul.x, bul.y, 0, 0, bul.ani_no,   nil, cs.div(cs.MAX_NPC, 2))
end

return ActBullet_Frontia1
