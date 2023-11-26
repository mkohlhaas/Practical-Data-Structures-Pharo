"
An AVLTreeTest is a test class for testing the behavior of AVLTree
"
Class {
	#name : #AVLTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'p'
	],
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #running }
AVLTreeTest >> setUp [
	"Put here a common initialization logic for tests"

	super setUp.
	p := 10
]

{ #category : #tests }
AVLTreeTest >> testAdd [

	| avl |
	avl := AVLTree withAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: (2 raisedTo: p)
]

{ #category : #tests }
AVLTreeTest >> testNoDuplicates [

	| avl |
	avl := AVLTree withAll: ((1 to: (2 raisedTo: p)) collect: [ :n | 1 ]).
	self assert: avl size equals: 1
]

{ #category : #tests }
AVLTreeTest >> testRemove [

	| avl |
	avl := AVLTree withAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: (2 raisedTo: p).
	avl removeAll: (1 to: (2 raisedTo: p)) shuffled.
	self assert: avl size equals: 0
]
