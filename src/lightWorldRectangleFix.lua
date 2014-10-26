function lightWorldRectangleFix(world, x, y, w, h)
	-- add half of width/height because lightWorld uses centered rectangles
	local shadow = world:newRectangle(x + w / 2, y + h / 2, w, h)
	-- fix ox/oy, width, height
	shadow.ox = w / 2
	shadow.oy = h / 2
	shadow.width = w
	shadow.height = h
	-- fix data object
	shadow.data = {
		--4 pairs x/y, clockwise
		x, y,
		x + w, y,
		x + w, y + h,
		x, y + h
	}
	return shadow
end
