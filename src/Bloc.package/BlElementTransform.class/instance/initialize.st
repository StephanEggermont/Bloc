initialization
initialize
	super initialize.
	translateX := translateY := translateZ := 0.0.
	scaleX := scaleY := scaleZ := 1.0.
	rotationQuaternion := BlQuaternion new.
	rotateAngle := 0.
	rotateAxis := 0@0