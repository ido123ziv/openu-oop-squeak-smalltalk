# blocks
```
[ Transcript show:'hello' ] value

i:=0.
[ i:= i+ 1 . Transcript show: i].
[ i:= i+ 1 . Transcript show: i] value.

[ :x :y |  Transcript show:(x + y)] value: 2 value: 3

[ :a :b :c :d :e| |x| x:=a+b+c+d+e. Transcript show:x;cr] valueWithArguments:#(1 2 3 4 5)
```
---
```
hello
i: 0
1
5
15
```
---
```

twice := [:x | 2 * x].
b := twice value: 10
Transcript show:' b: ', b printString;cr.


i:=4.
Transcript show:' i: ', i printString;cr.
b := [ i:=i+ 1 . Transcript show: i]. 
Transcript show:' b: ', b printString;cr.
i:=8.
Transcript show:' i: ', i printString;cr.
b value
```
 b: 20
 i: 4
 b: [closure] in UndefinedObject>>DoIt
 i: 8
9