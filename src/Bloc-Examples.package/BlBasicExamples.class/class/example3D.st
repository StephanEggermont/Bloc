shape examples
example3D
	| space |
	space := BlSpace new
		extent: 600 @ 450;
		title: 'Shape example'.

	space root
		addChild: (self newCube3D position: 25@25);
		yourself.

	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	
	space show