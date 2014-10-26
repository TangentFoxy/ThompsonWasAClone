function love.draw()
	lightWorld:draw(0, 0, 1)

	-- goal
	love.graphics.setColor(255, 255, 255)
	love.graphics.setLineWidth(2)
	love.graphics.rectangle("line", goal.x, goal.y, goal.w, goal.h)

	-- thompson
	love.graphics.setColor(thompson.color)
	love.graphics.rectangle("fill", thompson.x, thompson.y, thompson.w, thompson.h)
end

function drawBackground()
	love.graphics.setColor(bgColor)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

	-- objects
	love.graphics.setColor(0, 0, 0)
	for i=1,#objects do
		--love.graphics.rectangle("fill", objects[i].x - objects[i].width / 2, objects[i].y - objects[i].height / 2, objects[i].width, objects[i].height)
		love.graphics.rectangle("fill", objects[i].x, objects[i].y, objects[i].w, objects[i].h)
	end

	-- goal
	--[[love.graphics.setColor(255, 255, 255)
	love.graphics.setLineWidth(2)
	love.graphics.rectangle("line", goal.x, goal.y, goal.w, goal.h)]]
end

function drawForeground()
	--nothing
end
