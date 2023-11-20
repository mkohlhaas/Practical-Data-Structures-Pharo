Class {
	#name : #PDSNode,
	#superclass : #Object,
	#instVars : [
		'value',
		'next'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #'instance creation' }
PDSNode class >> newWithValue: anObject [

	| node |
	node := self new.
	node value: anObject.
	^ node
]

{ #category : #enumerating }
PDSNode >> do: aBlock [
	"Execute block for each of the links that I hold internally."

	| current |
	current := self head.
	[ current isNil ] whileNotNil: [
		aBlock value: current value.
		current := current next ]
]

{ #category : #enumerating }
PDSNode >> do: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,	and evaluate the separatorBlock between."

	"(String streamContents: [:s | #(1 2 3) do: [:each | s << each asString] separatedBy: [s << ', ']]) >>> '1, 2, 3'"

	| beforeFirst |
	beforeFirst := true.
	self do: [ :each |
		beforeFirst
			ifTrue: [ beforeFirst := false ]
			ifFalse: [ separatorBlock value ].
		elementBlock value: each ]
]

{ #category : #accessing }
PDSNode >> next [

	^ next
]

{ #category : #accessing }
PDSNode >> next: anObject [

	^ next := anObject
]

{ #category : #printing }
PDSNode >> printOn: aStream [

	super printOn: aStream.
	value ifNotNil: [
		aStream nextPut: $(.
		value printOn: aStream.
		aStream nextPut: $) ]
]

{ #category : #evaluating }
PDSNode >> value [

	^ value
]

{ #category : #accessing }
PDSNode >> value: anObject [

	^ value := anObject
]
