"
A PDSNodeTest is a test class for testing the behavior of PDSNode
"
Class {
	#name : #PDSNodeTest,
	#superclass : #TestCase,
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #tests }
PDSNodeTest >> testNodeNewWithValue [

	| node |
	node := PDSNode newWithValue: 5.
	self assert: node value equals: 5
]

{ #category : #tests }
PDSNodeTest >> testNodePrintOn [

	| node |
	node := PDSNode newWithValue: 5.
	self assert: node fullPrintString equals: 'a PDSNode(5)'
]

{ #category : #tests }
PDSNodeTest >> testNodePrintOnWithMultipleNodes [

	| node |
	node := PDSNode newWithValue: 5.
	node append: 6.
	node append: 7.
	self assert: node fullPrintString equals: 'a PDSNode(5 -> 6 -> 7)'
]

{ #category : #tests }
PDSNodeTest >> testNodePrintOnWithNoValue [

	| node |
	node := PDSNode new.
	self assert: node fullPrintString equals: 'a PDSNode'
]

{ #category : #tests }
PDSNodeTest >> testNodeSetValue [

	| node |
	node := PDSNode new.
	node value: 5.
	self assert: node value equals: 5
]
