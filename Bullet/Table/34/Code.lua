-- ネメシス
function ActBullet_Nemesis(bul, level)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end
	--start
	if bul.act_no == 0 then
		bul.act_no = 1
		bul.count1 = 0
		if bul.direct == cs.DIR_LEFT then
			bul.xm = -8 * cs.VS
		elseif bul.direct == cs.DIR_UP then
			bul.ym = -8 * cs.VS
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm =  8 * cs.VS
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym =  8 * cs.VS
		end
		if level == 1 then
			
		elseif level == 2 then
			
		elseif level == 3 then
			bul.xm = cs.div(bul.xm, 3)
			bul.ym = cs.div(bul.ym, 3)
		end
	else
		if level == 1 and cs.mod(bul.count1, 4) == 1 then
			if bul.direct == cs.DIR_LEFT then
				cs.SetNpChar(4, bul.x, bul.y, -cs.VS, cs.Random(-cs.VS, cs.VS), cs.DIR_RIGHT, nil, cs.div(cs.MAX_NPC, 2))
			elseif bul.direct == cs.DIR_UP then
				cs.SetNpChar(4, bul.x, bul.y, cs.Random(-cs.VS, cs.VS), -cs.VS, cs.DIR_RIGHT, nil, cs.div(cs.MAX_NPC, 2))
			elseif bul.direct == cs.DIR_RIGHT then
				cs.SetNpChar(4, bul.x, bul.y,  cs.VS, cs.Random(-cs.VS, cs.VS), cs.DIR_RIGHT, nil, cs.div(cs.MAX_NPC, 2))
			elseif bul.direct == cs.DIR_DOWN then
				cs.SetNpChar(4, bul.x, bul.y, cs.Random(-cs.VS, cs.VS),  cs.VS, cs.DIR_RIGHT, nil, cs.div(cs.MAX_NPC, 2))
			end
		end
		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end

	bul.ani_no = bul.ani_no + 1
	if bul.ani_no > 1 then
		bul.ani_no = 0
	end

	--アニメーション
	local rcL = {
		{left =   0, top = 112, right =  32, bottom = 128},
		{left =   0, top = 128, right =  32, bottom = 144},
	}
	local rcU = {
		{left =  32, top = 112, right =  48, bottom = 144},
		{left =  48, top = 112, right =  64, bottom = 144},
	}
	local rcR = {
		{left =  64, top = 112, right =  96, bottom = 128},
		{left =  64, top = 128, right =  96, bottom = 144},
	}
	local rcD = {
		{left =  96, top = 112, right = 112, bottom = 144},
		{left = 112, top = 112, right = 128, bottom = 144},
	}

	if bul.direct == cs.DIR_LEFT then
		bul.rect = rcL[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_UP then
		bul.rect = rcU[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_RIGHT then
		bul.rect = rcR[1 + bul.ani_no]
	elseif bul.direct == cs.DIR_DOWN then
		bul.rect = rcD[1 + bul.ani_no]
	end
	bul.rect.top    = bul.rect.top    +  32 * cs.div(level - 1, 2)
	bul.rect.bottom = bul.rect.bottom +  32 * cs.div(level - 1, 2)
	bul.rect.left   = bul.rect.left   + 128 * cs.mod(level - 1, 2)
	bul.rect.right  = bul.rect.right  + 128 * cs.mod(level - 1, 2)
end
local function ActBullet_Nemesis1(bul)
	ActBullet_Nemesis(bul, 1)
end

return ActBullet_Nemesis1
