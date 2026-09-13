hl.config({
  animations = {
    enabled = true,
  },
})

-- Animation curves
hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

hl.curve("cubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("circ", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 250, dampening = 25 })

-- Animation configs
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.5, bezier = "quick", style = "gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.5, bezier = "quick", style = "gnomed" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.3, bezier = "standard" })

hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4, bezier = "default", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 6, bezier = "default", style = "slide" })

hl.animation({
  leaf    = "specialWorkspace",
  enabled = true,
  speed   = 4,
  bezier  = "specialWorkSwitch",
  style   = "slidefadevert 15%"
})
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })
