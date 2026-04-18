-- エッジ
local function ActBullet_Edge(bul)
	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			bul.y = bul.y - 12 * cs.VS
			if bul.direct == cs.DIR_LEFT then
				bul.x = bul.x + 16 * cs.VS
			else
				bul.x = bul.x - 16 * cs.VS
			end
		end
		bul.ani_wait = bul.ani_wait + 1
		if bul.ani_wait > 2 then
			bul.ani_wait = 0
			bul.ani_no = bul.ani_no + 1
		end
		if bul.direct == cs.DIR_LEFT then
			bul.x = bul.x - 2 * cs.VS
		else
			bul.x = bul.x + 2 * cs.VS
		end
		bul.y = bul.y + 2 * cs.VS

		if bul.ani_no == 1 then
			bul.damage = 2
		else
			bul.damage = 1
		end

		if bul.ani_no > 4 then
			bul.cond = 0
			return
		end
	end

	local rcLeft = {
		{left =   0, top =  64, right =  24, bottom =  88},
		{left =  24, top =  64, right =  48, bottom =  88},
		{left =  48, top =  64, right =  72, bottom =  88},
		{left =  72, top =  64, right =  96, bottom =  88},
		{left =  96, top =  64, right = 120, bottom =  88},
	}
	local rcRight = {
		{left =   0, top =  88, right =  24, bottom = 112},
		{left =  24, top =  88, right =  48, bottom = 112},
		{left =  48, top =  88, right =  72, bottom = 112},
		{left =  72, top =  88, right =  96, bottom = 112},
		{left =  96, top =  88, right = 120, bottom = 112},
	}

	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcLeft[ 1 + bul.ani_no]
	else
		bul.rect = rcRight[1 + bul.ani_no]
	end
end

return ActBullet_Edge
