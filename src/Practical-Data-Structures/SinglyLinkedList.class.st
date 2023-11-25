"
I am a simple Singly Linked List.
"
Class {
	#name : #SinglyLinkedList,
	#superclass : #Collection,
	#instVars : [
		'head',
		'tail',
		'size'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #'instance creation' }
SinglyLinkedList class >> new: size [

	^ self new
]

{ #category : #adding }
SinglyLinkedList >> add: anObject [

	| node |
	self isEmpty ifTrue: [ ^ self push: anObject ].
	node := Node new value: anObject.
	tail next: node.
	tail := node.
	size := size + 1.
	^ anObject
]

{ #category : #enumerating }
SinglyLinkedList >> do: aBlock [

	| node |
	node := head.
	[ node ] whileNotNil: [
		aBlock value: node element.
		node := node next ]
]

{ #category : #private }
SinglyLinkedList >> head [

	^ head
]

{ #category : #private }
SinglyLinkedList >> head: anObject [

	head := anObject
]

{ #category : #initialization }
SinglyLinkedList >> initialize [

	size := 0
]

{ #category : #testing }
SinglyLinkedList >> isEmpty [

	^ head isNil
]

{ #category : #testing }
SinglyLinkedList >> isListWithOneElement [

	^ head = tail & head isNotNil
]

{ #category : #removing }
SinglyLinkedList >> pop [

	| currentVal |
	self isEmpty ifTrue: [ ^ self errorSubscriptBounds: 1 ].
	currentVal := head element.
	head := head next.
	self isEmpty ifTrue: [ tail := nil ].
	size := size - 1.
	^ currentVal
]

{ #category : #adding }
SinglyLinkedList >> push: anObject [

	| node |
	node := Node new value: anObject.
	node next: head.
	head := node.
	tail ifNil: [ tail := head ].
	size := size + 1.
	^ anObject
]

{ #category : #removing }
SinglyLinkedList >> remove: anObject ifAbsent: anExceptionBlock [

	| nextNode prevNode headCopy |
	self isEmpty ifTrue: [ ^ anExceptionBlock ].

	head element = anObject ifTrue: [
		headCopy := head copy.
		head := headCopy next.
		self isEmpty ifTrue: [ self tail: nil ].
		headCopy next: nil.
		size := size - 1.
		^ anObject ].

	"at least one element"
	prevNode := head.
	nextNode := head next.
	[ nextNode ] whileNotNil: [
		nextNode element = anObject ifTrue: [
			prevNode next: nextNode next.
			nextNode next: nil.
			nextNode = tail ifTrue: [ self tail: prevNode ].
			size := size - 1.
			^ anObject ].
		prevNode := nextNode.
		nextNode := nextNode next ].

	^ anExceptionBlock
]

{ #category : #removing }
SinglyLinkedList >> removeLast [

	| currentNode currentValue |
	self isEmpty ifTrue: [ ^ self errorEmptyCollection ].
	self isListWithOneElement ifTrue: [ ^ self pop ].
	"at least two elements"
	currentNode := head.
	[ currentNode next == tail ] whileFalse: [
		currentNode := currentNode next ].
	currentValue := tail element.
	tail := currentNode.
	tail next: nil.
	size := size - 1.
	^ currentValue
]

{ #category : #accessing }
SinglyLinkedList >> size [

	^ size
]

{ #category : #private }
SinglyLinkedList >> tail [

	^ tail
]

{ #category : #private }
SinglyLinkedList >> tail: anObject [

	tail := anObject
]
