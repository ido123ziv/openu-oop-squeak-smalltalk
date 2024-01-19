'From Squeak6.0 of 5 July 2022 [latest update: #22104] on 19 January 2024 at 8:19:21 pm'!

!SequenceableCollection methodsFor: 'copying' stamp: 'IZ 1/19/2024 20:18'!
beforeAndAfter: anObject
	"returns a collection of the same kind as self with all the objects between the first and last occurrences of anObject"
	
	| firstIndex copyInd newCopy occurrencesCount|
	occurrencesCount := (self occurrencesInOf: anObject).
	Transcript show: ('occurrencesCount: ', occurrencesCount printString);cr.
	copyInd := 1.
	newCopy := self species new: (occurrencesCount +1).
	firstIndex := self indexOf: anObject.
	Transcript show: ('firstIndex: ', firstIndex,' array: ', self printString );cr.
	((firstIndex -1 ) > 0)
	ifTrue:
		[newCopy at: copyInd put: (self at: (firstIndex -1)).
		copyInd := copyInd  +1.
		Transcript show: ('newCopy: ', newCopy, ' copyInd: ', copyInd printString );cr.].
	((firstIndex +1) <= (self size))
	ifTrue:[newCopy at: copyInd put: (self at: (firstIndex +1)).
		copyInd := copyInd  +1.
		Transcript show: (' newCopy: ', newCopy, ' copyInd: ', copyInd printString );cr.].
	

	^ newCopy. ! !
