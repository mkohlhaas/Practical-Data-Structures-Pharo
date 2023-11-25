"
I am a simple Node used in SinglyLinkedList.
"
Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'next',
		'value'
	],
	#category : #'Practical-Data-Structures-Private'
}

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
	self value printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
Node >> value [

	^ value
]

{ #category : #accessing }
Node >> value: anObject [

	value := anObject
]
