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
	
(firstIndex + 1) to: (self size) do: [
		:index| ((self at: index) = anObject)
		ifTrue: [
			newCopy at: copyInd put: (self at: (index -1)).
			copyInd := copyInd  +1.
			((index + 1 ) <= (self size))
			ifTrue: [
				newCopy at: copyInd put: (self at: (index +1)).
				copyInd := copyInd  +1.
                Transcript show: (' newCopy: ', newCopy, ' copyInd: ', copyInd printString );cr.
				].
			].
		].
	^ newCopy. 