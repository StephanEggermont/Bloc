accessing
matrix
	"Return a temporary matrix used to collect data in.
	It is a shared singleton to minimize object creation.
	Must only be used on UI thread!"
	<return: #BlTransformation>
	
	^ matrix ifNil: [ matrix := BlTransformation new ]