"
A PDSStackTest is a test class for testing the behavior of PDSStack
"
Class {
	#name : #PDSStackTest,
	#superclass : #TestCase,
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #tests }
PDSStackTest >> testEmptyAfterCreation [

	| stack |
	stack := PDSStack new.
	self assert: stack isEmpty.
	self deny: stack isNotEmpty
]

{ #category : #tests }
PDSStackTest >> testNewFrom [

	| stack value |
	stack := PDSStack newFrom: #( 1 2 ).
	self assert: stack isNotEmpty.
	value := stack pop.
	self assert: value equals: 2.
	self assert: stack isNotEmpty.
	value := stack pop.
	self assert: value equals: 1.
	self assert: stack isEmpty
]

{ #category : #tests }
PDSStackTest >> testPrintOn [

	| stack |
	stack := PDSStack newFrom: #( 1 2 ).
	self assert: stack fullPrintString equals: 'a PDSStack(2 1)'
]

{ #category : #tests }
PDSStackTest >> testPushPopPeek [

	| stack value |
	stack := PDSStack new.
	self should: [ stack peek ] raise: SubscriptOutOfBounds.
	stack push: 1.
	self assert: stack peek equals: 1.
	self assert: stack isNotEmpty.
	stack push: 2.
	self assert: stack peek equals: 2.
	value := stack pop.
	self assert: value equals: 2.
	self assert: stack peek equals: 1.
	value := stack pop.
	self assert: value equals: 1.
	self should: [ stack peek ] raise: SubscriptOutOfBounds.
	self should: [ stack pop ] raise: CollectionIsEmpty
]
