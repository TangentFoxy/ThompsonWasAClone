function love.load()
	require "lightWorldRectangleFix"

	local LightWorld = require "lib.light_world"
	lightWorld = LightWorld({
		drawBackground = drawBackground,
		drawForground = drawForeground,
		ambient = {60, 60, 60}
	})

	light = lightWorld:newLight(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 255, 150, 100, 600) --x,y,r,g,b,radius

	bgColor = {35, 65, 85}

	thompson = {
		color = {255, 0, 0},
		x = 50,
		y = 50,
		w = 17,
		h = 27
	}
	thompson.shadow = lightWorldRectangleFix(lightWorld, thompson.x, thompson.y, thompson.w, thompson.h)
end

function love.update(dt)
	love.window.setTitle("Thompson Was a Clone (FPS:" .. love.timer.getFPS() .. ")") --for testing purposes only
end

function love.draw()
	lightWorld:draw(0, 0, 1)
	--drawBackground()
	--drawForeground()
end

function drawBackground()
	love.graphics.setColor(bgColor)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function drawForeground()
	love.graphics.setColor(thompson.color)
	love.graphics.rectangle("fill", thompson.x, thompson.y, thompson.w, thompson.h)
	--[[
	love.graphics.setColor(255, 0, 0) --red
	love.graphics.rectangle("fill", 10, 10, 17, 27) --x,y,width,height]]
end
