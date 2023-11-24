"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPlayground,
	#superclass : #PackageManifest,
	#category : #'Playground-Manifest'
}

{ #category : #'code-critics' }
ManifestPlayground class >> ruleGuardingClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AVLNode #insert: #false)) #'2023-11-24T18:56:19.402529+01:00') )
]

{ #category : #'code-critics' }
ManifestPlayground class >> ruleReGuardClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AVLNode #insert: #false)) #'2023-11-24T18:56:00.024491+01:00') )
]
