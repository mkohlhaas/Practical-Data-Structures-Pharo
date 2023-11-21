"
A PDSLinkedListTest is a test class for testing the behavior of PDSLinkedList
"
Class {
	#name : #PDSLinkedListTest,
	#superclass : #TestCase,
	#category : #'Practical-Data-Structures-Tests-Base'
}

{ #category : #tests }
PDSLinkedListTest >> testAppendToEmptyList [

	| list |
	list := PDSLinkedList new.
	list add: 5.

	self assert: list head value equals: 5.
	self assert: list tail value equals: 5.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testAppendTwoValues [

	| list |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testContainsMapElementAt [

	| list |
	self skip.

	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.

	self assert: (list includes: 1).
	self assert: (list includes: 2).
	self assert: (list includes: 3).
	self
		assert: (list collect: [ :each | 2 * each ])
		equals: (PDSLinkedList new
				 add: 2;
				 add: 4;
				 add: 6).
	self
		assert: (list select: [ :each | each < 5 ])
		equals: (PDSLinkedList new
				 add: 1;
				 add: 2;
				 add: 3).
	self assert: (list at: 1) equals: 1.
	self assert: (list at: 2) equals: 2.
	self assert: (list at: 3) equals: 3
]

{ #category : #tests }
PDSLinkedListTest >> testFindNodeInEmptyList [

	| list node |
	list := PDSLinkedList new.
	node := list at: 0.
	self assert: node equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testFindNodeMultipleLengthList [

	| list node |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.

	node := list at: 2.
	self assert: node value equals: 3.
	self assert: node next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testFindNodeSingleLengthList [

	| list node |
	list := PDSLinkedList new.
	list add: 1.
	node := list at: 0.
	self assert: node value equals: 1.
	self assert: node next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testFindNodeWhereIndexOutOfRange [

	| list node |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.

	node := list at: 99.
	self assert: node equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testInitialEmptyListHasNullHeadAndTail [

	| list |
	list := PDSLinkedList new.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testInsertAfterForMultiLengthList [

	| list |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.

	list insertAfter: list head value: 42.
	self assert: list head value equals: 1.
	self assert: list head next value equals: 42.
	self assert: list tail value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testInsertAfterTail [

	| list |
	list := PDSLinkedList new.
	list add: 1.
	list insertAfter: list tail value: 2.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testPopFromEmptyList [

	| list value |
	list := PDSLinkedList new.
	value := list pop.
	self assert: value equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testPopFromMultipleLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list push: 2.
	list push: 1.
	currentValue := list pop.
	self assert: currentValue equals: 1.
	self deny: list isEmpty.
	self assert: list head value equals: 2.
	self assert: list tail value equals: 2.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testPopFromSingleLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list push: 1.
	currentValue := list pop.
	self assert: currentValue equals: 1.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testPushOneValue [

	| list |
	list := PDSLinkedList new.
	list push: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head equals: list tail
]

{ #category : #tests }
PDSLinkedListTest >> testPushTwoValues [

	| list |
	list := PDSLinkedList new.
	list push: 2.
	list push: 1.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next value equals: 2.
	self assert: list tail next equals: nil.
	self deny: list head equals: list tail
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveAfterFromLength2List [

	| list currentValue |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	currentValue := list removeAfter: list head.
	self assert: currentValue equals: 2.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveAfterFromMultiLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.
	currentValue := list removeAfter: list head.
	self assert: currentValue equals: 2.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 3.
	self assert: list head next equals: list tail.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveAfterFromSingleLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list push: 1.
	list add: 2.
	currentValue := list removeAfter: list head.
	self assert: currentValue equals: 2.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveLastFromEmptyList [

	| list currentValue |
	list := PDSLinkedList new.
	currentValue := list removeLast.
	self assert: currentValue equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveLastFromLength2List [

	| list currentValue |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	currentValue := list removeLast.
	self assert: currentValue equals: 2.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 1.
	self assert: list head next equals: nil.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveLastFromMultiLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list add: 1.
	list add: 2.
	list add: 3.
	currentValue := list removeLast.
	self assert: currentValue equals: 3.
	self deny: list isEmpty.
	self assert: list head value equals: 1.
	self assert: list tail value equals: 2.
	self assert: list head next equals: list tail.
	self assert: list tail next equals: nil
]

{ #category : #tests }
PDSLinkedListTest >> testRemoveLastFromSingleLengthList [

	| list currentValue |
	list := PDSLinkedList new.
	list push: 1.
	currentValue := list removeLast.
	self assert: currentValue equals: 1.
	self assert: list isEmpty.
	self assert: list head equals: nil.
	self assert: list tail equals: nil
]
