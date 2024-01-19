Object subclass: #Board
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!Board commentStamp: 'IZ 1/19/2024 13:43' prior: 0!
A Board is an abstratction of the chess Board.

Instance Variables
!


!Board methodsFor: 'getting' stamp: 'IZ 1/19/2024 13:44'!
solve
	"Solve the 8 X problem on the board"
	self subclassResponsibility.! !


!Board methodsFor: 'initialize-release' stamp: 'IZ 1/19/2024 13:42'!
initialize
	"Intialize a board with 8 of objects"
	 self subclassResponsibility.! !


Board subclass: #BoardQueen
	instanceVariableNames: 'lastQueen'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!BoardQueen commentStamp: 'IZ 1/19/2024 13:43' prior: 0!
A Board is an abstratction of the chess Board.

Instance Variables
	lastQueen:		Queen

lastQueen
	- the last one standing
!!!


!BoardQueen methodsFor: 'getting' stamp: 'IZ 1/19/2024 13:43'!
solve
	"solves current Board"
	| counter |
	counter := 1.
	Transcript clear.
	lastQueen firstSolution
	ifTrue: [Transcript show: ('Sol #: ', counter, ' is: ',lastQueen result printString); cr.
		[lastQueen nextSolution]
	whileTrue: [
		Transcript show: ('Sol #: ', counter, ' is: ', (lastQueen result printString));  cr.
		counter := counter +1].
	Transcript show:'End of Solutions.'; cr.
	Transcript show:('Number of Solutions:', counter asString); cr.]
	ifFalse: [Transcript show:'No Solution.'; cr
	]! !


!BoardQueen methodsFor: 'initialize-release' stamp: 'IZ 1/19/2024 13:42'!
initialize
	"Init an empty Board"
	lastQueen := QueenTerminator new.
	(1 to: 8) do: [:i | lastQueen := Queen new
	setColumn: i neighbor: lastQueen]! !


Board subclass: #BoardRookKnight
	instanceVariableNames: 'lastRookKnight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!BoardRookKnight commentStamp: 'IZ 1/19/2024 14:12' prior: 0!
A BoardRookKnight is an abstratction of the chess BoardRookKnight.

Instance Variables
	lastRookKnight:		RookKnight

lastRookKnight
	- the last one standing!


!BoardRookKnight methodsFor: 'getting' stamp: 'IZ 1/19/2024 14:12'!
solve
	"solves current Board"
	| counter |
	counter := 1.
	Transcript clear.
	lastRookKnight firstSolution
	ifTrue: [Transcript show: ('Sol #: ', counter, ' is: ',lastRookKnight result printString); cr.
		[lastRookKnight nextSolution]
	whileTrue: [
		Transcript show: ('Sol #: ', counter, ' is: ', (lastRookKnight result printString));  cr.
		counter := counter +1].
	Transcript show:'End of Solutions.'; cr.
	Transcript show:('Number of Solutions:', counter asString); cr.]
	ifFalse: [Transcript show:'No Solution.'; cr
	]! !


!BoardRookKnight methodsFor: 'initialize-release' stamp: 'IZ 1/19/2024 14:12'!
initialize
	"Init an empty Board"
	lastRookKnight := RookKnightTerminator new.
	(1 to: 8) do: [:i | lastRookKnight := RookKnight new
	setColumn: i neighbor: lastRookKnight]! !


Object subclass: #ChessPiece
	instanceVariableNames: 'row column neighbor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!ChessPiece commentStamp: 'IZ 1/19/2024 14:08' prior: 0!
A ChessPiece is a representation of a Pieces of chess.

Instance Variables
	column:		Int
	neighbor:		ChessPiece
	row:		int

column
	- col index of the piece

neighbor
	- piece next to self

row
	- row index of piece!


!ChessPiece methodsFor: 'setting' stamp: 'IZ 1/19/2024 14:05'!
advance
	"ChessPiece advances to next cell in the column, if can't find a spot initialize a reorg"
	row = 8
	ifTrue: [neighbor nextSolution
	ifFalse: [^ false].
	row := 0].
	row := row + 1.
	^ true! !

