"
I am a AVL Tree.
"
Class {
	#name : #AVLTree,
	#superclass : #Collection,
	#instVars : [
		'tree'
	],
	#category : #Playground
}

{ #category : #'instance creation' }
AVLTree class >> new: aSize [

	^ self new
]

{ #category : #adding }
AVLTree >> add: anObject [
	"^ self insert: anObject"

	^ self insert: anObject
]

{ #category : #enumerating }
AVLTree >> do: aBlock [

	self traverseInOrder: aBlock
]

{ #category : #testing }
AVLTree >> includes: anObject [

	^ self tree includes: anObject
]

{ #category : #initialization }
AVLTree >> initialize [

	super initialize.
	self tree: AVLLeaf
]

{ #category : #accessing }
AVLTree >> insert: anObject [

	self tree: (tree insert: anObject).	
	^ anObject
]

{ #category : #removing }
AVLTree >> remove: anObject [

	self tree: (self tree remove: anObject)
]

{ #category : #removing }
AVLTree >> remove: anObject ifAbsent: aBlock [

	^ self shouldNotImplement
]

{ #category : #traversing }
AVLTree >> traverseInOrder: aBlock [

	self tree traverseInOrder: aBlock
]

{ #category : #traversing }
AVLTree >> traversePostOrder: aBlock [

	self tree traversePostOrder: aBlock
]

{ #category : #traversing }
AVLTree >> traversePreOrder: aBlock [

	self tree traversePreOrder: aBlock
]

{ #category : #accessing }
AVLTree >> tree [

	^ tree
]

{ #category : #accessing }
AVLTree >> tree: anObject [

	tree := anObject
]
