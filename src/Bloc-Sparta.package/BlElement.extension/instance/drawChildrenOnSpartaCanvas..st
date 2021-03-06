*Bloc-Sparta
drawChildrenOnSpartaCanvas: aCanvas

	"If there are not children no need to draw and clip"
	self hasChildren
		ifFalse: [ ^ self ].

	aCanvas clip
		when: [ self clipChildren ]
		by: [ pathCache geomPathOnSpartaCanvas: aCanvas ]
		during: [ self children zReversed do: [ :anElement | anElement fullDrawOnSpartaCanvas: aCanvas ] ]