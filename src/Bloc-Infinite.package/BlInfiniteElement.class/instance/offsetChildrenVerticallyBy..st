children - geometry
offsetChildrenVerticallyBy: aNumber
	
	childrenManager childrenDo: [ :anElement |
		| previousPosition newPosition |
		previousPosition := anElement position.
		newPosition := previousPosition x @ (previousPosition y + aNumber).
		anElement position: newPosition.
		self
			assert: [ newPosition = anElement position ]
			description: [ 'Position didn''t change as expected! It is super important for scrolling, since we assume that I DO offset children by a number regardless of anything' ] ]