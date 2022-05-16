!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'limitedStack' stamp: 'DHV 5/15/2022 21:35:18'!
test11StackLimitedShouldNotBeCreatedWithLimitNegative
	self 
		should: [OOStackLimited withLimit: -1.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: (OOStackLimited limitCannotBeNegativeErrorMessage)].! !

!OOStackTest methodsFor: 'limitedStack' stamp: 'DHV 5/15/2022 21:36:17'!
test12StackLimitedShouldNotBeCreatedWithLimitZero
	self 
		should: [OOStackLimited withLimit: 0.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: (OOStackLimited limitCannotBeZeroErrorMessage)].! !

!OOStackTest methodsFor: 'limitedStack' stamp: 'DHV 5/15/2022 21:41:18'!
test13StackLimitedCanPushWhenNotFull
	| stack |
	
	stack := OOStackLimited withLimit: 5.
	
	stack push: '1'.
	stack push: '2'.
	stack push: '3'.
	stack push: '4'.

	self assert: stack isFull not.! !

!OOStackTest methodsFor: 'limitedStack' stamp: 'DHV 5/15/2022 21:42:26'!
test14StackLimitedIsFullWhenReachLimit
	| stack |
	
	stack := OOStackLimited withLimit: 5.
	
	stack push: '1'.
	stack push: '2'.
	stack push: '3'.
	stack push: '4'.
	stack push: '5'.

	self assert: stack isFull.! !

!OOStackTest methodsFor: 'limitedStack' stamp: 'DHV 5/15/2022 21:52:21'!
test15StackLimitedCannotPushWhenFull
	| stack |

	stack := OOStackLimited withLimit: 5.

	stack push: '1'.
	stack push: '2'.
	stack push: '3'.
	stack push: '4'.
	stack push: '5'.

	self
		should: [stack push: '6'.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: OOStackLimited stackFullErrorMessage ].! !


!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:08'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStackUnlimited new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:12'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:14'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:16'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:18'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStackUnlimited new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:21'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:27'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackUnlimited new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorMessage ]
		
! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:29'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorMessage ]
		
! !

!OOStackTest methodsFor: 'common' stamp: 'DHV 5/15/2022 21:23:37'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |

	stack := OOStackUnlimited new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorMessage ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:09'!
test01canNotFindIfStackIsEmpty
	| stack finder results |
	
	stack := OOStackUnlimited new.
	finder := SentenceFinderByPrefix inStack: stack.
	results := finder find: 'hola'.
	
	self assert: results isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:11'!
test02canNotFindIfQueryIsEmpty
	| stack finder |
	
	stack := OOStackUnlimited new.
	finder := SentenceFinderByPrefix inStack: stack.
	
	self
		should: [finder find: ''.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: finder class emptyQueryErrorMessage ].
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:15'!
test03canNotFindIfQueryIsNotInStack
	| stack finder results |
	
	stack := OOStackUnlimited new.
	stack push: 'holis'.
	stack push: 'como'.
	stack push: 'estas'.
	
	finder := SentenceFinderByPrefix inStack: stack.
	results := finder find: 'chau'.
	
	self assert: results isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:17'!
test04canFindQueryWithOneOccurence
	| stack finder results |
	
	stack := OOStackUnlimited new.
	stack push: 'holis como estas'.
	stack push: 'chau'.
	stack push: 'hasta luego'.
	
	finder := SentenceFinderByPrefix inStack: stack.
	results := finder find: 'holis'.
	
	results find: 'holis como estas'.
	self assert: (results size = 1).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:20'!
test05canFindQueryWithManyOccurences
	| stack finder results |

	stack := OOStackUnlimited new.
	stack push: 'holis como estas'.
	stack push: 'holisss'.
	stack push: 'hola'.
	stack push: 'hasta luego'.
	stack push: 'hasta nunca'.

	finder := SentenceFinderByPrefix inStack: stack.
	results := finder find: 'hol'.
	
	results find: 'holis como estas'.
	results find: 'holisss'.
	results find: 'hola'.
	self assert: (results size = 3).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:23'!
test06canNotFindIfQueryHasABlankSpace
	| stack finder |
	
	stack := OOStackUnlimited new.
	stack push: 'hola como estas'.

	finder := SentenceFinderByPrefix inStack: stack.
	

	self
		should: [finder find: 'hola '.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: finder class emptyQueryErrorMessage].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:25'!
test07resultsAreCaseSensitive
	| stack finder results |
	
	stack := OOStackUnlimited new.
	stack push: 'hola como estas'.
	stack push: 'HOLA COMO ESTAS'.
	stack push: 'HOLA'.
	stack push: 'HoLa'.
	stack push: 'hola'.

	finder := SentenceFinderByPrefix inStack: stack.
	results := finder find: 'hola'.
	
	results find: 'hola'.
	results find: 'hola como estas'.
	self assert: (results size = 2).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:27'!
test08StackIsNotChangedAfterSearched
	| stack finder |
	
	stack := OOStackUnlimited new.
	stack push: 'hola como estas'.
	stack push: 'HOLA COMO ESTAS'.
	stack push: 'HOLA'.
	stack push: 'HoLa'.
	stack push: 'hola'.

	finder := SentenceFinderByPrefix inStack: stack.
	finder find: 'hola'.
	
	self assert: (stack size = 5).
	self assert: (stack pop = 'hola').
	self assert: (stack pop = 'HoLa').
	self assert: (stack pop = 'HOLA').
	self assert: (stack pop = 'HOLA COMO ESTAS').
	self assert: (stack pop = 'hola como estas').
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DHV 5/16/2022 17:52:29'!
test09canNotFindIfQueryIsABlankSpace
	| stack finder |
	
	stack := OOStackUnlimited new.
	stack push: 'hola como estas'.

	finder := SentenceFinderByPrefix inStack: stack.
	

	self
		should: [finder find: ' '.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: finder class emptyQueryErrorMessage].! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:09:23'!
