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