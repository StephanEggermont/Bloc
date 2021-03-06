rope - accessing
clearAttributes: aStart to: anEnd if: aBlock
	| anClearedRope selectedAttributes |
	self assertAccess: aStart.
	self assertAccess: anEnd.

	selectedAttributes := self attributes reject: [ :anAssociation | aBlock value: anAssociation value ].

	anClearedRope := (self rope from: aStart to: anEnd)
		clearAttributes: 1
		to: anEnd - aStart + 1
		if: aBlock.

	selectedAttributes ifNotEmpty: [ 
		anClearedRope := anClearedRope attributes: selectedAttributes asSet from: 1 to: anClearedRope size ].

	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ anClearedRope ].

	aStart = 1 ifTrue: [ 
		^ self class
			concatenate: anClearedRope
			and: (self from: anEnd + 1 to: self size) ].
	
	anEnd = self size ifTrue: [ 
		^ self class
			concatenate: (self from: 1 to: aStart - 1)
			and: anClearedRope ].

	^ (self from: 1 to: aStart - 1) append: (anClearedRope append: (self from: anEnd + 1 to: self size))