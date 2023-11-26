"
I am a terminal node in an AVL Tree.
"
Class {
	#name : #AVLLeaf,
	#superclass : #Object,
	#category : #'Practical-Data-Structures-Private'
}

{ #category : #private }
AVLLeaf class >> balanceFactor [

	^ 0
]

{ #category : #testing }
AVLLeaf class >> hasNoChildren [

	^ false
]

{ #category : #accessing }
AVLLeaf class >> height [

	^ 0
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
