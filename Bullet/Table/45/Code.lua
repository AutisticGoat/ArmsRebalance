local function ActBullet_Star(bul)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		return
	end
end

return ActBullet_Star
