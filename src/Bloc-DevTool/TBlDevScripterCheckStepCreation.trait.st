"
I define very basic methods to create check steps using ${class:BlDevScripterMultipleCheckStep}$.
"
Trait {
	#name : #TBlDevScripterCheckStepCreation,
	#category : #'Bloc-DevTool-Scripter'
}

{ #category : #adding }
TBlDevScripterCheckStepCreation >> addStep: aScripterTask [
	<return: #BlDevScripterStep>
	^ self explicitRequirement
]

{ #category : #'steps - subchecks' }
TBlDevScripterCheckStepCreation >> check [
	^ self addStep: (BlDevScripterMultipleCheckStep new referenceSender)
]

{ #category : #'steps - subchecks' }
TBlDevScripterCheckStepCreation >> check: aLabel [
	^ self check 
		label: aLabel;
		referenceSender
]

{ #category : #'steps - subchecks' }
TBlDevScripterCheckStepCreation >> check: aLabel do: anOneArgBlock [
	| aStep |
	aStep := self check: aLabel.
	aStep referenceSender.
	anOneArgBlock value: aStep.
	^ aStep
]