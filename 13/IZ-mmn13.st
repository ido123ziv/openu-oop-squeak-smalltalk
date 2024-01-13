Object subclass: #Board
	instanceVariableNames: 'lastQueen'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13'!
!Board commentStamp: 'IZ 1/13/2024 12:49' prior: 0!
A Board is an abstratction of the chess board.

Instance Variables
	lastQueen:		Queen

lastQueen
	- the last one standing
!


!Board methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
solve
	"solves current board"
	Transcript clear.
	lastQueen firstSolution
	ifTrue: [Transcript show: lastQueen result printString; cr.
		[lastQueen nextSolution] whileTrue:[Transcript show: lastQueen result printString; cr].
		Transcript show:'End of Solutions.'; cr]
	ifFalse: [Transcript show:'No Solution.'; cr]! !


!Board methodsFor: 'initialize-release' stamp: 'IZ 1/13/2024 12:47'!
initialize
	"Init an empty board"
	lastQueen := QueenTerminator new.
	(1 to: 8) do: [:i | lastQueen := Queen new
	setColumn: i neighbor: lastQueen]! !


Object subclass: #Queen
	instanceVariableNames: 'row column neighbor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13'!
!Queen commentStamp: 'IZ 1/13/2024 12:50' prior: 0!
A Queen is a representation of a queen.

Instance Variables
	column:		Int
	neighbor:		Queen
	row:		int

column
	- col index of queen

neighbor
	- queen next to 

row
	- row index of queen
!


!Queen methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:51'!
canAttack: testRow x: testColumn
	| columnDifference |
	columnDifference := testColumn - column.
	((row = testRow
	or: [row + columnDifference = testRow])
	or: [row - columnDifference = testRow])
	ifTrue: [^ true].
	^ neighbor canAttack: testRow x: testColumn! !

!Queen methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:52'!
firstSolution
	"finds the first solution occurns of the problem by asking all neighbors to move accordingly"
	neighbor firstSolution.
	row := 1.
	^ self moveToNextNonAttackedRow! !

!Queen methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:52'!
nextSolution
	"finds another solution by advancing a row"
	^ self advance
	and: [self moveToNextNonAttackedRow]! !

!Queen methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:53'!
result
	"prints a result"
	"add row to the list"
	^ neighbor result addLast: row; yourself! !


!Queen methodsFor: 'setting' stamp: 'IZ 1/13/2024 12:58'!
advance
	"queen advances to next cell in the column, if can't find a spot initialize a reorg"
	row = 8
	ifTrue: [neighbor nextSolution
	ifFalse: [^ false].
	row := 0].
	row := row + 1.
	^ true! !

!Queen methodsFor: 'setting' stamp: 'IZ 1/13/2024 12:59'!
moveToNextNonAttackedRow
	"Advances the queen one row for a cell that is not being attacked"
	[neighbor canAttack: row x: column]
	whileTrue: [self advance ifFalse: [^ false]].
	^ true! !

!Queen methodsFor: 'setting' stamp: 'IZ 1/13/2024 12:47'!
setColumn: aColumn neighbor: aQueen
	"init a queen's column next to neighbor queen"
	column := aColumn.
	neighbor := aQueen! !


Object subclass: #QueenTerminator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13'!
!QueenTerminator commentStamp: 'IZ 1/13/2024 12:49' prior: 0!
A QueenTerminator is a numb queen, meant to help with end condition.

Instance Variables
!


!QueenTerminator methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
canAttack: testRow x: testColumn
	"Return if the given queen can attack, defaults to false"
	^ false! !

!QueenTerminator methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
firstSolution
	"defaults to true because of the numb queen"
	^ true! !

!QueenTerminator methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
nextSolution
	"default to false because of numb queen"
	^ false! !

!QueenTerminator methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
result
	"return  collection of results"
	^ OrderedCollection new! !
