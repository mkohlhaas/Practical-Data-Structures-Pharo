"
I am a node in a tree structure.
"
Class {
	#name : #AVLNode,
	#superclass : #Collection,
	#instVars : [
		'left',
		'right',
		'contents',
		'height'
	],
	#category : #Playground
}

{ #category : #'instance creation' }
AVLNode class >> with: anObject [
	"Answer an instance of me containing anObject."

	^ self empty
		  contents: anObject;
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
		  with: (aBlock value: self contents);
		  left: (left collect: aBlock);
		  right: (right collect: aBlock)
]

{ #category : #accessing }
AVLNode >> contents [

	^ contents
]

{ #category : #accessing }
AVLNode >> contents: anObject [

	contents := anObject
]

{ #category : #enumerating }
AVLNode >> do: aBlock [

	self traverseInOrder: aBlock
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

	anObject = contents ifTrue: [ ^ true ].
	anObject < contents
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

	anObject < contents
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
	subTreeMin ifNil: [ ^ self contents ] ifNotNil: [ ^ subTreeMin ]
]

{ #category : #removing }
AVLNode >> remove: anObject [

	| minValue |
	anObject = contents ifTrue: [
		self hasNoChildren ifTrue: [ ^ AVLLeaf ]. "no children"
		right == AVLLeaf ifTrue: [ ^ left ]. "only right child"
		left == AVLLeaf ifTrue: [ ^ right ]. "only left child"
		minValue := right min. "two children"
		self contents: minValue.
		right := right remove: minValue ].
	anObject < contents
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
	(bf > 1 and: [ anObject < left contents ]) ifTrue: [
		^ self rotateRight ].
	(bf < -1 and: [ anObject > right contents ]) ifTrue: [
		^ self rotateLeft ].
	(bf > 1 and: [ anObject > left contents ]) ifTrue: [
		^ self rotateLeftRight ].
	(bf < -1 and: [ anObject < right contents ]) ifTrue: [
		^ self rotateRightLeft ]
]

{ #category : #traversing }
AVLNode >> traverseInOrder: aBlock [

	left traverseInOrder: aBlock.
	aBlock value: contents.
	right traverseInOrder: aBlock
]

{ #category : #traversing }
AVLNode >> traversePostOrder: aBlock [

	left traversePostOrder: aBlock.
	right traversePostOrder: aBlock.
	aBlock value: contents
]

{ #category : #traversing }
AVLNode >> traversePreOrder: aBlock [

	aBlock value: contents.
	left traversePreOrder: aBlock.
	right traversePreOrder: aBlock
]

{ #category : #private }
AVLNode >> updateHeight [

	height := (left height max: right height) + 1
]
