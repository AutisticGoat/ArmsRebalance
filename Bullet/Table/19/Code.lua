--バブリン１号
local function ActBullet_Bubblin1(bul)
	if bul.flag & (cs.FLAG_HIT_BLOCK | cs.FLAG_HIT_X) ~= 0 then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_SMOKE, cs.DIR_LEFT)
		return
	end

	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			if bul.direct == cs.DIR_LEFT then
				bul.xm = -3 * cs.VS
			elseif bul.direct == cs.DIR_RIGHT then
				bul.xm =  3 * cs.VS
			elseif bul.direct == cs.DIR_UP then
				bul.ym = -3 * cs.VS
			elseif bul.direct == cs.DIR_DOWN then
				bul.ym =  3 * cs.VS
			end
		end
	end

	if bul.direct == cs.DIR_LEFT then
		bul.xm = bul.xm + cs.div(cs.VS, 12)
	elseif bul.direct == cs.DIR_RIGHT then
		bul.xm = bul.xm - cs.div(cs.VS, 12)
	elseif bul.direct == cs.DIR_UP then
		bul.ym = bul.ym + cs.div(cs.VS, 12)
	elseif bul.direct == cs.DIR_DOWN then
		bul.ym = bul.ym - cs.div(cs.VS, 12)
	end

	bul.x = bul.x + bul.xm
	bul.y = bul.y + bul.ym

	bul.act_wait = bul.act_wait + 1
	if bul.act_wait > 40 then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_BUBBLIN, cs.DIR_LEFT)
	end

	-- アニメ
	local rect = {
		{left = 192, top =   0, right = 200, bottom =   8},
		{left = 200, top =   0, right = 208, bottom =   8},
		{left = 208, top =   0, right = 216, bottom =   8},
		{left = 216, top =   0, right = 224, bottom =   8},
	}
	bul.ani_wait = bul.ani_wait + 1
	if bul.ani_wait > 3 then
		bul.ani_wait = 0
		bul.ani_no = bul.ani_no + 1
	end
	if bul.ani_no > 3 then
		bul.ani_no = 3
	end
	bul.rect = rect[1 + bul.ani_no]
end

return ActBullet_Bubblin1
