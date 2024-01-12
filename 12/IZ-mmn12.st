Object subclass: #MySequence	instanceVariableNames: 'start step count'	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!MySequence commentStamp: 'IZ 1/12/2024 17:41' prior: 0!A MySequence is a class that is made for centrelizing all common functions between different sequences such as arithmetic or geometric

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
!!MySequence methodsFor: 'initialize-release' stamp: 'IZ 1/12/2024 17:41'!initialize
	"first initialize"
	super initialize.
	start:=0.
	step:=0.
	count:=0! !!MySequence methodsFor: 'initialize-release' stamp: 'IZ 1/12/2024 17:41'!initializeWithStart: startValue step: stepValue count: countValue
	"initialize sequence values"
	start:= startValue.
	step:= stepValue.
	count:= countValue! !!MySequence methodsFor: 'getting' stamp: 'IZ 1/12/2024 17:36'!count
	"return the sequence length"
	^count! !!MySequence methodsFor: 'getting' stamp: 'IZ 1/12/2024 17:42'!valueOf: index
	"return the int at index given"
	self subclassResponsibility. ! !!MySequence methodsFor: 'printing' stamp: 'IZ 1/12/2024 17:45'!printOn: stream
	"print sequence to transcript"
	| sequence |
	sequence:= self toString.
	stream nextPutAll: sequence! !!MySequence methodsFor: 'printing' stamp: 'IZ 1/12/2024 17:44'!toString
	"creates a string from sequence"
	| str |
	str := ('sequence: '), self class printString.
	1 to: count do: [:i | str := (str, ' ', (self valueOf: i) printString)].
	^str! !!MySequence methodsFor: 'calculations' stamp: 'IZ 1/12/2024 17:40'!sumOf: n
	"calcs the sum of n items in the sequence"
	((n isInteger) and: [(n<=count and: n> 0)])
		ifFalse: [^self error: 'out of bounds, cannot sum'].
		
	^(1 to: n) inject: 0 into: [:sum :i | sum+(self valueOf: i)]! !MySequence subclass: #MyArithmeticSequence	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!MyArithmeticSequence commentStamp: 'IZ 1/12/2024 17:55' prior: 0!A MyArithmeticSequence is a class for arithmetic sequences, implement MySequence.

Instance Variables
!!MyArithmeticSequence methodsFor: 'getting' stamp: 'IZ 1/12/2024 17:51'!valueOf: index
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0)])
		ifFalse: [^self error: 'out of the bounds, cannot get value in MyArithmeticSequence'].
		
	^ start + ((index-1)*step)! !MySequence subclass: #MyFibonacciSequence	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!MyFibonacciSequence commentStamp: 'IZ 1/12/2024 17:57' prior: 0!A MyFibonacciSequence is a class reperesenting a fib sequence, implements mySequence.

Instance Variables
!!MyFibonacciSequence methodsFor: 'values' stamp: 'IZ 1/12/2024 17:59'!valueOf: index
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0 )])
		ifFalse: [^self error: 'out of bounds, cannot get value in fib'].
		
	(index=1 or: index=2)
		ifTrue: [^start].
		
	^(self valueOf: (index-1))+(self valueOf: (index-2))! !!MyFibonacciSequence methodsFor: 'initialize-release' stamp: 'IZ 1/12/2024 17:58'!initializeWithStart: startValue count: countValue
	"initialize fibonacci sequence, cannot start with 1"

	^super initializeWithStart: startValue step: nil count: countValue! !MySequence subclass: #MyGeometricSequence	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!MyGeometricSequence commentStamp: 'IZ 1/12/2024 17:56' prior: 0!A MyGeometricSequence is a class for gemotric sequences, implements MySequence.

