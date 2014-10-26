function love.conf(t)
	t.identity = "Thompson Was a Clone"
	--t.title = "Thompson Was a Clone"
	--t.author = "Guard13007"
	t.version = "0.9.1"
	t.console = true --change for release!!

	t.window.title = "Thompson Was a Clone"
	--t.window.icon = nil
	t.window.width = 800
	t.window.height = 450
	t.window.borderless = false
	t.window.resizable = false
	t.window.fullscreen = false

	t.window.vsync = true --may change?
	t.window.fsaa = 0
	t.window.display = 1
	t.window.highdpi = false
	t.window.srgb = false

	t.modules.audio = true
	t.modules.event = true
	t.modules.graphics = true
	t.modules.image = true
	t.modules.joystick = false --may change?
	t.modules.keyboard = true
	t.modules.math = true --may change ?
	t.modules.mouse = true
	t.modules.physics = false
	t.modules.sound = true
	t.modules.system = true
	t.modules.timer = true
	t.modules.window = true
end
