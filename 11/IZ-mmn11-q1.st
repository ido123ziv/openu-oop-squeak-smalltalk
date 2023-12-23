Object subclass: #MyShape
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn11-q1'!

!MyShape methodsFor: 'comparing' stamp: 'IZ 12/23/2023 13:40'!
= aShape
	"checking a given shape is in Geometric Congruence"

	self subclassResponsibility.! !


!MyShape methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:38'!
area
	"get shape area"
	self subclassResponsibility.! !

!MyShape methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:38'!
perimeter
	"get shape perimeter"

	self subclassResponsibility.! !


MyShape subclass: #MyRectangle
	instanceVariableNames: 'width length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IZ-mmn11-q1'!

!MyRectangle methodsFor: 'accessing' stamp: 'IZ 12/23/2023 13:53'!
length: newlength
	"set length"

	(newlength <=0 )
		ifTrue: [^self error: 'bad input of length, must be > 0'].
	
	length := newlength! !

!MyRectangle methodsFor: 'accessing' stamp: 'IZ 12/23/2023 13:53'!
width: newWidth
	"set width"

	(newWidth <=0 )
		ifTrue: [^self error: 'bad input of width, must be > 0'].
	
	width := newWidth! !


!MyRectangle methodsFor: 'initialize-release' stamp: 'IZ 12/23/2023 13:56'!
initialize
	"new object"
	
	width := 0.
	length := 0.
	self name: 'Bingo'.! !


!MyRectangle methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:54'!
area
	"calculate the area of the rectangle"
	^length*width! !

!MyRectangle methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:49'!
length
	"get rectangle length"
	^length! !

!MyRectangle methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:55'!
perimeter
	"calculate the perimeter of the rectangle"
	^(length+width)*2! !

!MyRectangle methodsFor: 'getting' stamp: 'IZ 12/23/2023 13:48'!
width
	"get rectangle width"
	^width! !


!MyRectangle methodsFor: 'comparing' stamp: 'IZ 12/23/2023 13:58'!
= aRect
	"compare giving rect to self if given rect is indeed a rect"
	(aRect isMemberOf: MyRectangle) 
		ifTrue: [^(aRect length = length) and: (aRect width = width)].
	^false! !
