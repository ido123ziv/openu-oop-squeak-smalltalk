# collections
classic
```smalltalk
a:= #(1 2 3 4 5)
a:= {1. 2. 3. 4. 5.}
```
using new
```smalltalk
a:= Array new:5
a:= Set new
```

using newFrom
```smalltalk
a:= Array newFrom:#(1 2 3 4 5)
b:= Set new
c:= Dictionary newFrom: {1->#a. 2->#b. 3->#c}
```

## Casting
```smalltalk
collection := #(1 2 3 4 5) 
a:= collection asSet
b:= collection asSet asArray
C := collection asBag
D := collection asOrderedCollection
```
## Adding
```smalltalk
a:=Set new.
b:=Set new.
b add: (a add:5)

```
## deleting
```smalltalk
a:= #(1 6 4)
a remove:6  -> error
a:= #(1 6 4) asOrderedCollection
a remove:6

```

## Looping
```smalltalk
a:= #(1 2 3 4)
ind := 1.
sum:=0.
[ind<=a size] whileTrue:
	[sum := sum + a at:ind. ind := ind+1]

```
---
```smalltalk
sum := 0.
c do: [ :x | sum := sum +x]
```
better to use this because works everytime

### filtering
```smalltalk
#(1 2 3) select : [:x|(x rem: 2) = 1] 
Return #(1 3)

Reject. תנאי הפוך ל- select
#(1 2 3) reject: [:x|(x rem: 2) = 1] 
Return #(2)

```

--- 
delete items larger than 10
```smalltalk
a select:[:item|item<=10]
a do:
	[:item|item>10 ifTrue:[a remove:item]].
a copy do:
	[:item|item>10 ifTrue:[a remove:item]].

```