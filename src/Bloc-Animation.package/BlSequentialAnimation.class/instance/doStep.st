pulse
doStep
	(children at: currentIndex) isRunning ifFalse: [ 
		(currentIndex isNil or:[currentIndex = children size]) ifTrue: [ ^ self ].
			currentIndex := currentIndex + 1.
			(children at: currentIndex) initStart ].
	(children at: currentIndex) pulse