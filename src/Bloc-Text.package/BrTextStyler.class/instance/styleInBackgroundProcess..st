styling
styleInBackgroundProcess: aBrText

	self terminateBackgroundStylingProcess.
	
	stylingEnabled
		ifFalse: [ ^ self ].

	self monitor critical: [
		backgroundProcess := [
			| styledText |
			delay asDelay wait.
			text := aBrText unstyle.
			styledText := self privateStyle: text.
			self fireEvent: (BrTextStyledEvent new text: styledText)
		 ] forkAt: Processor userBackgroundPriority ]