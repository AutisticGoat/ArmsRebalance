local inc = 0

-- ミサイル
function ActBullet_Missile(bul, level)
	local bHit

	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_FLASH, cs.DIR_LEFT)
		return
	end

	bHit = false

	if bul.life ~= 10 then
		bHit = true
	end
	if bul.direct == cs.DIR_LEFT  and bul.flag & cs.FLAG_HIT_LEFT   ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_RIGHT and bul.flag & cs.FLAG_HIT_RIGHT  ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_UP    and bul.flag & cs.FLAG_HIT_TOP    ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_DOWN  and bul.flag & cs.FLAG_HIT_BOTTOM ~= 0 then
		bHit = true
	end

	if bul.direct == cs.DIR_LEFT  and bul.flag & cs.FLAG_HIT_RUP    ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_LEFT  and bul.flag & cs.FLAG_HIT_RDOWN  ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_RIGHT and bul.flag & cs.FLAG_HIT_LUP    ~= 0 then
		bHit = true
	end
	if bul.direct == cs.DIR_RIGHT and bul.flag & cs.FLAG_HIT_LDOWN  ~= 0 then
		bHit = true
	end

	if bHit then
		cs.SetBullet(bul.tgt_mc, cs.BULLET_BOM1 + level - 1, bul.x, bul.y, cs.DIR_LEFT)
		bul.cond = 0
	end

	--start
	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
				bul.tgt_y = bul.y
			elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
				bul.tgt_x = bul.x
			end
			if level == 3 then
				if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
					if bul.y > cs.gMC[1 + bul.tgt_mc].y then
						bul.ym = cs.div( cs.VS, 2)
					else
						bul.ym = cs.div(-cs.VS, 2)
					end
					bul.xm = cs.Random(-cs.VS, cs.VS)
				elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
					if bul.x > cs.gMC[1 + bul.tgt_mc].x then
						bul.xm = cs.div( cs.VS, 2)
					else
						bul.xm = cs.div(-cs.VS, 2)
					end
					bul.ym = cs.Random(-cs.VS, cs.VS)
				end
				inc = inc + 1
				if cs.mod(inc, 3) == 0 then
					bul.ani_no = cs.div(cs.VS, 4)
				elseif cs.mod(inc, 3) == 1 then
					bul.ani_no = cs.div(cs.VS, 8)
				elseif cs.mod(inc, 3) == 2 then
					bul.ani_no = cs.div(cs.VS, 10)
				end
			else
				bul.ani_no = cs.div(cs.VS, 4)
			end
		end

		if bul.direct == cs.DIR_LEFT then
			bul.xm = bul.xm + -bul.ani_no
		elseif bul.direct == cs.DIR_UP then
			bul.ym = bul.ym + -bul.ani_no
		elseif bul.direct == cs.DIR_RIGHT then
			bul.xm = bul.xm + bul.ani_no
		elseif bul.direct == cs.DIR_DOWN then
			bul.ym = bul.ym + bul.ani_no
		end

		if level == 3 then
			if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
				if bul.y < bul.tgt_y then
					bul.ym = bul.ym + cs.div(cs.VS, 16)
				else
					bul.ym = bul.ym - cs.div(cs.VS, 16)
				end
			elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
				if bul.x < bul.tgt_x then
					bul.xm = bul.xm + cs.div(cs.VS, 16)
				else
					bul.xm = bul.xm - cs.div(cs.VS, 16)
				end
			end
		end

		if bul.xm < -cs.VS * 5 then
			bul.xm = -cs.VS * 5
		end
		if bul.xm > cs.VS * 5 then
			bul.xm =  cs.VS * 5
		end
		if bul.ym < -cs.VS * 5 then
			bul.ym = -cs.VS * 5
		end
		if bul.ym > cs.VS * 5 then
			bul.ym =  cs.VS * 5
		end
		--移動
		bul.x = bul.x + bul.xm
		bul.y = bul.y + bul.ym
	end
	bul.count2 = bul.count2 + 1
	if bul.count2 > 2 then
		bul.count2 = 0
		if bul.direct == 0 then
			cs.SetCaret(bul.x + 8 * cs.VS, bul.y, cs.CARET_MISSILE, cs.DIR_RIGHT)
		elseif bul.direct == 1 then
			cs.SetCaret(bul.x, bul.y + 8 * cs.VS, cs.CARET_MISSILE, cs.DIR_DOWN)
		elseif bul.direct == 2 then
			cs.SetCaret(bul.x - 8 * cs.VS, bul.y, cs.CARET_MISSILE, cs.DIR_LEFT)
		elseif bul.direct == 3 then
			cs.SetCaret(bul.x, bul.y - 8 * cs.VS, cs.CARET_MISSILE, cs.DIR_UP)
		end
	end

	--アニメーション
	local rect1 = {
		{left =   0, top =   0, right =  16, bottom =  16}, -- ←
		{left =  16, top =   0, right =  32, bottom =  16}, -- ↑
		{left =  32, top =   0, right =  48, bottom =  16}, -- →
		{left =  48, top =   0, right =  64, bottom =  16}, -- ↓
	}
	local rect2 = {
		{left =   0, top =  16, right =  16, bottom =  32}, -- ←
		{left =  16, top =  16, right =  32, bottom =  32}, -- ↑
		{left =  32, top =  16, right =  48, bottom =  32}, -- →
		{left =  48, top =  16, right =  64, bottom =  32}, -- ↓
	}
	local rect3 = {
		{left =   0, top =  32, right =  16, bottom =  48}, -- ←
		{left =  16, top =  32, right =  32, bottom =  48}, -- ↑
		{left =  32, top =  32, right =  48, bottom =  48}, -- →
		{left =  48, top =  32, right =  64, bottom =  48}, -- ↓
	}
	if level == 1 then
		bul.rect = rect1[1 + bul.direct]
	elseif level == 2 then
		bul.rect = rect2[1 + bul.direct]
	elseif level == 3 then
		bul.rect = rect3[1 + bul.direct]
	end
end

local function ActBullet_Missile1(bul)
	ActBullet_Missile(bul, 1)
end

return ActBullet_Missile1
