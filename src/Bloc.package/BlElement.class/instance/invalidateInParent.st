change reporting
invalidateInParent
	| aSpartaRectangle |

	self isAttachedToSceneGraph
		ifFalse: [ ^ self ].

	aSpartaRectangle := self invalidationBounds: self class invalidateBounds.
	self localBoundsToParent: aSpartaRectangle.
	self hasParent
		ifTrue: [ self parent invalidRect: aSpartaRectangle ]
		ifFalse: [ self space invalidRect: aSpartaRectangle from: self ]