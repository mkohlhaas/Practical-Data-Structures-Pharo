"
Attempt to port [Data Structures & Algorithms in Dart](https://www.kodeco.com/books/data-structures-algorithms-in-dart/v2.0) to Pharo.
"
Class {
	#name : #ManifestPracticalDataStructures,
	#superclass : #PackageManifest,
	#category : #'Practical-Data-Structures-Manifest'
}

{ #category : #'code-critics' }
ManifestPracticalDataStructures class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'ManifestPracticalDataStructures class' #ruleNotEliminationRuleV1FalsePositive #true)) #'2023-11-19T20:28:09.141023+01:00') )
]

{ #category : #'code-critics' }
ManifestPracticalDataStructures class >> ruleNotEliminationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PDSStack #isNotEmpty #false)) #'2023-11-19T20:11:39.168014+01:00') )
]
