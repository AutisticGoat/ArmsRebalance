-- スーパーボム
function ActBullet_SuperBom(bul, level)
	if bul.act_no == 0 or bul.act_no == 1 then
		if bul.act_no == 0 then
			bul.act_no = 1
			if level == 1 then
				bul.act_wait = 10
			elseif level == 2 then
				bul.act_wait = 14
			elseif level == 3 then
				bul.act_wait =  6
			end
			cs.PlaySoundObject(cs.WAVE_BOM, 1)
		end
		if level == 1 then
			if cs.mod(bul.act_wait, 3) == 0 then
				cs.SetDestroyNpCharUp(bul.x + cs.Random(-16, 16) * cs.VS,
				                      bul.y + cs.Random(-16, 16) * cs.VS, bul.enemyXL, 2)
			end
		elseif level == 2 then
			if cs.mod(bul.act_wait, 3) == 0 then
				cs.SetDestroyNpCharUp(bul.x + cs.Random(-32, 32) * cs.VS,
				                      bul.y + cs.Random(-32, 32) * cs.VS, bul.enemyXL, 2)
			end
		elseif level == 3 then
			if cs.mod(bul.act_wait, 3) == 0 then
				cs.SetDestroyNpCharUp(bul.x + cs.Random(-40, 40) * cs.VS,
				                      bul.y + cs.Random(-40, 40) * cs.VS, bul.enemyXL, 2)
			end
		end
--		if cs.mod(bul.act_wait, 5) == 0 then
--			cs.PlaySoundObject(cs.WAVE_BOM, 1)
--		end
		bul.act_wait = bul.act_wait - 1
		if bul.act_wait < 0 then
			bul.cond = 0
		end
	end
end
local function ActBullet_SuperBom1(bul)
	ActBullet_SuperBom(bul, 1)
end

return ActBullet_SuperBom1
