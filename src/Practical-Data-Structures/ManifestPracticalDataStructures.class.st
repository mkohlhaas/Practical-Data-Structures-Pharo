"
Attempt to port [Data Structures & Algorithms in Dart](https://www.kodeco.com/books/data-structures-algorithms-in-dart/v2.0) to Pharo.
"
Class {
	#name : #ManifestPracticalDataStructures,
	#superclass : #PackageManifest,
	#category : #'Practical-Data-Structures-Manifest'
}

{ #category : #'code-critics' }
ManifestPracticalDataStructures class >> ruleNotEliminationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PDSStack #isNotEmpty #false)) #'2023-11-19T20:11:39.168014+01:00') )
]
