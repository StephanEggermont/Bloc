rendering
morphFrom: aBlocPresentation
	| element universe host window wrapper |

	wrapper := GLMMorphicBlocWrapperMorph new.
	wrapper changeTableLayout.
	
	element := aBlocPresentation element.

	universe := BlUniverse default.
	universe spaceManager hasSpaces
		ifFalse: [ universe start ].
	
	element isAttachedToSceneGraph
		ifTrue: [
			element space == space
				ifTrue: [ 
					window := space hostSpace morphicWindow ]
				ifFalse: [ | elementSpace |
					elementSpace := element space.
					window := BlMorphicWindow new.
					window borderless: true.
					elementSpace hostSpace mirrowWindow: window.
					elementSpace beDirtyArea ] ]
		ifFalse: [
			space := BlSpace new.
			space extent: 500@500.
			space borderless: true.
			space root addChild: element.
			space root addEventHandler:
				(BlEventHandler
					on: BlDblClickEvent
					do: [ :evt | evt modifiers isShift ifTrue: [ BlElementSelection on: evt target ] ]).
			host := BlMorphicHost new.
			space host: host.
			universe spaceManager addSpace: space.
			"then create a host space"
			host createHostSpaceFor: space.
			window := space hostSpace morphicWindow.
			
			wrapper space: space ].
	
	wrapper addMorph: window.
	window vResizing: #spaceFill.
	window hResizing: #spaceFill.
	^ wrapper