shape examples
exampleText
	| space txt txt2 |
	space := BlSpace new
		extent: 600 @ 350;
		title: 'Text example'.

	txt := BlTextElement new
		position: 200@100;
		constraintsDo: [ :c |
			c horizontal exact: 200.
			c vertical fitContent ];
		border: (BlBorder paint: Color blue width: 2);
		background: (BlBackground paint: Color green);
		text: (BrRopedText string: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sodales tempus porttitor. Donec ac lacus luctus, malesuada ligula in, gravida sapien. Sed varius nibh eget convallis accumsan').

	txt2 := BlTextElement new
		position:150@50;
		text: (BrRopedText string: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit').
	
	space root
		addChild: (BlBenchmarkConsole on:space);
		addChildren: {txt. txt2}.
	
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	
	space show.
	
	