"
I am a node in a tree structure.
"
Class {
	#name : #AVLNode,
	#superclass : #Collection,
	#instVars : [
		'left',
		'right',
		'val'
	],
	#category : #Playground
}

{ #category : #'instance creation' }
AVLNode class >> with: anObject [
	"Answer an instance of me containing anObject."

	^ self empty
		  val: anObject;
		  yourself
]

{ #category : #adding }
AVLNode >> add: anObject [

	self insert: anObject.
	^ anObject
]

{ #category : #enumerating }
AVLNode >> collect: aBlock [

	^ self class
		  with: (aBlock value: self val);
		  left: (left collect: aBlock);
		  right: (right collect: aBlock)
]

{ #category : #enumerating }
AVLNode >> do: aBlock [

	self traverseInOrder: aBlock
]

{ #category : #testing }
AVLNode >> hasNoChildren [

	^ left == AVLLeaf & (right == AVLLeaf)
]

{ #category : #testing }
AVLNode >> includes: anObject [

	anObject = val ifTrue: [ ^ true ].
	anObject < val
		ifTrue: [ ^ left includes: anObject ]
		ifFalse: [ ^ right includes: anObject ]
]

{ #category : #initialization }
AVLNode >> initialize [

	super initialize.
	left := AVLLeaf.
	right := AVLLeaf
]

{ #category : #accessing }
AVLNode >> insert: anObject [

	anObject < val
		ifTrue: [ ^ self left: (self left insert: anObject) ]
		ifFalse: [ ^ self right: (self right insert: anObject) ]
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
	subTreeMin := self left min.
	subTreeMin ifNil: [ ^ self val ] ifNotNil: [ ^ subTreeMin ]
]

{ #category : #removing }
AVLNode >> remove: anObject [

	| minValue |
	anObject = val ifTrue: [ "no children"
		self hasNoChildren ifTrue: [ ^ AVLLeaf ].
		"only left child"
		right == AVLLeaf ifTrue: [ ^ left ].
		"only right child"
		left == AVLLeaf ifTrue: [ ^ right ].
		"two children"
		minValue := self right min.
		"in-place changes"
		self val: minValue.
		self right: (right remove: minValue) ].
	anObject < val
		ifTrue: [ ^ self left: (left remove: anObject) ]
		ifFalse: [ ^ self right: (right remove: anObject) ]
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

{ #category : #traversing }
AVLNode >> traverseInOrder: aBlock [

	left traverseInOrder: aBlock.
	aBlock value: val.
	right traverseInOrder: aBlock
]

{ #category : #traversing }
AVLNode >> traversePostOrder: aBlock [

	left traversePostOrder: aBlock.
	right traversePostOrder: aBlock.
	aBlock value: val
]

{ #category : #traversing }
AVLNode >> traversePreOrder: aBlock [

	aBlock value: val.
	left traversePreOrder: aBlock.
	right traversePreOrder: aBlock
]

{ #category : #accessing }
AVLNode >> val [

	^ val
]

{ #category : #accessing }
AVLNode >> val: anObject [

	val := anObject
]
