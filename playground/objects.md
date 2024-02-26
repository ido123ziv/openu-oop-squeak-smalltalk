# Object
```smalltalk
3 isMemberOf:Number false 
	
3 isKindOf:Number true 
	
Object isKindOf: ProtoObject  true 
ProtoObject isKindOf:Object true 

10 respondsTo:#factorial  
10 isNumber true 
#hello indexOf: $o           5
```