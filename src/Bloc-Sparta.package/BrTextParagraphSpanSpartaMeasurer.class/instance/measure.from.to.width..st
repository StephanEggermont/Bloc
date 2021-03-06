measurement
measure: aTextRun from: aTextRunStart to: aTextRunEnd width: aWidth
	| aSpanIterator metricsLength skipLength currentEnd actualEnd actualEndChanged |
	"Measure a given text run from provided start to the end indices limiting available with to aWidth"
	
	self
		assert: [ aTextRun isNotEmpty or: [ aTextRunStart isZero and: [ aTextRunEnd isZero or: [ aTextRunEnd isInfinite ] ] ] ]
		description: [ 'If text run is empty start and end indices must be zero (end may be infinite)' ].
	
	metricsLength := aTextRun isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aTextRunEnd - aTextRunStart + 1 ].

	metrics width: aWidth.
	metrics start: aTextRunStart.
	metrics length: metricsLength.

	aTextRun measureOn: metrics.

	textRunStart := aTextRunStart.
	textRunEnd := metrics wrappedEnd.

	spanStart := textRunIterator position.
	skipLength := aTextRun isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ textRunEnd - textRunStart + 1 ].
	textRunIterator skipUnits: skipLength.
	spanEnd := textRunIterator position.
	
	aSpanIterator := textSpan iterator: spanStart to: textSpan size.
	currentEnd := spanStart.
	actualEnd := spanStart.
	actualEndChanged := false.
	[ aSpanIterator hasNext and: [ currentEnd < spanEnd ] ]
		whileTrue: [ (aSpanIterator next = Character tab)
			ifTrue: [ currentEnd := currentEnd + textParagraph tabWidth ]
			ifFalse: [ currentEnd := currentEnd + 1 ].
			actualEnd := actualEnd + 1.
			actualEndChanged := true ].
		
	spanEnd := actualEnd - actualEndChanged asBit