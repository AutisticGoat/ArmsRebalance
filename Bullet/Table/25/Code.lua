--ブレード 1
local function ActBullet_Sword1(bul)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end
	if bul.count1 == 3 then
		bul.bbits = bul.bbits & ~cs.BBITS_THROWMAP
	end
	if cs.mod(bul.count1, 5) == 1 then
		cs.PlaySoundObject(cs.WAVE_FIRE, 1)
	end
	--start
	if bul.act_no == 0 then
		bul.act_no = 1
		if bul.direct == cs.DIR_LEFT then
			bul.xm = -4 * cs.VS
		elseif bul.direct == cs.DIR_UP then
			bul.ym = -4 * cs.VS
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm =  4 * cs.VS
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym =  4 * cs.VS
		end
	else
		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end

	--アニメーション
	local rcLeft = {
		{left =   0, top =  48, right =  16, bottom =  64},
		{left =  16, top =  48, right =  32, bottom =  64},
		{left =  32, top =  48, right =  48, bottom =  64},
		{left =  48, top =  48, right =  64, bottom =  64},
	}
	local rcRight = {
		{left =  64, top =  48, right =  80, bottom =  64},
		{left =  80, top =  48, right =  96, bottom =  64},
		{left =  96, top =  48, right = 112, bottom =  64},
		{left = 112, top =  48, right = 128, bottom =  64},
	}

	bul.ani_wait = bul.ani_wait + 1
	if bul.ani_wait > 1 then
		bul.ani_wait = 0
		bul.ani_no = bul.ani_no + 1
	end
	if bul.ani_no > 3 then
		bul.ani_no = 0
	end

	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcLeft[1 + bul.ani_no]
	else
		bul.rect = rcRight[1 + bul.ani_no]
	end
end

return ActBullet_Sword1
