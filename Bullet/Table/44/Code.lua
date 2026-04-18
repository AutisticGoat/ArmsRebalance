local function ActBullet_EnemyClear(bul)
	--時間消滅
	bul.count1 = bul.count1 + 1
	if bul.count1 > bul.life_count then
		bul.cond = 0
		return
	end
	bul.damage = 10000
	bul.enemyXL = cs.VS * cs.PARTSSIZE * 100
	bul.enemyYL = cs.VS * cs.PARTSSIZE * 100
end

return ActBullet_EnemyClear
