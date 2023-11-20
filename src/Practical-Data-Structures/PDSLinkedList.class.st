Class {
	#name : #PDSLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'Practical-Data-Structures-Base'
}

{ #category : #accessing }
PDSLinkedList >> append: anObject [
	"appends at end of linked list"

	| node |
	self isEmpty ifTrue: [ ^ self push: anObject ].
	node := PDSNode newWithValue: anObject.
	tail next: node.
	tail := tail next
]

{ #category : #accessing }
PDSLinkedList >> at: anIndex [

	^ self nodeAt: anIndex
]

{ #category : #accessing }
PDSLinkedList >> head [

	^ head
]

{ #category : #accessing }
PDSLinkedList >> insertAfter: aNode value: anObject [
	"answers inserted node"

	| newNode |
	tail == aNode ifTrue: [
		self append: anObject.
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

{ #category : #accessing }
PDSLinkedList >> nodeAt: anIndex [

	| currentNode currentIndex |
	currentNode := head.
	currentIndex := 0.
	[ currentNode notNil & (currentIndex < anIndex) ] whileTrue: [
		currentNode := currentNode next.
		currentIndex := currentIndex + 1 ].
	^ currentNode
]

{ #category : #removing }
PDSLinkedList >> pop [
	"removes and answers first node of the linked list or nil if list is empty"

	| currentVal |
	self isEmpty ifTrue: [ ^ nil ].
	currentVal := head value.
	head := head next.
	self isEmpty ifTrue: [ tail := nil ].
	^ currentVal
]

{ #category : #adding }
PDSLinkedList >> push: anObject [
	"inserts anObject at beginning of linked list"

	| node |
	node := PDSNode newWithValue: anObject.
	node next: head.
	head := node.
	tail ifNil: [ tail := head ]
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
	^ currentValue
]

{ #category : #accessing }
PDSLinkedList >> tail [

	^ tail
]
