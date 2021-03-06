private
attachedScrapForId: anItemId type: anItemType dryRun: dryRun controller: aRecyclerController

	aRecyclerController attachedScrap reverseWithIndexDo: [ :holder :index |
		(holder itemId = anItemId and: [ holder wasReturnedFromScrap not ]) ifTrue: [ 
			anItemType = holder itemType
				ifTrue: [ 
					holder flags addReturnedFromScrap.
					(holder isRemoved and: [ aRecyclerController isPreLayout not ]) ifTrue: [ 
						holder flags
							addUpdate;
							clearInvalid;
							clearRemoved ].
					^ holder ]
				ifFalse: [
					 dryRun ifFalse: [
						aRecyclerController attachedScrap removeAt: index.
						aRecyclerController childRemoved: holder itemElement.
						holder itemElement dispatchRemovedFromParent.
						aRecyclerController quickRecycleScrap: holder itemElement ] ] ] ].
		
	^ nil