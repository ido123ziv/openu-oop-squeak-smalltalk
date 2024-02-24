# Numbers
* `lcm` -> largest common mechane
* `gcd` -> greatest common divider
* `sqrt` -> square
* `quo` -> divide


---
```smalltalk
Transcript clear.
Transcript show:'(124 lcm: 8)=',(124 lcm: 8)  printString;cr.
Transcript show:'(242 gcd: 33) =',(242 gcd: 33) printString;cr.
Transcript show:'(1156 sqrt)=', (1156 sqrt) printString;cr.
Transcript show:'(1156 quo: 8)=',(1156 quo: 8) printString;cr.
Transcript show:'(7 sign)=',(7 sign) printString;cr.
Transcript show:'(7 factorial sqrt)=',(7 factorial sqrt) printString;cr.
```
```console
(124 lcm: 8)=248
(242 gcd: 33) =11
(1156 sqrt)=34
(1156 quo: 8)=144
(7 sign)=1
(7 factorial sqrt)=70.9929573971954
```