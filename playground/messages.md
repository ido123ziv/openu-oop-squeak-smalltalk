# messages type
1. unary -> first to be evaluated
    example: 
    ```
    7 sign.                    
    (unary message sign send to object 7. returns 1) 
    ```

2. binary -> single parameter and a char
    example:
    ```
    7 + 4                 
    (binary message + with parameter 4 send to object 7. returns 11) 
    ```

3. keyword: using `:` and a parameter
    example:
    ```
    7 max: 14                 
    (keyword message max: with parameter 14 send to object 7. returns 14)

    ```

---
# Order
`unary -> binary -> keyword`
same type of message gets evaluated at the same time by order from left to right, can be manipulated with `()`.

```
(100 quo: 5) rem: 3
Send quo: to 100 with parameter 5. send rem: to 20 with parameter 3. result is 2.

```

## Flow example:

```
a:=0.
a+(a:=3).

Return 6.
a:=3 perform first. Then the result is a parameter with messgae + sent to a. now a is 3 so the result is 6.

```
