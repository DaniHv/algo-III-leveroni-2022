!classDefinition: #MarsRoversTests category: 'MarsRovers-Ejercicio'!
TestCase subclass: #MarsRoversTests
	instanceVariableNames: 'marsRoversInstancia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MarsRoversTests methodsFor: 'initial values' stamp: 'DHV 5/31/2022 22:03:18'!
test01MarsRoverStartsOnInitialPosition
	| marsRover1 marsRover2 |

	marsRover1 := MarsRover initializeAt: 0@0 lookingAt: #N.
	marsRover2 := MarsRover initializeAt: 6@9 lookingAt: #N.

	self assert: (marsRover1 position) equals: 0@0.
	self assert: (marsRover2 position) equals: 6@9.

	! !

!MarsRoversTests methodsFor: 'initial values' stamp: 'DHV 5/31/2022 22:03:43'!
test02MarsRoverStartsLookingAtInitialDirection
	| marsRover1 marsRover2 |

	marsRover1 := MarsRover initializeAt: 0@0 lookingAt: #N.
	marsRover2 := MarsRover initializeAt: 0@0 lookingAt: #E.

	self assert: (marsRover1 direction) equals: #N.
	self assert: (marsRover2 direction) equals: #E.! !


!MarsRoversTests methodsFor: 'movements' stamp: 'DHV 5/31/2022 21:17:06'!
test03MarsRoverCanMoveBackwards
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'b'.
	
	self assert: (marsRover position) equals: 0@-1.
	! !

!MarsRoversTests methodsFor: 'movements' stamp: 'DHV 5/31/2022 21:18:54'!
test04MarsRoverCanMoveForward
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'f'.
	
	self assert: (marsRover position) equals: 0@1.
	! !

!MarsRoversTests methodsFor: 'movements' stamp: 'DHV 5/31/2022 21:42:52'!
test08MarsRoverCanMoveMultipleTimes
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'ffb'.

	self assert: (marsRover position) equals: (0@1).
	! !


!MarsRoversTests methodsFor: 'rotations' stamp: 'DHV 5/31/2022 21:29:37'!
test05MarsRoverCanRotateLeft
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'l'.
	
	self assert: (marsRover direction) equals: #O.
	! !

!MarsRoversTests methodsFor: 'rotations' stamp: 'DHV 5/31/2022 21:19:01'!
test06MarsRoverCanRotateRight
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'r'.
	
	self assert: (marsRover direction) equals: #E.
	! !

!MarsRoversTests methodsFor: 'rotations' stamp: 'DHV 5/31/2022 21:42:46'!
test09MarsRoverCanRotateMultipleTimes
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'rrl'.

	self assert: (marsRover direction) equals: #E.
	! !


!MarsRoversTests methodsFor: 'mix movements and rotations' stamp: 'DHV 5/31/2022 21:39:59'!
test07MarsRoverMovesCorrectlyAfterRotation
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'rf'.
	
	self assert: (marsRover position) equals: (1@0).
	! !

!MarsRoversTests methodsFor: 'mix movements and rotations' stamp: 'DHV 5/31/2022 21:44:14'!
test10MarsRoverCanMoveAndRotateMultipleTimes
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	marsRover executeCommands: 'lflbrfrbr'.

	self assert: (marsRover direction) equals: #E.
	self assert: (marsRover position) equals: (-2@0).
! !


!MarsRoversTests methodsFor: 'invalid cases' stamp: 'DHV 5/31/2022 22:04:33'!
test11MarsRoverCannotExecuteInvalidCommand
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.
	
	self should: [marsRover executeCommands: 'x'.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: marsRover class errorMessageInvalidCommand].
	! !

!MarsRoversTests methodsFor: 'invalid cases' stamp: 'DHV 5/31/2022 21:42:02'!
test12MarsRoverStopsExecutionOnInvalidCommand
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	
	self should: [marsRover executeCommands: 'fbbxbr'.]
		raise: Error
		withExceptionDo: [:anError | self assert: marsRover position equals: (0@-1)].
	! !

!MarsRoversTests methodsFor: 'invalid cases' stamp: 'DHV 5/31/2022 21:52:57'!
test13MarsRoverCanNotExecuteCommandsThatAreNotStrings
	| marsRover |

	marsRover := MarsRover initializeAt: 0@0 lookingAt: #N.

	
	self should: [marsRover executeCommands: 2323.]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText) equals: (marsRover class errorMessageCommandsAreNotString)].
	! !

