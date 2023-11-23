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
	#name : #BTLeaf,
	#superclass : #BinarySearchTree,
	#category : #Playground
}

{ #category : #enumerating }
BTLeaf class >> collect: aBlock [

	^ self
]

{ #category : #testing }
BTLeaf class >> includes: anObject [

	^ false
]

{ #category : #accessing }
BTLeaf class >> insert: anObject [

	^ BTNode val: anObject left: BTLeaf right: BTLeaf
]

{ #category : #traversing }
BTLeaf class >> traverseInOrder: aBlock [

	
]

{ #category : #traversing }
BTLeaf class >> traversePostOrder: aBlock [

	
]

{ #category : #traversing }
BTLeaf class >> traversePreOrder: aBlock [

	
]
