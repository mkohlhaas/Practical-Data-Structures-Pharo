"
An AVLTreeTest is a test class for testing the behavior of AVLTree
"
Class {
	#name : #AVLTreeTest,
	#superclass : #TestCase,
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #tests }
AVLTreeTest >> testAdd [

	| p avl |
	p := 10.
	avl := AVLTree withAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: (2 raisedTo: p)
]

{ #category : #tests }
AVLTreeTest >> testNoDuplicates [

	| p avl |
	p := 10.
	avl := AVLTree withAll: ((1 to: (2 raisedTo: p)) collect: [ :n | 1 ]).
	self assert: avl size equals: 1
]

{ #category : #tests }
AVLTreeTest >> testRemove [

	| p avl |
	p := 10.
	avl := AVLTree withAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: (2 raisedTo: p).
	avl removeAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: 0
]
