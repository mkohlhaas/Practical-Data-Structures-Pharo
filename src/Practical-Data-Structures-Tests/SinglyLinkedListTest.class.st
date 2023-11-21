"
A SinglyLinkedListTest is a test class for testing the behavior of SinglyLinkedList
"
Class {
	#name : #SinglyLinkedListTest,
	#superclass : #TestCase,
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #test }
SinglyLinkedListTest >> testAdd [

	| list |
	list := SinglyLinkedList with: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil
]

{ #category : #accessing }
SinglyLinkedListTest >> testAddTwoValues [

	| list |
	list := SinglyLinkedList with: 1 with: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testFindNodeSingleLengthList [

	| list |
	list := SinglyLinkedList new.
	list add: 1.
	self assert: list head value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail value equals: 1
]

{ #category : #tests }
SinglyLinkedListTest >> testFindNodesMultipleLengthList [

	| list |
	list := SinglyLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.

	self assert: list head value equals: 1.
	self assert: list head next value equals: 2.
	self assert: list head next next value equals: 3.
	self assert: list head next next equals: list tail.
	self assert: list tail next equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testInitialEmptyListHasNullHeadAndTail [

	| list |
	list := SinglyLinkedList new.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testInsertAfterTail [

	| list |
	list := SinglyLinkedList new.
	list add: 1.
	list add: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testPopFromEmptyList [

	| list |
	list := SinglyLinkedList new.
	self should: [ list pop ] raise: SubscriptOutOfBounds
]

{ #category : #tests }
SinglyLinkedListTest >> testPopFromMultipleLengthList [

	| list |
	list := SinglyLinkedList new.
	list push: 2.
	list push: 1.
	self assert: list pop equals: 1.
	self deny: list isEmpty.
	self assert: list pop equals: 2.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testPopFromSingleLengthList [

	| list |
	list := SinglyLinkedList new.
	list push: 1.
	self assert: list pop equals: 1.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testPushOneValue [

	| list |
	list := SinglyLinkedList new.
	list push: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head equals: list tail
]

{ #category : #accessing }
SinglyLinkedListTest >> testPushTwoValues [

	| list |
	list := SinglyLinkedList new.
	list push: 2.
	list push: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil.
	self deny: list head equals: list tail
]

{ #category : #tests }
SinglyLinkedListTest >> testRemoveLastFromEmptyList [

	| list |
	list := SinglyLinkedList new.
	self should: [ list removeLast ] raise: CollectionIsEmpty
]

{ #category : #tests }
SinglyLinkedListTest >> testRemoveLastFromLength2List [

	| list |
	list := SinglyLinkedList new.
	list add: 1.
	list add: 2.
	self assert: list removeLast equals: 2.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil.
	self assert: list head equals: list tail.
	self assert: list removeLast equals: 1.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
SinglyLinkedListTest >> testRemoveLastFromMultiLengthList [

	| list |
	list := SinglyLinkedList with: 1 with: 2 with: 3.
	self assert: list removeLast equals: 3.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next equals: list tail.
	self assert: list tail next equals: nil.
	self assert: list removeLast equals: 2.
	self deny: list isEmpty.
	self assert: list removeLast equals: 1.
	self assert: list isEmpty
]

{ #category : #tests }
SinglyLinkedListTest >> testRemoveLastFromSingleLengthList [

	| list |
	list := SinglyLinkedList with: 1.
	self assert: list removeLast equals: 1.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]
