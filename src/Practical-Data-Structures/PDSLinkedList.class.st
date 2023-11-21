"
I am a simple Linked List.
"
Class {
	#name : #PDSLinkedList,
	#superclass : #SequenceableCollection,
	#instVars : [
		'head',
		'tail',
		'size'
	],
	#category : #'Practical-Data-Structures-Obsolete'
}

{ #category : #adding }
PDSLinkedList >> add: anObject [
	"appends at end of linked list, answers anObject"

	| node |
	self isEmpty ifTrue: [ ^ self push: anObject ].
	node := PDSNode newWithValue: anObject.
	tail next: node.
	tail := tail next.
	size := size + 1.
	^ anObject
]

{ #category : #accessing }
PDSLinkedList >> at: anIndex [
	"answers value at anIndex"

	^ (self findNodeAt: anIndex) value
]

{ #category : #accessing }
PDSLinkedList >> at: anIndex put: anObject [
	"answers stored anOject at anIndex"

	| node |
	node := self findNodeAt: anIndex.
	node value: anObject.
	^ anObject
]

{ #category : #private }
PDSLinkedList >> findNodeAt: anIndex [

	| currentIndex currentNode |
	currentNode := head.
	currentIndex := 1.
	[ currentNode notNil & (currentIndex < anIndex) ] whileTrue: [
		currentNode := currentNode next.
		currentIndex := currentIndex + 1 ].
	^ currentNode
]

{ #category : #private }
PDSLinkedList >> head [

	^ head
]

{ #category : #initialization }
PDSLinkedList >> initialize [

	size := 0
]

{ #category : #accessing }
PDSLinkedList >> insertAfter: aNode value: anObject [
	"answers inserted node"

	| newNode |
	tail == aNode ifTrue: [
		self add: anObject.
		^ tail ].
	newNode := PDSNode newWithValue: anObject.
	newNode next: aNode next.
	aNode next: newNode.
	^ newNode
]

{ #category : #accessing }
PDSLinkedList >> isEmpty [

	^ head isNil
]

{ #category : #removing }
PDSLinkedList >> pop [
	"removes and answers first node of the linked list or nil if list is empty"

	| currentVal |
	self isEmpty ifTrue: [ ^ self errorSubscriptBounds: 1 ].
	currentVal := head value.
	head := head next.
	self isEmpty ifTrue: [ tail := nil ].
	size := size - 1.
	^ currentVal
]

{ #category : #adding }
PDSLinkedList >> push: anObject [
	"inserts anObject at beginning of linked list"

	| node |
	node := PDSNode newWithValue: anObject.
	node next: head.
	head := node.
	tail ifNil: [ tail := head ].
	size := size + 1.
	^ anObject
]

{ #category : #removing }
PDSLinkedList >> removeAfter: aNode [
	"removes node after aNode and answers its value or nil if aNode is the tail of the list"

	| value |
	aNode == tail ifTrue: [ ^ nil ].

	aNode next == tail ifTrue: [
		value := tail value.
		tail := aNode.
		tail next: nil.
		^ value ].

	value := aNode next value.
	aNode next: aNode next next.
	size := size - 1.
	^ value
]

{ #category : #removing }
PDSLinkedList >> removeLast [
	"removes and answers value of last node of the linked list or nil if list is empty"

	| currentNode currentValue |
	self isEmpty ifTrue: [ ^ nil ].
	head next ifNil: [ ^ self pop ].

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
PDSLinkedList >> size [

	^ size
]

{ #category : #private }
PDSLinkedList >> tail [

	^ tail
]
