"
I am a simple Queue.

Uses SinglyLinkedList internally.
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
	"Queues grows dynamically."

	^ self new
]

{ #category : #adding }
Queue >> add: newObject [

	^ list add: newObject
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
