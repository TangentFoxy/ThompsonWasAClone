function love.load()
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
		--[[x = 50,
		y = 50,
		w = 17,
		h = 27]]
		x = 500,
		y = 50,
		w = 170,
		h = 27
	}
	thompson.shadow = lightWorld:newRectangle(thompson.x + thompson.w / 2, thompson.y + thompson.h / 2, thompson.w, thompson.h)
	-- work arounds for broken constructor
	thompson.shadow.ox = thompson.w / 2--* 2--/ 2
	thompson.shadow.oy = thompson.h / 2--* 2--/ 2
	thompson.shadow.width = thompson.w
	thompson.shadow.height = thompson.h
	thompson.shadow.data = {
		--8 values, 4 x/y pairs, start at top left, clockwise
		thompson.x,
		thompson.y,
		thompson.x + thompson.w,
		thompson.y,
		thompson.x + thompson.w,
		thompson.y + thompson.h,
		thompson.x,
		thompson.y + thompson.h
	}

	-- temp logging for attempt to resolve issues
	for k,v in pairs(thompson.shadow) do
		print(k.."="..tostring(v))
	end
	for k,v in pairs(thompson.shadow.data) do
		print(k.."="..tostring(v))
	end
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
