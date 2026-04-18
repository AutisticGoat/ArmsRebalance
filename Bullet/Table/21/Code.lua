--バブリン３号
local function ActBullet_Bubblin3(bul)
	bul.act_wait = bul.act_wait + 1
	if bul.act_wait > 100 or cs.gKeyMC[1 + bul.tgt_mc] & cs.gKeyShot == 0 then
		bul.cond = 0
		cs.SetCaret(bul.x, bul.y, cs.CARET_SMOKE, cs.DIR_LEFT)
		cs.PlaySoundObject(cs.WAVE_SPINE, 1)
		if     cs.gMC[1 + bul.tgt_mc].up   then
			cs.SetBullet(bul.tgt_mc, cs.BULLET_SPINE, bul.x, bul.y, cs.DIR_UP)
		elseif cs.gMC[1 + bul.tgt_mc].down then
			cs.SetBullet(bul.tgt_mc, cs.BULLET_SPINE, bul.x, bul.y, cs.DIR_DOWN)
		else
			cs.SetBullet(bul.tgt_mc, cs.BULLET_SPINE, bul.x, bul.y, cs.gMC[1 + bul.tgt_mc].direct)
		end
		return
	end

	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			if bul.direct == cs.DIR_LEFT then
				bul.xm = cs.Random(-cs.VS * 2, -cs.VS * 1)
				bul.ym = cs.div(cs.Random(-4, 4) * cs.VS, 2)
			elseif bul.direct == cs.DIR_RIGHT then
				bul.xm = cs.Random(cs.VS * 1, cs.VS * 2)
				bul.ym = cs.div(cs.Random(-4, 4) * cs.VS, 2)
			elseif bul.direct == cs.DIR_UP then
				bul.ym = cs.Random(-cs.VS * 2, -cs.VS * 1)
				bul.xm = cs.div(cs.Random(-4, 4) * cs.VS, 2)
			elseif bul.direct == cs.DIR_DOWN then
				bul.ym = cs.Random(cs.div(cs.VS, 4), cs.div(cs.VS, 2))
				bul.xm = cs.div(cs.Random(-4, 4) * cs.VS, 2)
			end
		end
		
	end

	if bul.x < cs.gMC[1 + bul.tgt_mc].x then
		bul.xm = bul.xm + cs.div(cs.VS, 16)
	end
	if bul.x > cs.gMC[1 + bul.tgt_mc].x then
		bul.xm = bul.xm - cs.div(cs.VS, 16)
	end
	if bul.y < cs.gMC[1 + bul.tgt_mc].y then
		bul.ym = bul.ym + cs.div(cs.VS, 16)
	end
	if bul.y > cs.gMC[1 + bul.tgt_mc].y then
		bul.ym = bul.ym - cs.div(cs.VS, 16)
	end

	if bul.xm < 0 and bul.flag & cs.FLAG_HIT_LEFT ~= 0 then
		bul.xm = cs.VS * 2
	end
	if bul.xm > 0 and bul.flag & cs.FLAG_HIT_RIGHT ~= 0 then
		bul.xm = -cs.VS * 2
	end
	if bul.ym < 0 and bul.flag & cs.FLAG_HIT_TOP ~= 0 then
		bul.ym = cs.VS * 2
	end
	if bul.ym > 0 and bul.flag & cs.FLAG_HIT_BOTTOM ~= 0 then
		bul.ym = -cs.VS * 2
	end

	bul.x = bul.x + bul.xm
	bul.y = bul.y + bul.ym

	-- アニメ
	local rect = {
		{left = 240, top =  16, right = 248, bottom =  24},
		{left = 248, top =  16, right = 256, bottom =  24},
		{left = 240, top =  24, right = 248, bottom =  32},
		{left = 248, top =  24, right = 256, bottom =  32},
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

return ActBullet_Bubblin3
