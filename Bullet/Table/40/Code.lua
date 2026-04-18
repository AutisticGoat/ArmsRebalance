function ActBullet_SpurTail(bul, level)
	bul.count1 = bul.count1 + 1
	if bul.count1 > 20 then
		bul.ani_no = bul.count1 - 20
	end
	if bul.ani_no > 2 then
		bul.cond = 0
		return
	end

	if bul.damage ~= 0 and bul.life ~= 100 then
		bul.damage = 0
	end

	local rc_h_lv1 = {
		{left = 192, top =  32, right = 200, bottom =  40},
		{left = 200, top =  32, right = 208, bottom =  40},
		{left = 208, top =  32, right = 216, bottom =  40},
	}
	local rc_v_lv1 = {
		{left = 192, top =  40, right = 200, bottom =  48},
		{left = 200, top =  40, right = 208, bottom =  48},
		{left = 208, top =  40, right = 216, bottom =  48},
	}
	local rc_h_lv2 = {
		{left = 216, top =  32, right = 224, bottom =  40},
		{left = 224, top =  32, right = 232, bottom =  40},
		{left = 232, top =  32, right = 240, bottom =  40},
	}
	local rc_v_lv2 = {
		{left = 216, top =  40, right = 224, bottom =  48},
		{left = 224, top =  40, right = 232, bottom =  48},
		{left = 232, top =  40, right = 240, bottom =  48},
	}
	local rc_h_lv3 = {
		{left = 240, top =  32, right = 248, bottom =  40},
		{left = 248, top =  32, right = 256, bottom =  40},
		{left = 256, top =  32, right = 264, bottom =  40},
	}
	local rc_v_lv3 = {
		{left = 240, top =  32, right = 248, bottom =  40},
		{left = 248, top =  32, right = 256, bottom =  40},
		{left = 256, top =  32, right = 264, bottom =  40},
	}
	if level == 1 then
		if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
			bul.rect = rc_h_lv1[1 + bul.ani_no]
		else
			bul.rect = rc_v_lv1[1 + bul.ani_no]
		end
	elseif level == 2 then
		if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
			bul.rect = rc_h_lv2[1 + bul.ani_no]
		else
			bul.rect = rc_v_lv2[1 + bul.ani_no]
		end
	elseif level == 3 then
		if bul.direct == cs.DIR_LEFT or bul.direct == cs.DIR_RIGHT then
			bul.rect = rc_h_lv3[1 + bul.ani_no]
		else
			bul.rect = rc_v_lv3[1 + bul.ani_no]
		end
	end
end

local function ActBullet_SpurTail1(bul)
	ActBullet_SpurTail(bul, 1)
end

return ActBullet_SpurTail1
