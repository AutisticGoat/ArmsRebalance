-- 落石
local function ActBullet_Drop(bul)
	local rc = {left =   0, top =   0, right =   0, bottom =   0}
	bul.act_wait = bul.act_wait + 1
	if bul.act_wait > 2 then
		bul.cond = 0
	end
	bul.rect = rc
end

return ActBullet_Drop
