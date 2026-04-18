--シュプール
function ActBullet_Spur(bul, level)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end

	if bul.damage ~= 0 and bul.life ~= 100 then
		bul.damage = 0
	end
	--start
	if bul.act_no == 0 then
		bul.act_no = 1
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
			if bul.direct == cs.DIR_LEFT then
				bul.enemyYL = 2 * cs.VS
			elseif bul.direct == cs.DIR_UP then
				bul.enemyXL = 2 * cs.VS
			elseif bul.direct == cs.DIR_RIGHT then
				bul.enemyYL = 2 * cs.VS
			elseif bul.direct == cs.DIR_DOWN then
				bul.enemyXL = 2 * cs.VS
			end
		elseif level == 2 then
			if bul.direct == cs.DIR_LEFT then
				bul.enemyYL = 4 * cs.VS
			elseif bul.direct == cs.DIR_UP then
				bul.enemyXL = 4 * cs.VS
			elseif bul.direct == cs.DIR_RIGHT then
				bul.enemyYL = 4 * cs.VS
			elseif bul.direct == cs.DIR_DOWN then
				bul.enemyXL = 4 * cs.VS
			end
		end
	else
		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end

	--アニメーション
	local rect1 = {
		{left = 128, top =  32, right = 144, bottom =  48},
		{left = 144, top =  32, right = 160, bottom =  48},
	}
	local rect2 = {
		{left = 160, top =  32, right = 176, bottom =  48},
		{left = 176, top =  32, right = 192, bottom =  48},
	}
	local rect3 = {
		{left = 128, top =  48, right = 144, bottom =  64},
		{left = 144, top =  48, right = 160, bottom =  64},
	}
	bul.damage = bul.life

	if level == 1 then
		if bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
			bul.rect = rect1[2]
		else
			bul.rect = rect1[1]
		end
	elseif level == 2 then
		if bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
			bul.rect = rect2[2]
		else
			bul.rect = rect2[1]
		end
	elseif level == 3 then
		if bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
			bul.rect = rect3[2]
		else
			bul.rect = rect3[1]
		end
	end
	cs.SetBullet(bul.tgt_mc, cs.BULLET_SPURTAIL1 + level - 1, bul.x, bul.y, bul.direct)
end
local function ActBullet_Spur1(bul)
	ActBullet_Spur(bul, 1)
end

return ActBullet_Spur1
