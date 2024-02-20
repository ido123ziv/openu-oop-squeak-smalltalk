'From Squeak6.0 of 5 July 2022 [latest update: #22104] on 20 January 2024 at 12:14:06 pm'!

!SequenceableCollection methodsFor: 'copying' stamp: 'IZ 1/20/2024 12:11'!
beforeAndAfter: anObject
	"returns a collection of the same kind as self with all the objects between the first and last occurrences of anObject"
	
	| lastIndex copyInd newCopy occurrencesCount|
	occurrencesCount := (self occurrencesInOf: anObject).
	Transcript show: ('self: ', self printString);cr.
	Transcript show: ('occurrencesCount: ', occurrencesCount printString);cr.
	copyInd := 1.
	lastIndex := 0.
	newCopy := self species new: (occurrencesCount *2).
	1 to: (self size) do: [
		:index|	
			((self at: index) = anObject)		
		ifTrue: [
			(((index -1 ) > 0) and: ((index-1) ~= lastIndex))
			ifTrue: [
				newCopy at: copyInd put: (self at: (index -1)).
				copyInd := copyInd  +1.	
				lastIndex := (index -1).
			      Transcript show: (' lastIndex ', lastIndex,' newCopy: ', newCopy, ' copyInd: ', copyInd printString );cr.
			].
			((index + 1 ) <= (self size))
			ifTrue: [
				newCopy at: copyInd put: (self at: (index +1)).
				copyInd := copyInd  +1.
				lastIndex := (index + 1).
                Transcript show: (' lastIndex ', lastIndex,' newCopy: ', newCopy, ' copyInd: ', copyInd printString );cr.
				].
			].
		].
	^ (newCopy copyWithout: nil). 