!ChessPiece methodsFor: 'setting' stamp: 'IZ 1/19/2024 14:06'!
moveToNextNonAttackedRow
	"Advances the ChessPiece one row for a cell that is not being attacked"
	[neighbor canAttack: row x: column]
	whileTrue: [self advance ifFalse: [^ false]].
	^ true! !

!ChessPiece methodsFor: 'setting' stamp: 'IZ 1/19/2024 14:06'!
setColumn: aColumn neighbor: aChessPiece
	"init a ChessPiece's column next to neighbor ChessPiece"
	column := aColumn.
	neighbor := aChessPiece! !


!ChessPiece methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:51'!
canAttack: testRow x: testColumn
	" checks if piece can attack"
		self subclassResponsibility.

! !

!ChessPiece methodsFor: 'getting' stamp: 'IZ 1/19/2024 14:04'!
firstSolution
	"finds the first solution occurns of the problem by asking all neighbors to move accordingly"
	neighbor firstSolution.
	row := 1.
	^ self moveToNextNonAttackedRow! !

!ChessPiece methodsFor: 'getting' stamp: 'IZ 1/19/2024 14:05'!
nextSolution
	"finds another solution by advancing a row"
	^ self advance
	and: [self moveToNextNonAttackedRow]! !

!ChessPiece methodsFor: 'getting' stamp: 'IZ 1/19/2024 14:18'!
result
	"Add row to the list"
	^ neighbor result addLast: row; yourself! !


ChessPiece subclass: #Queen
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!Queen commentStamp: 'IZ 1/19/2024 14:15' prior: 0!
A Queen is a representation of a Pieces of chess.

Instance Variables
	column:		Int
	neighbor:		Queen
	row:		int

column
	- col index of the Queen

neighbor
	- Queen next to self

row
	- row index of Queen
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



ChessPiece subclass: #RookKnight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!RookKnight commentStamp: 'IZ 1/19/2024 14:09' prior: 0!
A RookKnight is a representation of a RookKnight.

Instance Variables
	column:		Int
	neighbor:		RookKnight
	row:		int

column
	- col index of RookKnight

neighbor
	- RookKnight next to 

row
	- row index of RookKnight!


!RookKnight methodsFor: 'getting' stamp: 'IZ 1/19/2024 14:09'!
canAttack: testRow x: testColumn
    "Returns whether the RookKnight can attack - a particular slot not is threatened "
    | rowDifference columnDifference |
    
    "Check for the threat from the rook"
    (row = testRow or: [column = testColumn]) ifTrue: [^ true].

    "Check for the threat from the knight"
    rowDifference := testRow - row.
    columnDifference := testColumn - column.
    ((rowDifference abs = 2 and: [columnDifference abs = 1])
        or: [rowDifference abs = 1 and: [columnDifference abs = 2]])
        ifTrue: [^ true].

    "Check for the threat from skipping 1 knight from its place"
    (((rowDifference abs = 1 and: [columnDifference abs = 2])
        or: [rowDifference abs = 2 and: [columnDifference abs = 1]])
        and: [rowDifference = 1 or: [rowDifference = -1]])
        ifTrue: [^ true].

    ^ neighbor canAttack: testRow x: testColumn! !


Object subclass: #Terminatorz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!Terminatorz commentStamp: 'IZ 1/13/2024 12:49' prior: 0!
A Terminator is a numb Object, meant to help with end condition.

Instance Variables
!


!Terminatorz methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
canAttack: testRow x: testColumn
	"Return if the given Queen can attack, defaults to false"
	^ false! !

!Terminatorz methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
firstSolution
	"defaults to true because of the numb Queen"
	^ true! !

!Terminatorz methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
nextSolution
	"default to false because of numb Queen"
	^ false! !

!Terminatorz methodsFor: 'getting' stamp: 'IZ 1/13/2024 12:48'!
result
	"return  collection of results"
	^ OrderedCollection new! !


Terminatorz subclass: #QueenTerminator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!QueenTerminator commentStamp: 'IZ 1/13/2024 12:49' prior: 0!
A QueenTerminator is a numb Queen, meant to help with end condition.

Instance Variables
!



Terminatorz subclass: #RookKnightTerminator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn13-1b'!
!RookKnightTerminator commentStamp: 'IZ 1/13/2024 12:49' prior: 0!
A RookKnightTerminator is a numb RookKnight, meant to help with end condition.

Instance Variables
!

