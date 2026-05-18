local animationDuration = 5

hl.curve("myBezier", { type = "bezier" , points = { {0.05, 0.9}, {0.1, 1.05} } });
hl.animation({ leaf = "windows", enabled = true, speed = animationDuration, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = animationDuration, bezier = "myBezier" })
hl.animation({ leaf = "border", enabled = true, speed = animationDuration, bezier = "default", styles = "popin 80%" })
hl.animation({ leaf = "borderangle", enabled = true, speed = animationDuration, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = animationDuration, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = animationDuration, bezier = "default" })
