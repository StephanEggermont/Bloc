accessing
invalidateBounds
	"Return a temporary bounds used by various #invalidate methods.
	It is a shared singleton to minimize object creation.
	Benchmarks show there might be dozens of thousands invalidation calls per frame where
	each call creates a new instance of bounds.
	By convention invalidation must happen on UI thread, so at any time there is only one
	rectangle involved in invalidation process. It makes a lot of sense to make it a singleton.
	I must only be used on UI thread! Always make a copy if you want to store bounds!"
	<return: #BlBounds>

	^ invalidateBounds ifNil: [ invalidateBounds := BlBounds new ]