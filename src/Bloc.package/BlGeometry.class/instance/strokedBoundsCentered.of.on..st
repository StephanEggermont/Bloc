visual bounds
strokedBoundsCentered: aBlBounds of: anElement on: aCanvas
	| spartaPath strokeOptions strokedBounds |

	spartaPath := anElement pathCache geomPathOnSpartaCanvas: aCanvas.
	strokeOptions := aCanvas stroke
		in: [ :aPainter | anElement border style applyOn: aPainter ];
		strokeOptions.

	strokedBounds := spartaPath strokedBoundsOn: aCanvas with: strokeOptions.
	^ aBlBounds rectangle: strokedBounds