--スピン
local function ActBullet_Spine(bul)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count or bul.flag & cs.FLAG_HIT_BOTTOM ~= 0 then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end

	if bul.count1 == 1 and cs.IsMaxExpMyChar(bul.tgt_mc) then
		bul.life_count = 40
		bul.damage = 2
	end

	--start
	if bul.act_no == 0 then
		bul.act_no = 1
		if bul.direct == cs.DIR_LEFT then
			bul.xm = cs.div(-cs.Random(5 * 2, 8 * 2) * cs.VS, 2)
		elseif bul.direct == cs.DIR_UP then
			bul.ym = cs.div(-cs.Random(5 * 2, 8 * 2) * cs.VS, 2)
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm = cs.div(cs.Random(5 * 2, 8 * 2) * cs.VS, 2)
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym = cs.div(cs.Random(5 * 2, 8 * 2) * cs.VS, 2)
		end
	else
		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end

	-- アニメーション
	bul.ani_wait = bul.ani_wait + 1
	if bul.ani_wait > 1 then
		bul.ani_wait = 0
		bul.ani_no = bul.ani_no + 1
	end
	if bul.ani_no > 1 then
		bul.ani_no = 0
	end

	local rcLeft = {
		{left = 224, top =   0, right = 232, bottom =   8},
		{left = 232, top =   0, right = 240, bottom =   8},
	}
	local rcRight = {
		{left = 224, top =   0, right = 232, bottom =   8},
		{left = 232, top =   0, right = 240, bottom =   8},
	}
	local rcDown = {
		{left = 224, top =   8, right = 232, bottom =  16},
		{left = 232, top =   8, right = 240, bottom =  16},
	}

	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcLeft[ 1 + bul.ani_no]
	elseif bul.direct == cs.DIR_UP then
		bul.rect = rcDown[ 1 + bul.ani_no]
	elseif bul.direct == cs.DIR_RIGHT then
		bul.rect = rcRight[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_DOWN then
		bul.rect = rcDown[ 1 + bul.ani_no]
	end
end

return ActBullet_Spine
