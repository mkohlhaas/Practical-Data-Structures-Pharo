"
I am an AVL Tree.
"
Class {
	#name : #AVLTree,
	#superclass : #Collection,
	#instVars : [
		'root'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #'instance creation' }
AVLTree class >> new: aSize [

	^ self new
]

{ #category : #adding }
AVLTree >> add: anObject [

	^ self insert: anObject
]

{ #category : #enumerating }
AVLTree >> do: aBlock [

	self traverseInOrder: aBlock
]

{ #category : #accessing }
AVLTree >> height [

	^ root height
]

{ #category : #initialization }
AVLTree >> initialize [

	super initialize.
	self root: AVLLeaf
]

{ #category : #accessing }
AVLTree >> insert: anObject [

	self root: (root insert: anObject).	
	^ anObject
]

{ #category : #removing }
AVLTree >> remove: anObject [

	self root: (self root remove: anObject)
]

{ #category : #removing }
AVLTree >> remove: anObject ifAbsent: aBlock [

	^ self shouldNotImplement
]

{ #category : #accessing }
AVLTree >> root [

	^ root
]

{ #category : #accessing }
AVLTree >> root: aTree [

	root := aTree
]

{ #category : #traversing }
AVLTree >> traverseInOrder: aBlock [

	self root traverseInOrder: aBlock
]

{ #category : #traversing }
AVLTree >> traversePostOrder: aBlock [

	self root traversePostOrder: aBlock
]

{ #category : #traversing }
AVLTree >> traversePreOrder: aBlock [

	self root traversePreOrder: aBlock
]
