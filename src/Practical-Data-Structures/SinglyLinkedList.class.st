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
	"SinglyLinkedList grows dynamically."

	^ self new
]

{ #category : #adding }
SinglyLinkedList >> add: anObject [
	"Appends anObject to end of the list. Answers newObject."

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
	"Executes aBlock for each element of the list."

	| node |
	node := head.
	[ node ] whileNotNil: [
		aBlock value: node value.
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
	"Removes first node of the linked list and answers its value.Throws error if list is empty."

	| currentVal |
	self isEmpty ifTrue: [ ^ self errorSubscriptBounds: 1 ].
	currentVal := head value.
	head := head next.
	self isEmpty ifTrue: [ tail := nil ].
	size := size - 1.
	^ currentVal
]

{ #category : #adding }
SinglyLinkedList >> push: anObject [
	"Inserts anObject at beginning of linked list. Answers anObject."

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
	"Remove anObject from the list. If several of the elements are equal to anObject, only the first is removed.
	If no element is equal to anObject, answer the result of evaluating anExceptionBlock.	Otherwise anObject."

	| nextNode prevNode headCopy |
	self isEmpty ifTrue: [ ^ anExceptionBlock ].

	head value = anObject ifTrue: [
		headCopy := head copy.
		head := headCopy next.
		self isEmpty ifTrue: [ self tail: nil ].
		headCopy next: nil.
		size := size - 1.
		^ anObject ].

	"ast least one elements"
	prevNode := head.
	nextNode := head next.
	[ nextNode ] whileNotNil: [
		nextNode value = anObject ifTrue: [
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
	"Removes last node of linked list and answers its value. Throws error if list is empty."

	| currentNode currentValue |
	"empty list"
	self isEmpty ifTrue: [ ^ self errorEmptyCollection ].
	"list of one element"
	self isListWithOneElement ifTrue: [ ^ self pop ].

	"at least two elements"
	currentNode := head.
	[ currentNode next == tail ] whileFalse: [
		currentNode := currentNode next ].

	currentValue := tail value.
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
