paragraph - measuring
measureOn: aCanvas with: aSpanMeasurer
	"Measure and create lines with text spans from provided rope
	based on attributes and layout properties (maximum width / height)"
	| anIterator aMeasurer anAscent |

	aMeasurer := BrSingleLineTextParagraphMeasurer new.
	aMeasurer maxWidth: maxWidth.
	aMeasurer maxHeight: maxHeight.
	aMeasurer text: self text.

	(self text isEmpty) ifTrue: [ 
		aMeasurer
			measureSpan: (BrSpan
				text: (BrRopedText string: '')
				attributes: #())
			of: self
			on: aCanvas
			with: aSpanMeasurer ].

	anIterator := text iterator.
	[ anIterator hasNext and: [ spans isEmpty or: [ aMeasurer hasAvailableSpace ] ] ] whileTrue: [ 
		"If we pass #hasNext check we will definitely move to the next span,
		so can do the same with position"
		aMeasurer movePosition: anIterator position.
		aMeasurer
			measureSpan: anIterator nextSpan
			of: self
			on: aCanvas
			with: aSpanMeasurer ].

	height := 0.0.
	width := 0.0.
	anAscent := 0.0.

	aMeasurer spans do: [ :aSpan |
		anAscent := anAscent max: aSpan ascent ].
	
	aMeasurer spans do: [ :aSpan |
		aSpan baseline: width @ anAscent.
		height := height max: aSpan height.
		width := width + aSpan width ].

	spans := aMeasurer spans asArray.
	end := spans last to