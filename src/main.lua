function drawBackground()
	--love.graphics.setColor(48, 156, 225)
	--love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

	love.graphics.setColor(35, 65, 85)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function drawForground()
	love.graphics.setColor(255, 0, 0) --red
	love.graphics.rectangle("fill", 10, 10, 17, 27) --x,y,width,height
end

function love.load()
	love.graphics.setBackgroundColor(35, 65, 85)

	local LightWorld = require "lib.light_world"
	lightWorld = LightWorld({
		drawBackground = drawBackground,
		drawForground = drawForground,
		ambient = {55, 55, 55}
	})

	--box = lightWorld:newBox() ??
	light = lightWorld:newLight(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 255, 150, 100, 600) -- I don't know what any of these values do
	--thompson = lightWorld:newRectangle(100, 100, 255, 0, 0, 17, 27)
	thompson = lightWorld:newRectangle(100, 100, 17, 27)
	lightWorld:newRectangle(700, 300, 10, 20)
	lightWorld:newRectangle(200,5,5,5)
end

function love.update()
	love.window.setTitle("Thompson Was a Clone (FPS:" .. love.timer.getFPS() .. ")")
end

function love.draw()
	lightWorld:draw(0, 0, 1)
	--[[love.graphics.push()
	love.graphics.translate(0, 0)
	love.graphics.scale(1)
	lightWorld:draw(0, 0, 1)
	love.graphics.pop()]]
end
