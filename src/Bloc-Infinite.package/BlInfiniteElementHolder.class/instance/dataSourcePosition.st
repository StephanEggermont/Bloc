accessing
dataSourcePosition
	"Returns the datasource position of the item represented by this ElementHolder."
	<return: #Number>

	^ infiniteElement
		ifNil: [ NoPosition ]
		ifNotNil: [ :infEl | infEl dataSourcePositionOf: self ]