Class {
	#name : #BinarySearchTree,
	#superclass : #Object,
	#category : #Playground
}

{ #category : #enumerating }
BinarySearchTree >> collect: aBlock [

	^ self class
		  left:
		         (self left collect: aBlock)
		  right: 
		         (self right
		         collect: aBlock)
		  val: (aBlock val: self val)
]

{ #category : #testing }
BinarySearchTree >> includes: anObject [

	self subclassResponsibility
]

{ #category : #accessing }
BinarySearchTree >> insert: aComparableObject [

	self subclassResponsibility
]

{ #category : #traversing }
BinarySearchTree >> traverseInOrder: aBlock [

	self subclassResponsibility
]

{ #category : #traversing }
BinarySearchTree >> traversePostOrder: aBlock [

	self subclassResponsibility
]

{ #category : #traversing }
BinarySearchTree >> traversePreOrder: aBlock [

	self subclassResponsibility
]
