"
I am a Binary Tree.
"
Class {
	#name : #BTTree,
	#superclass : #BinarySearchTree,
	#instVars : [
		'tree'
	],
	#category : #Playground
}

{ #category : #accessing }
BTTree class >> tree: aTree [

	^ self new tree: aTree
]

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

	self tree: (tree insert: anObject)
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