!MarsRoversTests methodsFor: 'invalid cases' stamp: 'DHV 5/31/2022 22:00:42'!
test14MarsRoverCanNotInitializeMarsRoverWithInvalidCoordinate
	self should: [MarsRover initializeAt: 2 lookingAt: #N.]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText) equals: (MarsRover errorMessageInvalidCoordinate)].
	! !

!MarsRoversTests methodsFor: 'invalid cases' stamp: 'DHV 5/31/2022 22:01:23'!
test15MarsRoverCanNotInitializeMarsRoverWithInvalidDirection
	self should: [MarsRover initializeAt: 0@0 lookingAt: #X.]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText) equals: (MarsRover errorMessageInvalidDirection)].
	! !


!classDefinition: #MarsRover category: 'MarsRovers-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinate direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MarsRover methodsFor: 'initialization' stamp: 'DHV 5/31/2022 20:08:33'!
initializeAt: aCoordinate lookingAt: aDirection
	coordinate := aCoordinate.
	direction := aDirection.
! !


!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:49:33'!
actionOfCommand: aCommand
	^MarsRoversAction subclasses detect: [:aSubclass | aSubclass isActionOf: aCommand] ifNone: [self error: self class errorMessageInvalidCommand].! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 21:54:29'!
assertCommandsAreString: commands
	(commands isString) ifFalse: [self error: self class errorMessageCommandsAreNotString].! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:46:59'!
directionInstanceOf: aCardinalPoint
	^(MarsRoverDirection subclasses detect: [:aSubclass | aSubclass isDirectionOf: aCardinalPoint]) new.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 21:14:00'!
executeSingleCommand: aCommand
	(self actionOfCommand: aCommand) new executeActionOn: self.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 21:26:04'!
iterateString: aString andDo: aBlockToEvaluate
	 1 to: aString size do: [:index | aBlockToEvaluate value: (aString at: index)]! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:45:46'!
moveBackward
	(self directionInstanceOf: direction) moveBackwardOn: self.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:45:57'!
moveForward
	(self directionInstanceOf: direction) moveForwardOn: self.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:46:07'!
rotateLeft
	(self directionInstanceOf: direction) rotateLeftOn: self.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:46:15'!
rotateRight
	(self directionInstanceOf: direction) rotateRightOn: self.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:26:41'!
updateDirectionTo: newDirection
	direction := newDirection.! !

!MarsRover methodsFor: 'private' stamp: 'DHV 5/31/2022 20:39:43'!
updatePositionTo: newPosition
	coordinate := newPosition.! !


!MarsRover methodsFor: 'info' stamp: 'DHV 5/31/2022 20:06:38'!
direction
	^direction! !

!MarsRover methodsFor: 'info' stamp: 'DHV 5/31/2022 20:05:55'!
position
	^coordinate! !


!MarsRover methodsFor: 'commands' stamp: 'DHV 5/31/2022 21:51:46'!
executeCommands: stringOfCommands
	self assertCommandsAreString: stringOfCommands.
	self iterateString: stringOfCommands andDo: [:aCommand | self executeSingleCommand: aCommand].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRovers-Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error messages' stamp: 'DHV 5/31/2022 21:50:09'!
errorMessageCommandsAreNotString
	^'Commands input is not valid, use a string instead'.! !

!MarsRover class methodsFor: 'error messages' stamp: 'DHV 5/31/2022 21:16:06'!
errorMessageInvalidCommand
	^'Command is invalid, try with: #f, #b, #l, #r.'! !

!MarsRover class methodsFor: 'error messages' stamp: 'DHV 5/31/2022 21:58:44'!
errorMessageInvalidCoordinate
	^'Coordinate is invalid, you should x@y, with x and y as numbers'.! !

!MarsRover class methodsFor: 'error messages' stamp: 'DHV 5/31/2022 21:58:29'!
errorMessageInvalidDirection
	^'Coordinate is invalid, you should #N, #S, #E or #O'.! !


!MarsRover class methodsFor: 'initialization' stamp: 'DHV 6/2/2022 18:08:13'!
initializeAt: aCoordinate lookingAt: aDirection
	self assertIsValidDirection: aDirection.
	self assertIsValidPosition: aCoordinate.
	
	^self new initializeAt: aCoordinate lookingAt: aDirection! !


!MarsRover class methodsFor: 'private' stamp: 'DHV 6/2/2022 18:07:48'!
assertIsValidDirection: aPotentialDirection
	(#(#N #S #E #O) includes: aPotentialDirection) ifFalse: [self error: self errorMessageInvalidDirection].
! !

!MarsRover class methodsFor: 'private' stamp: 'DHV 6/2/2022 18:07:26'!
assertIsValidPosition: aPotentialPosition
	(aPotentialPosition isPoint) ifFalse: [self error: self errorMessageInvalidCoordinate].
! !


!classDefinition: #MarsRoverDirection category: 'MarsRovers-Ejercicio'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'DHV 6/2/2022 18:04:29'!
moveBackwardOn: aMarsRover
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'DHV 6/2/2022 18:04:33'!
moveForwardOn: aMarsRover
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'DHV 6/2/2022 18:04:41'!
rotateLeftOn: aMarsRover
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'DHV 6/2/2022 18:04:44'!
rotateRightOn: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirection class' category: 'MarsRovers-Ejercicio'!
MarsRoverDirection class
	instanceVariableNames: ''!

!MarsRoverDirection class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:27:32'!
isDirectionOf: anIdentifier
	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRovers-Ejercicio'!
MarsRoverDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!East methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 21:01:22'!
moveBackwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (-1@0))! !

!East methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 21:01:19'!
moveForwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (1@0))! !

!East methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:25'!
rotateLeftOn: aMarsRover
	aMarsRover updateDirectionTo: #N! !

!East methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:21'!
rotateRightOn: aMarsRover
	aMarsRover updateDirectionTo: #S! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRovers-Ejercicio'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:51:07'!
isDirectionOf: anIdentifier
	^anIdentifier = #E.! !


!classDefinition: #North category: 'MarsRovers-Ejercicio'!
MarsRoverDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!North methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:47:39'!
moveBackwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (0@-1))! !

