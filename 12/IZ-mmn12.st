﻿Object subclass: #MySequence

Instance Variables
	start		int
	start:		int
	step:		int

count
	- object count in sequence

start
	- first item

step
	- step size
!
	"first initialize"
	super initialize.
	start:=0.
	step:=0.
	count:=0! !
	"initialize sequence values"
	start:= startValue.
	step:= stepValue.
	count:= countValue! !
	"return the sequence length"
	^count! !
	"return the int at index given"
	self subclassResponsibility. ! !
	"print sequence to transcript"
	| sequence |
	sequence:= self toString.
	stream nextPutAll: sequence! !
	"creates a string from sequence"
	| str |
	str := ('sequence: '), self class printString.
	1 to: count do: [:i | str := (str, ' ', (self valueOf: i) printString)].
	^str! !
	"calcs the sum of n items in the sequence"
	((n isInteger) and: [(n<=count and: n> 0)])
		ifFalse: [^self error: 'out of bounds, cannot sum'].
		
	^(1 to: n) inject: 0 into: [:sum :i | sum+(self valueOf: i)]! !

Instance Variables
!
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0)])
		ifFalse: [^self error: 'out of the bounds, cannot get value in MyArithmeticSequence'].
		
	^ start + ((index-1)*step)! !

Instance Variables
!
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0 )])
		ifFalse: [^self error: 'out of bounds, cannot get value in fib'].
		
	(index=1 or: index=2)
		ifTrue: [^start].
		
	^(self valueOf: (index-1))+(self valueOf: (index-2))! !
	"initialize fibonacci sequence, cannot start with 1"

	^super initializeWithStart: startValue step: nil count: countValue! !

Instance Variables
!
	"using the unique formula for geometric sequence"
	((n isInteger) and: [(n> 0 and: n<=count)])
		ifFalse: [^self error: 'out of bounds, cannot get sum of geometrics sequence'].
		
	^(start*((step raisedTo: n)-1))/(step-1)
	! !
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0)])
		ifFalse: [^self error: 'out of the bounds, cannot get index in geometrics sequence'].
		
	(index=1)
		ifTrue: [^start].
		
	^start*(step raisedTo: (index-1))! !