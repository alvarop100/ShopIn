RDB
createAllTables
	| accessor errorBlock allTables |
	accessor := self glorpSession accessor.
	errorBlock := [ :errorx | Transcript show: errorx messageText ].
	allTables := self glorpSession system allTables.
	allTables
		do: [ :each | accessor createTable: each ifError: errorBlock ];
		do: [ :each | accessor createTableIndexes: each ifError: errorBlock ];
		do: [ :each | accessor createTableFKConstraints: each ifError: errorBlock ]