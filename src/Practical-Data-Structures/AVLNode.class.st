"
I am a node in an AVL Tree.
"
Class {
	#name : #AVLNode,
	#superclass : #Collection,
	#instVars : [
		'left',
		'right',
		'element',
		'height'
	],
	#category : #'Practical-Data-Structures-Private'
}

{ #category : #'instance creation' }
AVLNode class >> with: anObject [

	^ self empty
		  element: anObject;
		  yourself
]

{ #category : #adding }
AVLNode >> add: anObject [

	self insert: anObject.
	^ anObject
]

{ #category : #private }
AVLNode >> balance [

	self balanceFactor = 2 ifTrue: [
		left balanceFactor = -1
			ifTrue: [ ^ self rotateLeftRight ]
			ifFalse: [ ^ self rotateRight ] ].
	self balanceFactor = -2 ifTrue: [
		right balanceFactor = 1
			ifTrue: [ ^ self rotateRightLeft ]
			ifFalse: [ ^ self rotateLeft ] ].
	self updateHeight.
	^ self
]

{ #category : #private }
AVLNode >> balanceFactor [

	^ left height - right height
]

{ #category : #enumerating }
AVLNode >> do: aBlock [

	self traverseInOrder: aBlock
]

{ #category : #accessing }
AVLNode >> element [

	^ element
]

{ #category : #accessing }
AVLNode >> element: anObject [

	element := anObject
]

{ #category : #private }
AVLNode >> findMinNode [

	| minNode |
	minNode := right.
	[ minNode left == AVLLeaf ] whileFalse: [ minNode := minNode left ].
	^ minNode
]

{ #category : #testing }
AVLNode >> hasNoChildren [

	^ left == AVLLeaf & (right == AVLLeaf)
]

{ #category : #accessing }
AVLNode >> height [

	^ height
]

{ #category : #initialization }
AVLNode >> initialize [

	left := AVLLeaf.
	right := AVLLeaf.
	height := 1
]

{ #category : #accessing }
AVLNode >> insert: anObject [

	anObject = element ifTrue: [ ^ self ].
	anObject < element ifTrue: [ left := left insert: anObject ].
	anObject > element ifTrue: [ right := right insert: anObject ].
	^ self balance
]

{ #category : #accessing }
AVLNode >> left [

	^ left
]

{ #category : #accessing }
AVLNode >> left: aTree [

	left := aTree
]

{ #category : #accessing }
AVLNode >> min [

	| subTreeMin |
	subTreeMin := left min.
	subTreeMin ifNil: [ ^ self element ] ifNotNil: [ ^ subTreeMin ]
]

{ #category : #removing }
AVLNode >> remove: anObject [

	| minValue |
	anObject = element ifTrue: [
		self hasNoChildren ifTrue: [ ^ AVLLeaf ]. "no children"
		right == AVLLeaf ifTrue: [ ^ left ]. "only right child"
		left == AVLLeaf ifTrue: [ ^ right ]. "only left child"
		minValue := right min. "two children"
		self element: minValue.
		right := right remove: minValue ].
	anObject < element
		ifTrue: [ ^ self left: (left remove: anObject) ]
		ifFalse: [ ^ self right: (right remove: anObject) ].
	^ self balance
]

{ #category : #removing }
AVLNode >> remove: oldObject ifAbsent: anExceptionBlock [

	self shouldNotImplement
]

{ #category : #accessing }
AVLNode >> right [

	^ right
]

{ #category : #accessing }
AVLNode >> right: aTree [

	right := aTree
]

{ #category : #private }
AVLNode >> rotateLeft [

	| pivot |
	pivot := self right.
	self right: pivot left.
	pivot left: self.
	self updateHeight.
	pivot updateHeight.
	^ pivot
]

{ #category : #private }
AVLNode >> rotateLeftRight [

	left := left rotateLeft.
	^ self rotateRight
]

{ #category : #private }
AVLNode >> rotateRight [

	| pivot |
	pivot := self left.
	self left: pivot right.
	pivot right: self.
	self updateHeight.
	pivot updateHeight.
	^ pivot
]

{ #category : #private }
AVLNode >> rotateRightLeft [

	right := right rotateRight.
	^ self rotateLeft
]

{ #category : #traversing }
AVLNode >> traverseInOrder: aBlock [

	left traverseInOrder: aBlock.
	aBlock value: element.
	right traverseInOrder: aBlock
]

{ #category : #traversing }
AVLNode >> traversePostOrder: aBlock [

	left traversePostOrder: aBlock.
	right traversePostOrder: aBlock.
	aBlock value: element
]

{ #category : #traversing }
AVLNode >> traversePreOrder: aBlock [

	aBlock value: element.
	left traversePreOrder: aBlock.
	right traversePreOrder: aBlock
]

{ #category : #private }
AVLNode >> updateHeight [

	height := (left height max: right height) + 1
]