!North methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:47:45'!
moveForwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (0@1))! !

!North methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:35'!
rotateLeftOn: aMarsRover
	aMarsRover updateDirectionTo: #O! !

!North methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:40'!
rotateRightOn: aMarsRover
	aMarsRover updateDirectionTo: #E.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRovers-Ejercicio'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:51:01'!
isDirectionOf: aCardinalPoint
	^aCardinalPoint = #N.! !


!classDefinition: #South category: 'MarsRovers-Ejercicio'!
MarsRoverDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!South methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:47:52'!
moveBackwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (0@1))! !

!South methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:47:57'!
moveForwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (0@-1))! !

!South methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:50'!
rotateLeftOn: aMarsRover
	aMarsRover updateDirectionTo: #E.! !

!South methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:53'!
rotateRightOn: aMarsRover
	aMarsRover updateDirectionTo: #O.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRovers-Ejercicio'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:51:11'!
isDirectionOf: aCardinalPoint
	^aCardinalPoint = #S.! !


!classDefinition: #West category: 'MarsRovers-Ejercicio'!
MarsRoverDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!West methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:48:02'!
moveBackwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (1@0))! !

!West methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 21:00:43'!
moveForwardOn: aMarsRover
	aMarsRover updatePositionTo: (aMarsRover position + (-1@0))! !

!West methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:53:03'!
rotateLeftOn: aMarsRover
	aMarsRover updateDirectionTo: #S.! !

!West methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:52:58'!
rotateRightOn: aMarsRover
	aMarsRover updateDirectionTo: #N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRovers-Ejercicio'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:51:16'!
isDirectionOf: aCardinalPoint
	^aCardinalPoint = #O.! !


!classDefinition: #MarsRoversAction category: 'MarsRovers-Ejercicio'!
Object subclass: #MarsRoversAction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MarsRoversAction methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:30:47'!
executeActionOn: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoversAction class' category: 'MarsRovers-Ejercicio'!
MarsRoversAction class
	instanceVariableNames: ''!

!MarsRoversAction class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 20:16:47'!
isActionOf: aCommand
	self subclassResponsibility.! !


!classDefinition: #MoveBackward category: 'MarsRovers-Ejercicio'!
MarsRoversAction subclass: #MoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MoveBackward methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:31:24'!
executeActionOn: aMarsRover
	aMarsRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackward class' category: 'MarsRovers-Ejercicio'!
MoveBackward class
	instanceVariableNames: ''!

!MoveBackward class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 21:28:08'!
isActionOf: aCommand
	^aCommand = $b.! !


!classDefinition: #MoveForward category: 'MarsRovers-Ejercicio'!
MarsRoversAction subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!MoveForward methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:32:03'!
executeActionOn: aMarsRover
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRovers-Ejercicio'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 21:28:13'!
isActionOf: aCommand
	^aCommand = $f.! !


!classDefinition: #RotateLeft category: 'MarsRovers-Ejercicio'!
MarsRoversAction subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:32:36'!
executeActionOn: aMarsRover
	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'MarsRovers-Ejercicio'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 21:28:25'!
isActionOf: aCommand
	^aCommand = $l.! !


!classDefinition: #RotateRight category: 'MarsRovers-Ejercicio'!
MarsRoversAction subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Ejercicio'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'DHV 5/31/2022 20:32:45'!
executeActionOn: aMarsRover
	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'MarsRovers-Ejercicio'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'subclass identifier' stamp: 'DHV 5/31/2022 21:28:20'!
isActionOf: aCommand
	^aCommand = $r.! !
