"
I am a simple Node in a SinglyLinkedList.
"
Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'next',
		'element'
	],
	#category : #'Practical-Data-Structures-Private'
}

{ #category : #accessing }
Node >> element [

	^ element
]

{ #category : #accessing }
Node >> next [

	^ next
]

{ #category : #accessing }
Node >> next: anObject [

	next := anObject
]

{ #category : #printing }
Node >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	self element printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
Node >> value: anObject [

	element := anObject
]
