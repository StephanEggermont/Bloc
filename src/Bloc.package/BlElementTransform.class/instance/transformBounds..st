transformation
transformBounds: aBounds
	"In-place transform given BlBounds according to my transformation.
	(local to global transformation)"

	<return: #BlBounds>
	self ensureMatrix.
	matrix transformBounds: aBounds.
	^ aBounds