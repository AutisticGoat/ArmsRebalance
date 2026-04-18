local inc = 0

-- スーパーミサイル
function ActBullet_SuperMissile(bul, level)
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
		cs.SetBullet(bul.tgt_mc, cs.BULLET_SUPERBOM1 + level - 1, bul.x, bul.y, cs.DIR_LEFT)
		bul.cond = 0
	end

	--start
	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
				bul.tgt_y = bul.y
				bul.enemyXL = 8 * cs.VS
				bul.blockXL = 8 * cs.VS
			elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
				bul.tgt_x = bul.x
				bul.enemyYL = 8 * cs.VS
				bul.blockYL = 8 * cs.VS
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
					bul.ani_no = cs.VS
				elseif cs.mod(inc, 3) == 1 then
					bul.ani_no = cs.div(cs.VS, 2)
				elseif cs.mod(inc, 3) == 2 then
					bul.ani_no = cs.div(cs.VS, 3)
				end
			else
				bul.ani_no = cs.div(cs.VS, 1)
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
					bul.ym = bul.ym + cs.div(cs.VS, 8)
				else
					bul.ym = bul.ym - cs.div(cs.VS, 8)
				end
			elseif bul.direct == cs.DIR_UP or bul.direct == cs.DIR_DOWN then
				if bul.x < bul.tgt_x then
					bul.xm = bul.xm + cs.div(cs.VS, 8)
				else
					bul.xm = bul.xm - cs.div(cs.VS, 8)
				end
			end
		end

		if bul.xm < -cs.VS * 10 then
			bul.xm = -cs.VS * 10
		end
		if bul.xm > cs.VS * 10 then
			bul.xm =  cs.VS * 10
		end
		if bul.ym < -cs.VS * 10 then
			bul.ym = -cs.VS * 10
		end
		if bul.ym > cs.VS * 10 then
			bul.ym =  cs.VS * 10
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
		{left = 120, top =  96, right = 136, bottom = 112}, -- ←
		{left = 136, top =  96, right = 152, bottom = 112}, -- ↑
		{left = 152, top =  96, right = 168, bottom = 112}, -- →
		{left = 168, top =  96, right = 184, bottom = 112}, -- ↓
	}
	local rect2 = {
		{left = 184, top =  96, right = 200, bottom = 112}, -- ←
		{left = 200, top =  96, right = 216, bottom = 112}, -- ↑
		{left = 216, top =  96, right = 232, bottom = 112}, -- →
		{left = 232, top =  96, right = 248, bottom = 112}, -- ↓
	}
	if level == 1 then
		bul.rect = rect1[1 + bul.direct]
	elseif level == 2 then
		bul.rect = rect2[1 + bul.direct]
	elseif level == 3 then
		bul.rect = rect1[1 + bul.direct]
	end
end
local function ActBullet_SuperMissile1(bul)
	ActBullet_SuperMissile(bul, 1)
end

return ActBullet_SuperMissile1
