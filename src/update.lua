local g = 890
local fudgeFactor = 0.8
local timer = 0
local lightSway = true
local levelBeat = false
local currentLevel = 1

local function checkAABB(A, B)
	--if A
	if  A.x + A.w < B.x or
		A.y + A.h < B.y or
		A.x > B.x + B.w or
		A.y > B.y + B.h
	then return false end
	return true
end

local function approxEqual(A, B)
	local epsilon = 0.002
	return math.abs(A-B) < epsilon
end

function love.update(dt)
	love.window.setTitle("Thompson Was a Clone (FPS:" .. love.timer.getFPS() .. ")") --for testing purposes only
	if dt > 0.002 then dt = 0.002 end
	timer = timer + dt

	-- adjust light position based on timer
	if lightSway then
		lights[1].x = lights[1].x + timer * 0.002
	else
		lights[1].x = lights[1].x - timer * 0.002
	end
	if timer > 9 then
		timer = 0
		lightSway = not lightSway
	end
	if approxEqual(timer, math.floor(timer)) then
		if levelBeat then
			currentLevel = currentLevel + 1
			level[currentLevel]()
			return
		end
	end

	-- player control
	if thompson.onGround and love.keyboard.isDown("w") or thompson.onGround and love.keyboard.isDown(" ") then
		--if not thompson.isJumping then
			thompson.v[2] = -g/2
			--thompson.isJumping = true
		--end
		--thompson.isJumping = false
	elseif love.keyboard.isDown("s") then
		--do nothing
	else
		--thompson.isJumping = false
	end
	if love.keyboard.isDown("a") then
		thompson.v[1] = -g/4
	elseif love.keyboard.isDown("d") then
		thompson.v[1] = g/4
	else
		thompson.v[1] = 0
	end
	-- reset button
	if love.keyboard.isDown("r") then
		level[1]() --hardcoded to first level!!
	end

	-- apply gravity
	thompson.v[2] = thompson.v[2] + g * dt

	-- update position
	thompson.x = thompson.x + thompson.v[1] * dt
	thompson.y = thompson.y + thompson.v[2] * dt
	thompson.fixShadowPosition()

	-- check win condition
	if checkAABB(thompson, goal.collider) then
		thompson.color = {255, 255, 255}
		levelBeat = true
	end

	-- check for collisions & fix velocity/position
	thompson.onGround = false --we assume he isn't until he hits one
	for i=1,#objects do
		if checkAABB(thompson, objects[i]) then
			if thompson.y + thompson.h * fudgeFactor < objects[i].y then
				-- thompson landed
				thompson.v[2] = 0
				thompson.y = objects[i].y - thompson.h
				thompson.onGround = true
			elseif thompson.y > objects[i].y + objects[i].h * fudgeFactor then
				-- thompson bumped his head
				thompson.v[2] = 0
				thompson.y = objects[i].y + objects[i].h
			elseif thompson.x + thompson.w * fudgeFactor < objects[i].x then
				-- thompson hit his left side into a wall
				thompson.v[1] = 0
				thompson.x = objects[i].x - thompson.w
			elseif thompson.x > objects[i].x + objects[i].w * fudgeFactor then
				-- thompson hit his right side into a wall
				thompson.v[1] = 0
				thompson.x = objects[i].x + objects[i].w
			end
		end
	end
end
