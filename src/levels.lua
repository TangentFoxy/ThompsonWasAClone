local LightWorld = require "lib.LightWorld"
require "lightWorldRectangleFix"

local Object = {}
Object.__index = Object

function Object.new(x, y, w, h)
	local self = {
		x = x, y = y,
		w = w, h = h,
		shadow = lightWorldRectangleFix(lightWorld, x, y, w, h)
	}
	return self
end

level = {
	function()
		lightWorld = LightWorld({
			drawBackground = drawBackground,
			drawForground = drawForeground,
			ambient = {80, 80, 100} --previously 60,60,60
		})
		lightWorld.blur = 0

		bgColor = {35, 65, 85}

		lights = {
			lightWorld:newLight(love.graphics.getWidth() / 2 - 35, love.graphics.getHeight() / 2, 255, 150, 100, 650)
		} --x,y,r,g,b,radius

		thompson = {
			color = {255, 0, 0},
			x = 30,
			y = love.graphics.getHeight() - 73 -15 - 27, --15 above bottom, 27 is because height of thompson
			w = 17,
			h = 27,
			v = {0, 0}
		}
		thompson.shadow = lightWorldRectangleFix(lightWorld, thompson.x, thompson.y, thompson.w, thompson.h)
		thompson.fixShadowPosition = function()
			thompson.shadow.x = thompson.x + thompson.w / 2
			thompson.shadow.y = thompson.y + thompson.h / 2
			thompson.shadow.data = {
				thompson.x, thompson.y,
				thompson.x + thompson.w, thompson.y,
				thompson.x + thompson.w, thompson.y + thompson.h,
				thompson.x, thompson.y + thompson.h
			}
		end

		objects = {
			Object.new(0, 0, love.graphics.getWidth(), 15),
			Object.new(0, 0, 15, love.graphics.getHeight()),
			Object.new(0, love.graphics.getHeight() - 15, love.graphics.getWidth(), 15),
			Object.new(love.graphics.getWidth() - 15, 0, 15, love.graphics.getHeight()),

			Object.new(100, love.graphics.getHeight() - 60 - 50, 50, 50),
			Object.new(420, love.graphics.getHeight() - 170 - 50, 50, 50),
			Object.new(431, love.graphics.getHeight() - 33 - 50, 49, 49),
			Object.new(276, love.graphics.getHeight() - 85 - 50, 51, 51),
			Object.new(27, love.graphics.getHeight() - 167 - 50, 47, 47),
			Object.new(677, love.graphics.getHeight() - 81 - 50, 52, 52),
			Object.new(628, love.graphics.getHeight() - 107 - 50, 49, 49),
			Object.new(597, love.graphics.getHeight() - 223 - 50, 46, 46),
			Object.new(311, love.graphics.getHeight() - 272 - 50, 53, 53),
			Object.new(700, 68, 50, 50),
			Object.new(140, 129, 47, 47),
			Object.new(503, 83, 53, 53),

			--remember we have 770x370 to work with (minus 30 because of walls)
			--[[lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),
			lightWorldRectangleFix(lightWorld, x, y, w, h),]]
		}

		goal = {
			x = 711,
			y = 40,
			w = thompson.w + 2,
			h = thompson.h + 2
		}
		goal.collider = {
			x = goal.x + goal.w / 2 - 1.5,
			y = goal.y + goal.h / 2 - 1.5,
			w = 3, h = 3
		}
		--[[goal = lightWorldRectangleFix(lightWorld, 700, 20, thompson.w + 2, thompson.h + 2)
		goal.glowStrength = 5
		for k,v in pairs(goal) do
			print(k.."="..tostring(v))
		end]]
	end,
}
