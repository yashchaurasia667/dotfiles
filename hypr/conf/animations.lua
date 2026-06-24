------------------
--- ANIMATIONS ---
------------------

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("cubic", { type = "bezier", points = {{0.33, 1}, {0.68, 1}}})
hl.curve("circ", { type = "bezier", points = {{0.85, 0}, {0.15, 1}}})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "windows", enabled = true, speed = 6.79, spring = "easy", style = "gnomed" })

hl.animation({ leaf = "workspacesIn", enabled = true, speed = 7, bezier = "default", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 8, bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.2, bezier = "circ", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