Instance Variables
!!MyGeometricSequence methodsFor: 'getting' stamp: 'IZ 1/12/2024 17:54'!sumOf: n
	"using the unique formula for geometric sequence"
	((n isInteger) and: [(n> 0 and: n<=count)])
		ifFalse: [^self error: 'out of bounds, cannot get sum of geometrics sequence'].
		
	^(start*((step raisedTo: n)-1))/(step-1)
	! !!MyGeometricSequence methodsFor: 'getting' stamp: 'IZ 1/12/2024 17:53'!valueOf: index
	"check if index is legitimate and gets the values"
	((index isInteger) and: [(index <= count and: index > 0)])
		ifFalse: [^self error: 'out of the bounds, cannot get index in geometrics sequence'].
		
	(index=1)
		ifTrue: [^start].
		
	^start*(step raisedTo: (index-1))! !TestCase subclass: #TestMyArithmeticSequence	instanceVariableNames: 'as1 as2'	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!TestMyArithmeticSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:24'!setUp	"setUp tests for MyArithmeticSequence"	Transcript clear.	Transcript show:'Running MyArithmeticSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	as1 := MyArithmeticSequence new.	as1 initializeWithStart:10 step:10 count:5.	as1 toString.	Transcript show: ('as1 ', (as1 toString) asString);cr .	as2 := MyArithmeticSequence new.	as2 initializeWithStart:1 step:1 count:5.	Transcript show: ('as2 ', (as2 toString) asString);cr .! !!TestMyArithmeticSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:12'!testAdd	"asserting real tests for MyArithmeticSequence!!!!"	Transcript show:'Running basic init MyArithmeticSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((as1 valueOf: 1 ) = 10 ) description: 'Error in MyArithmeticSequence Init'.	self assert: ((as1 valueOf: (as1 count)) = 50 ) description: 'Error in MyArithmeticSequence Init'.	self assert: ((as2 valueOf: 1 ) = 1 ) description: 'Error in MyArithmeticSequence Init'.	self assert: ((as2 valueOf: (as2 count)) = 5 ) description: 'Error in MyArithmeticSequence Init'.	Transcript show:'Running calc MyArithmeticSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((as1 sumOf: 2) = 30) description: 'Error in MyArithmeticSequence sum!!!!!!!!'.	self assert: ((as2 sumOf: (as2 count)) = 15) description: 'Error in MyArithmeticSequence sum!!!!!!!!'.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !!TestMyArithmeticSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:13'!testPrint	"asserting real tests for MyArithmeticSequence!!!!"	| as2String readString |	as2String:= ReadStream on: 'sequence: MyArithmeticSequence 1 2 3 4 5'.	readString:= ReadWriteStream on: ''.	as2 printOn: readString.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !TestCase subclass: #TestMyFibonacciSequence	instanceVariableNames: 'fs1 fs2'	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!TestMyFibonacciSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:27'!setUp	"setUp tests for TestMyFibonacciSequence"	Transcript clear.	Transcript show:'Running TestMyFibonacciSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	fs1 := MyFibonacciSequence new.	fs1 initializeWithStart:2 count:5.	Transcript show: ('fs1 ', (fs1 toString) asString);cr .	fs2 := MyFibonacciSequence new.	fs2 initializeWithStart:3 count:5.	Transcript show: ('fs2 ', (fs2 toString) asString);cr .! !!TestMyFibonacciSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:29'!testAdd	"asserting real tests for TestMyFibonacciSequence!!!!"	Transcript show:'Running basic init TestMyFibonacciSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((fs1 valueOf: 2 ) = 2 ) description: 'Error in TestMyFibonacciSequence Init1'.	self assert: ((fs1 valueOf: (fs1 count)) = 10 ) description: 'Error in TestMyFibonacciSequence Init2'.	self assert: ((fs2 valueOf: 3 ) = 6 ) description: 'Error in TestMyFibonacciSequence Init3'.	self assert: ((fs2 valueOf: (fs2 count)) = 15 ) description: 'Error in TestMyFibonacciSequence Init4'.	Transcript show:'Running calc TestMyFibonacciSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((fs1 sumOf: 2) = 4) description: 'Error in TestMyFibonacciSequence sum!!!!!!!!1'.	self assert: ((fs2 sumOf: (fs2 count)) = 36) description: 'Error in TestMyFibonacciSequence sum!!!!!!!!2'.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !!TestMyFibonacciSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:26'!testPrint	"asserting real tests for TestMyFibonacciSequence!!!!"	| fs2String readString |	fs2String:= ReadStream on: 'sequence: TestMyFibonacciSequence 1 2 3 4 5'.	readString:= ReadWriteStream on: ''.	fs2 printOn: readString.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !TestCase subclass: #TestMyGeometricSequence	instanceVariableNames: 'gs1 gs2'	classVariableNames: ''	poolDictionaries: ''	category: 'IZ-mmn12'!!TestMyGeometricSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:30'!setUp	"setUp tests for MyGeometricSequence"	Transcript clear.	Transcript show:'Running MyGeometricSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	gs1 := MyGeometricSequence new.	gs1 initializeWithStart:4 step:10 count:3.	Transcript show: ('gs1 ', (gs1 toString) asString);cr .	gs2 := MyGeometricSequence new.	gs2 initializeWithStart:3 step:2 count:5.	Transcript show: ('gs2 ', (gs2 toString) asString);cr .! !!TestMyGeometricSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:31'!testAdd	"asserting real tests for MyGeometricSequence!!!!"	Transcript show:'Running basic init MyGeometricSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((gs1 valueOf: 1 ) = 4 ) description: 'Error in MyGeometricSequence Init1'.	self assert: ((gs1 valueOf: (gs1 count)) = 400 ) description: 'Error in MyGeometricSequence Init2'.	self assert: ((gs2 valueOf: 1 ) = 3 ) description: 'Error in MyGeometricSequence Init3'.	self assert: ((gs2 valueOf: (gs2 count)) = 48 ) description: 'Error in MyGeometricSequence Init4'.	Transcript show:'Running calc MyGeometricSequence Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr.	self assert: ((gs1 sumOf: 2) = 44) description: 'Error in MyGeometricSequence sum!!!!!!!!1'.	self assert: ((gs2 sumOf: (gs2 count)) = 93) description: 'Error in MyGeometricSequence sum!!!!!!!!2'.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !!TestMyGeometricSequence methodsFor: 'testing' stamp: 'IZ 1/12/2024 18:18'!testPrint	"asserting real tests for MyGeometricSequence!!!!"	| gs2String readString |	gs2String:= ReadStream on: 'sequence: MyArithmeticSequence 3 3 3 3 3'.	readString:= ReadWriteStream on: ''.	gs2 printOn: readString.	Transcript show:'All Tests Completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';cr! !