"
I am a node in a tree structure.
"
Class {
	#name : #BTNode,
	#superclass : #BinarySearchTree,
	#instVars : [
		'left',
		'right',
		'val'
	],
	#category : #Playground
}

{ #category : #'instance creation' }
BTNode class >> val: aValue left: leftTree right: rightTree [

	^ self new
		  val: aValue;
		  left: leftTree;
		  right: rightTree
]

{ #category : #enumerating }
BTNode >> collect: aBlock [

	^ self class
		  val: (aBlock value: self val)
		  left: (left collect: aBlock)
		  right: (right collect: aBlock)

]

{ #category : #testing }
BTNode >> includes: anObject [

	anObject = val ifTrue: [ ^ true ].
	anObject < val
		ifTrue: [ ^ left includes: anObject ]
		ifFalse: [ ^ right includes: anObject ]
]

{ #category : #accessing }
BTNode >> insert: anObject [
	"anObject < val
		ifTrue: [
		^ self class val: val left: (left insert: anObject) right: right ]
		ifFalse: [
		^ self class val: val left: left right: (right insert: anObject) ]"

	anObject < val
		ifTrue: [ ^ self left: (self left insert: anObject) ]
		ifFalse: [ ^ self right: (self right insert: anObject) ]
]

{ #category : #accessing }
BTNode >> left [

	^ left
]

{ #category : #accessing }
BTNode >> left: aTree [

	left := aTree
]

{ #category : #accessing }
BTNode >> right [

	^ right
]

{ #category : #accessing }
BTNode >> right: aTree [

	right := aTree
]

{ #category : #traversing }
BTNode >> traverseInOrder: aBlock [

	left traverseInOrder: aBlock.
	aBlock value: val.
	right traverseInOrder: aBlock
]

{ #category : #traversing }
BTNode >> traversePostOrder: aBlock [

	left traversePostOrder: aBlock.
	right traversePostOrder: aBlock.
	aBlock value: val
]

{ #category : #traversing }
BTNode >> traversePreOrder: aBlock [

	aBlock value: val.
	left traversePreOrder: aBlock.
	right traversePreOrder: aBlock
]

{ #category : #accessing }
BTNode >> val [

	^ val
]

{ #category : #accessing }
BTNode >> val: anObject [

	val := anObject
]
