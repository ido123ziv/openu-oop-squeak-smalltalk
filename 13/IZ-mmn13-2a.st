'From Squeak6.0 of 5 July 2022 [latest update: #22104] on 19 January 2024 at 7:57:39 pm'! !
Collection methodsFor: 'enumerating' stamp: 'IZ 1/19/2024 19:56'! 
occurrencesInOf: anObject 
"Answer how many of the receiver's elements are equal to anObject." 
| total_num | 
	total_num := self occurrencesOf: anObject. 
	self do: [
		:x | (x isKindOf: Collection) 
		ifTrue: [
			total_num := total_num + (x occurrencesInOf: anObject)]. 
		]. 
	^ total_num.
	! !