popEmpty
	^self error: self class stackEmptyErrorMessage.! !

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:08:34'!
popNotEmpty
	^content removeLast! !

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:54:35'!
pushFull
	self error: self class stackFullErrorMessage.! !

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:10:57'!
pushNotFull: aValue
	^content add: aValue.! !

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:57:43'!
topEmpty
	self error: self class stackEmptyErrorMessage.! !

!OOStack methodsFor: 'private' stamp: 'DHV 5/15/2022 21:57:50'!
topNotEmpty
	^content at: self size! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'jm 5/12/2022 21:18:44'!
currentState
	^(OOStackState subclasses detect: [:aStateSubclass | (aStateSubclass isTheCurrentStateOf: self)]) new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jm 5/12/2022 20:13:21'!
isEmpty
	^content isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:47:36'!
isFull
	^self size = limit.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:46:28'!
limit
	^limit! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:48:31'!
pop
	^self currentState tryToPopFrom: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:44:55'!
push: valueToPush
	^self currentState tryToPush: valueToPush to: self. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jm 5/12/2022 20:14:31'!
size
	^content size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:50:15'!
top
	^self currentState tryToTopFrom: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'DHV 5/15/2022 20:54:33'!
stackEmptyErrorMessage
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'DHV 5/15/2022 21:25:16'!
stackFullErrorMessage
	^ 'Stack is full'! !



!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'initialization' stamp: 'DHV 5/15/2022 20:52:21'!
initializeWithLimit: aLimit
	content := OrderedCollection new.
	limit := aLimit.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'initialization' stamp: 'DHV 5/15/2022 21:35:42'!
withLimit: aLimit
	(aLimit = 0) ifTrue: [self error: self limitCannotBeZeroErrorMessage].
	(aLimit < 0) ifTrue: [self error: self limitCannotBeNegativeErrorMessage].

	^self new initializeWithLimit: aLimit.! !


!OOStackLimited class methodsFor: 'errors' stamp: 'DHV 5/15/2022 21:35:31'!
limitCannotBeNegativeErrorMessage
	^'Stack limit cannot be negative'.! !

!OOStackLimited class methodsFor: 'errors' stamp: 'DHV 5/15/2022 21:27:27'!
limitCannotBeZeroErrorMessage
	^'Stack limit cannot be zero'.! !


!classDefinition: #OOStackUnlimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackUnlimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimited methodsFor: 'initialization' stamp: 'DHV 5/15/2022 21:32:48'!
initialize
	content := OrderedCollection new.
	limit := infinity.
	
	^self.
! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:16:33'!
tryToPopFrom: aStack
	^aStack popNotEmpty.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:15:42'!
tryToPush: aValue to: aStack
	^aStack pushNotFull: aValue. ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:58:00'!
tryToTopFrom: aStack
	^aStack topNotEmpty.! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
OOStackState subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:16:40'!
tryToPopFrom: aStack
	^aStack popEmpty.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:58:09'!
tryToTopFrom: aStack
	^aStack topEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: 'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'nil' stamp: 'jm 5/12/2022 21:17:13'!
isTheCurrentStateOf: aStack
	^aStack isEmpty.
	! !


!classDefinition: #OOStackFull category: 'Stack-Exercise'!
OOStackState subclass: #OOStackFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackFull methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:15:13'!
tryToPush: aValue to: aStack 
	^aStack pushFull.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackFull class' category: 'Stack-Exercise'!
OOStackFull class
	instanceVariableNames: ''!

!OOStackFull class methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:54:05'!
isTheCurrentStateOf: aStack
	^aStack limit = aStack size.! !


!classDefinition: #OOStackNotEmptyOrFull category: 'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmptyOrFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmptyOrFull class' category: 'Stack-Exercise'!
OOStackNotEmptyOrFull class
	instanceVariableNames: ''!

!OOStackNotEmptyOrFull class methodsFor: 'as yet unclassified' stamp: 'DHV 5/15/2022 21:56:24'!
isTheCurrentStateOf: aStack
	^(aStack size > 0) & (aStack size < aStack limit).! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackToSearch'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'jm 5/15/2022 17:29:22'!
initializeWith: aStack
	stackToSearch := aStack.! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'DHV 5/15/2022 18:32:33'!
find: queryToSearch
	| invertedStack matches |

	self assertQueryIsValid: queryToSearch.

	invertedStack := stackToSearch class new.
	matches := OrderedCollection new.

	self iterateStack: stackToSearch with: [:element |
		invertedStack push: element.
		(element beginsWith: queryToSearch) ifTrue: [matches add: element].
	].

	self iterateStack: invertedStack with: [:element |
		stackToSearch push: element.
	]. 

	^matches.
	
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DHV 5/15/2022 19:00:17'!
assertQueryIsValid: query
	((query = '') | (query includesSubString: ' ')) ifTrue: [self error: self class emptyQueryErrorMessage].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DHV 5/15/2022 18:07:33'!
iterateStack: aStack with: actionToDo
	aStack isEmpty ifTrue: [^self].

	actionToDo value: aStack pop.
	
	^self iterateStack: aStack with: actionToDo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'DHV 5/15/2022 18:27:17'!
emptyQueryErrorMessage
	^'Invalid query search: query must not be empty or have blank spaces'.! !


!SentenceFinderByPrefix class methodsFor: 'initialize' stamp: 'DHV 5/15/2022 17:52:39'!
inStack: aStack
	^self new initializeWith: aStack.! !
