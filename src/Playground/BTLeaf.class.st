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
