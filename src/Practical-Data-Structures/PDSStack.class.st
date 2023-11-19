"
I implement a simple Stack.

Public API and Key Messages

- push: anObject (add anObject to stack)
- pop (remove top stack element)
- peek (look at top stack element but don't remove it)
- isEmpty
- isNotEmpty

Initialization:

- PDSSTack new
- PDSStack newFrom: aCollection

Internal Representation:

   Instance Variables:
	storage:		<OrderedCollection>

"
Class {
	#name : #PDSStack,
	#superclass : #Object,
	#instVars : [
		'storage'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #'instance creation' }
PDSStack class >> newFrom: aCollection [

	| stack |
	stack := self new.
	aCollection do: [ :item | stack push: item ].
	^ stack
]

{ #category : #initialization }
PDSStack >> initialize [

	storage := OrderedCollection new
]

{ #category : #testing }
PDSStack >> isEmpty [

	^ storage isEmpty
]

{ #category : #testing }
PDSStack >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #accessing }
PDSStack >> peek [

	^ storage first
]

{ #category : #removing }
PDSStack >> pop [

	^ storage removeFirst
]

{ #category : #printing }
PDSStack >> printOn: aStream [

	super printOn: aStream.
	storage printElementsOn: aStream
]

{ #category : #adding }
PDSStack >> push: anObject [

	^ storage addFirst: anObject
]
