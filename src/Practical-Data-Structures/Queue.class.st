"
I am a simple Queue.
"
Class {
	#name : #Queue,
	#superclass : #Collection,
	#instVars : [
		'list'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #'instance creation' }
Queue class >> new: size [

	^ self new
]

{ #category : #adding }
Queue >> add: anObject [

	^ list add: anObject
]

{ #category : #actions }
Queue >> dequeue [

	^ list pop
]

{ #category : #enumerating }
Queue >> do: aBlock [

	list do: aBlock
]

{ #category : #actions }
Queue >> enqueue: anObject [

	^ list add: anObject
]

{ #category : #initialization }
Queue >> initialize [

	list := SinglyLinkedList new
]

{ #category : #testing }
Queue >> isEmpty [

	^ list isEmpty
]

{ #category : #removing }
Queue >> remove: oldObject ifAbsent: anExceptionBlock [

	^ list remove: oldObject ifAbsent: anExceptionBlock
]
