Class {
	#name : #BTTree,
	#superclass : #BinarySearchTree,
	#instVars : [
		'tree'
	],
	#category : #Playground
}

{ #category : #'instance creation' }
BTTree class >> val: aValue left: leftTree right: rightTree [

	^ self new tree: (BTNode val: aValue left: leftTree right: rightTree)
]

{ #category : #testing }
BTTree >> includes: anObject [

	^ tree includes: anObject
]

{ #category : #accessing }
BTTree >> insert: anObject [

	tree insert: anObject
]

{ #category : #traversing }
BTTree >> traverseInOrder: aBlock [

	tree traverseInOrder: aBlock
]

{ #category : #traversing }
BTTree >> traversePostOrder: aBlock [

	tree traversePostOrder: aBlock
]

{ #category : #traversing }
BTTree >> traversePreOrder: aBlock [

	tree traversePreOrder: aBlock
]

{ #category : #accessing }
BTTree >> tree [

	^ tree
]

{ #category : #accessing }
BTTree >> tree: anObject [

	tree := anObject
]
