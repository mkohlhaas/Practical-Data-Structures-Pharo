"
I am a marker class.
I mark terminal node in a tree structure.

Class side is implemented so you can write:
```language=Pharo
BTTree val: 5 left: BTLeaf right: BTLeaf
```
insted of:
```language=Pharo
BTTree val: 5 left: BTLeaf new right: BTLeaf new
```

"
Class {
	#name : #AVLLeaf,
	#superclass : #Collection,
	#category : #Playground
}

{ #category : #enumerating }
AVLLeaf class >> collect: aBlock [

	^ self
]

{ #category : #testing }
AVLLeaf class >> hasNoChildren [

	^ false
]

{ #category : #testing }
AVLLeaf class >> includes: anObject [

	^ false
]

{ #category : #accessing }
AVLLeaf class >> insert: anObject [

	^ AVLNode with: anObject
]

{ #category : #accessing }
AVLLeaf class >> min [

	^ nil
]

{ #category : #removing }
AVLLeaf class >> remove: anObject [

	^ self
]

{ #category : #traversing }
AVLLeaf class >> traverseInOrder: aBlock [

	
]

{ #category : #traversing }
AVLLeaf class >> traversePostOrder: aBlock [

	
]

{ #category : #traversing }
AVLLeaf class >> traversePreOrder: aBlock [

	
]
