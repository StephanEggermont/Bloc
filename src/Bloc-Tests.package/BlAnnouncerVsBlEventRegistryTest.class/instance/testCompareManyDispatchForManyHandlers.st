tests
testCompareManyDispatchForManyHandlers
 |ann reg t1 t2 c1 c2 counter|
	c1 := c2 := 0.
	counter := 2000.
	ann := Announcer new.
	reg := BlHandlerRegistry new.
	
	counter timesRepeat: [ann subscribe: BlEvent do: [c1 := c1+1] ].
	counter timesRepeat: [ reg add: (BlEventHandler on: BlEvent do:[c2 := c2+1]) ].
	
	t1 := [counter timesRepeat: [ann announce: BlEvent new]] timeToRunWithoutGC.
	t2 := [counter timesRepeat:[reg dispatchEvent: BlEvent new]] timeToRunWithoutGC.
	
	self assert: t1>t2.
	self assert: c1 = counter squared.
	self assert: c2 = counter squared