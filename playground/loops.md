# loops
n := 1.
[ n < 1000 ] whileTrue: [ n := n*2 ].

n := 1.
[ n > 1000 ] whileFalse: [ n := n*2 ].

n := 1.
10 timesRepeat: [ n := n*2 ].

Output:
```
 n: 1024
 n: 1024
 n: 1024
 ```

---
```
1 to:10 by:2

result := String new.
1 to: 10 do: [:n | result := result, n printString, ' '].
Transcript show:' result: ', result printString;cr.
sum := 0.
(1 to:10 by:3) do:[:x|sum:=sum+x]
Transcript show:' sum: ', sum printString;cr.
sum := 0.
1 to:10 by:3 do:[:x|sum:=sum+x]
Transcript show:' sum: ', sum printString;cr.
```

Output:
```
  result: '1 2 3 4 5 6 7 8 9 10 '
 sum: 22
 sum: 22
```