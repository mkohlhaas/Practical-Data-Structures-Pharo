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
	"Answer an instance of me containing anObject."

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
AVLNode >> balanceFactor [

	^ left height - right height
]

{ #category : #enumerating }
AVLNode >> collect: aBlock [

	^ self class
		  with: (aBlock value: self element);
		  left: (left collect: aBlock);
		  right: (right collect: aBlock)
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

{ #category : #testing }
AVLNode >> hasNoChildren [

	^ left == AVLLeaf & (right == AVLLeaf)
]

{ #category : #accessing }
AVLNode >> height [

	^ height
]

{ #category : #accessing }
AVLNode >> height: anObject [

	height := anObject
]

{ #category : #testing }
AVLNode >> includes: anObject [

	anObject = element ifTrue: [ ^ true ].
	anObject < element
		ifTrue: [ ^ left includes: anObject ]
		ifFalse: [ ^ right includes: anObject ]
]

{ #category : #initialization }
AVLNode >> initialize [

	super initialize.
	left := AVLLeaf.
	right := AVLLeaf.
	height := 1
]

{ #category : #accessing }
AVLNode >> insert: anObject [

	anObject < element
		ifTrue: [ left := left insert: anObject ]
		ifFalse: [ right := right insert: anObject ].
	^ self rotateWith: anObject
]

{ #category : #accessing }
AVLNode >> left [

	^ left
]

{ #category : #accessing }
AVLNode >> left: aTree [

	left := aTree
]

{ #category : #private }
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
	self rotateWith: anObject
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

	| b y |
	b := self right.
	y := b left.
	self right: y.
	b left: self.

	self updateHeight.
	b updateHeight.

	^ b
]

{ #category : #private }
AVLNode >> rotateLeftRight [

	left := left rotateLeft.
	^ self rotateRight
]

{ #category : #private }
AVLNode >> rotateRight [

	| a y |
	a := self left.
	y := a right.
	self left: y.
	a right: self.

	self updateHeight.
	a updateHeight.

	^ a
]

{ #category : #private }
AVLNode >> rotateRightLeft [

	right := right rotateRight.
	^ self rotateLeft
]

{ #category : #private }
AVLNode >> rotateWith: anObject [

	| bf |
	self updateHeight.
	bf := self balanceFactor.
	(bf > 1 and: [ anObject < left element ]) ifTrue: [
		^ self rotateRight ].
	(bf < -1 and: [ anObject > right element ]) ifTrue: [
		^ self rotateLeft ].
	(bf > 1 and: [ anObject > left element ]) ifTrue: [
		^ self rotateLeftRight ].
	(bf < -1 and: [ anObject < right element ]) ifTrue: [
		^ self rotateRightLeft ]
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
