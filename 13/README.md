# 13

## 1 a
run:
```smalltalk
board := Board new initialize.
board solve
```
output:
```console
Sol #: 1 is: an OrderedCollection(1 5 8 6 3 7 2 4)
.
.
.
Sol #: 91 is: an OrderedCollection(8 4 1 3 6 2 7 5)
End of Solutions.
Number of Solutions:92
```

## 1 b
run:
```smalltalk
boardq := BoardQueen new initialize.
boardq solve
boardRK := BoardRookKnight new initialize.
boardRK solve
```
output:
```console
Sol #: 2758 is: an OrderedCollection(8 7 6 3 4 1 2 5)
Sol #: 2759 is: an OrderedCollection(8 7 6 3 4 5 1 2)
Sol #: 2760 is: an OrderedCollection(8 7 6 3 4 5 2 1)
Sol #: 2761 is: an OrderedCollection(8 7 6 5 1 2 3 4)
Sol #: 2762 is: an OrderedCollection(8 7 6 5 2 1 4 3)
Sol #: 2763 is: an OrderedCollection(8 7 6 5 2 3 4 1)
Sol #: 2764 is: an OrderedCollection(8 7 6 5 4 1 2 3)
Sol #: 2765 is: an OrderedCollection(8 7 6 5 4 3 2 1)
End of Solutions.
Number of Solutions:2766
```

# 2 a
run:
```smalltalk
Transcript clear.
a := #(1 2 #(1 3 #(1 4)))
Transcript show: ('a occurrences of 1 expected is 3  ' printString );cr.
acount := (a occurrencesInOf: 1)
Transcript show: ('a occurrences of 1: ', acount printString );cr.
```
output:
```console
'a occurrences of 1 expected is 3  '
a occurrences of 1: 3
```
# 2 b
run:
```smalltalk
b := #(1 2 3 4 5 2 6 7 5 2 4 1)
c := #(1 2 3 2 6 7 5 2 4 1)
d := #(1 2 2 6 7 5 2 4 1)
Transcript show: ('b beforeAndAfter expected: #(1 3 5 6 5 4)  ' printString );cr.
Transcript show: ('c beforeAndAfter expected: #(1 3 6 5 4)  ' printString );cr.
Transcript show: ('d beforeAndAfter expected: 	#(1 2 2 6 5 4)  ' printString );cr.
Transcript show: ('b beforeAndAfter:2 is:  ', (b beforeAndAfter:2 ) printString );cr.
Transcript show: ('c beforeAndAfter:2 is: ' , (c beforeAndAfter:2 )printString );cr.
Transcript show: ('d beforeAndAfter:2 is:  ', (d beforeAndAfter:2 ) printString );cr.
```

output:
```console
'b beforeAndAfter expected: #(1 3 5 6 5 4)  '
occurrencesCount: 3
firstIndex: 2 array: #(1 2 3 4 5 2 6 7 5 2 4 1)
newCopy: #(1 nil nil nil nil nil) copyInd: 2
 newCopy: #(1 3 nil nil nil nil) copyInd: 3
 newCopy: #(1 3 5 6 nil nil) copyInd: 5
 newCopy: #(1 3 5 6 5 4) copyInd: 7
b beforeAndAfter:2 is:  #(1 3 5 6 5 4)
'c beforeAndAfter expected: #(1 3 6 5 4)  '
occurrencesCount: 3
firstIndex: 2 array: #(1 2 3 2 6 7 5 2 4 1)
newCopy: #(1 nil nil nil nil nil) copyInd: 2
 newCopy: #(1 3 nil nil nil nil) copyInd: 3
 newCopy: #(1 3 3 6 nil nil) copyInd: 5
 newCopy: #(1 3 3 6 5 4) copyInd: 7
c beforeAndAfter:2 is: #(1 3 3 6 5 4)
'd beforeAndAfter expected: 	#(1 2 2 6 5 4)  '
occurrencesCount: 3
firstIndex: 2 array: #(1 2 2 6 7 5 2 4 1)
newCopy: #(1 nil nil nil nil nil) copyInd: 2
 newCopy: #(1 2 nil nil nil nil) copyInd: 3
 newCopy: #(1 2 2 6 nil nil) copyInd: 5
 newCopy: #(1 2 2 6 5 4) copyInd: 7
d beforeAndAfter:2 is:  #(1 2 2 6 5 4)
```