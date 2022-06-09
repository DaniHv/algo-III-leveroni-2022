!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/8/2022 19:45:55'!
test01AnEmptyPortfolioHasZeroBalance
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/8/2022 21:39:27'!
test02PortfolioBalanceEqualsSumOfAccountsBalances
	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	Deposit register: (100 * peso) on: account1.
	account2 := ReceptiveAccount new.
	Deposit register: (200 * peso) on: account2.
	
	portfolio registerAsset: account1.
	portfolio registerAsset: account2.

	self assert: portfolio balance equals: 300 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:11:57'!
test03PortfolioBalanceEqualsSumOfItsAssetsBalances
	| portfolio account0 account1 account2 subportfolio1 subportfolio2 |
	
	portfolio := Portfolio new.
	
	account0 := ReceptiveAccount new.
	Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.

	subportfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.
	
	subportfolio2 := Portfolio new.
	account2 := ReceptiveAccount new.
	Deposit register: (300 * peso) on: account2.
	subportfolio2 registerAsset: account2.
	portfolio registerAsset: subportfolio2.

	self assert: portfolio balance equals: 600 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:12:05'!
test04PortfolioKnowsRegisteredTransactionOnItsAssets
	| portfolio account0 deposit0 subportfolio1 account1 deposit1 |
	
	portfolio := Portfolio new.
	
	account0 := ReceptiveAccount new.
	deposit0 := Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.
	
	subportfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.

	self assert: (portfolio hasRegistered: deposit0).
	self assert: (portfolio hasRegistered: deposit1).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/8/2022 21:39:46'!
test05PortfolioDoesNotKnowUnregisteredTransaction
	| portfolio account deposit |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio registerAsset: account.
	
	deposit := Deposit for: (100 * peso).

	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:12:20'!
test06PortfolioCanAccessTransactionsFromItsAssets
	| portfolio account0 deposit0 subportfolio1 account1 deposit1 transactions |
	
	portfolio := Portfolio new.
	
	account0 := ReceptiveAccount new.
	deposit0 := Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.
	
	subportfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.

	transactions := portfolio transactions.

	self assert: (transactions includes: deposit0).
	self assert: (transactions includes: deposit1).
	self assert: transactions size equals: 2.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:12:33'!
test07PortfolioCannotRegisterAssetsAlreadyIncluded
	| portfolio account subportfolio |
	
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	subportfolio := Portfolio new.

	portfolio registerAsset: account.
	portfolio registerAsset: subportfolio.

	self should: [portfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].
		
	self should: [portfolio registerAsset: subportfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:16:57'!
test08PortfolioCannotRegisterAssetAlreadyIncludedInItsSubportfolios
	| portfolio subportfolio subsubportfolio account |

	portfolio := Portfolio new.
	subportfolio := Portfolio new.
	subsubportfolio := Portfolio new.

	account := ReceptiveAccount new.
	subportfolio registerAsset: account.
	subportfolio registerAsset: subsubportfolio.
	portfolio registerAsset: subportfolio.

	self should: [portfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].


	self should: [portfolio registerAsset: subsubportfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:10:13'!
test09PortfolioCannotAddItself
	| portfolio |

	portfolio := Portfolio new.

	self should: [portfolio registerAsset: portfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:41:15'!
test10PortfolioCannotRegisterAssetAlreadyIncludedOnItsParent
	| portfolio subportfolio account |

	portfolio := Portfolio new.
	subportfolio := Portfolio new.
	account := ReceptiveAccount new.
	portfolio registerAsset: account.
	portfolio registerAsset: subportfolio.

	self should: [	subportfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageAssetAlreadyIncludedInParent].
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jm 6/8/2022 19:36:52'!
test08TransferValuesAreCorrect

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: transfer value equals: (200* peso).
	self assert: transfer credit value equals: (200 * peso).
	self assert: transfer debit value equals: (200 * peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jm 6/8/2022 19:37:04'!
test09TransferUpdatesBalanceAccordingly
	| receiverAccount senderAccount |
	
	receiverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new. 
	Deposit register: 200 * peso on: senderAccount.
	Transfer from: senderAccount to: receiverAccount for: (100 * peso).
	
	self assert: receiverAccount balance equals: (100 * peso).
	self assert: senderAccount balance equals: (100 * peso).
	
	
	
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jm 6/8/2022 19:37:41'!
test10AccountsKnowRespectiveTransferTransactions 

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: (senderAccount hasRegistered: transfer debit).
	self assert: (receiverAccount hasRegistered: transfer credit).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jm 6/8/2022 19:37:53'!
test11AccountsDontKnowCounterpartTransferTransactions 

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self deny: (senderAccount hasRegistered: transfer credit).
	self deny: (receiverAccount hasRegistered: transfer debit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'jm 6/8/2022 19:37:58'!
test12DebitKnowsCreditAndCreditKnowsDebit

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: transfer credit counterpart = transfer debit.
	self assert: transfer debit counterpart = transfer credit.
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'jm 6/8/2022 18:29:51'!
signedValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'jm 6/8/2022 18:31:14'!
value 
	^value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'jm 6/8/2022 18:54:48'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jm 6/8/2022 18:53:52'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jm 6/8/2022 18:34:34'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #ATMTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #ATMTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
ATMTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'value' stamp: 'jm 6/6/2022 21:00:52'!
signedValue

	^self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
ATMTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'value' stamp: 'jm 6/6/2022 21:01:19'!
signedValue
	^(self value)*(-1)! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'counterpart' stamp: 'jm 6/8/2022 18:28:39'!
counterpart
	^counterpart
! !

!TransferTransaction methodsFor: 'counterpart' stamp: 'jm 6/8/2022 18:28:20'!
registerCounterpart: aCounterpartTransaction
	counterpart := aCounterpartTransaction
! !


!classDefinition: #Credit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #Credit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Credit methodsFor: 'as yet unclassified' stamp: 'jm 6/8/2022 18:31:46'!
signedValue
	^self value! !


!classDefinition: #Debit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #Debit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Debit methodsFor: 'as yet unclassified' stamp: 'jm 6/8/2022 18:32:13'!
signedValue
	^(self value)*(-1)! !


!classDefinition: #BankAssets category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAssets
	instanceVariableNames: 'parentAsset'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAssets methodsFor: 'transactions' stamp: 'DHV 6/8/2022 20:59:20'!
balance
	self subclassResponsibility.! !

!BankAssets methodsFor: 'transactions' stamp: 'DHV 6/8/2022 20:59:31'!
hasTransaction: aTransaction
	self subclassResponsibility.! !

!BankAssets methodsFor: 'transactions' stamp: 'DHV 6/8/2022 20:59:36'!
transactions
	self subclassResponsibility.! !


!BankAssets methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:06:18'!
isIncludedInAsset: anAsset
	^anAsset isOrIncludesAsset: self.! !

!BankAssets methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 17:38:20'!
isOrIncludesAsset: anAsset
	self subclassResponsibility.! !

!BankAssets methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:25:30'!
parentAsset
	^parentAsset.! !

!BankAssets methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 18:25:58'!
registerParentAsset: anAsset
	parentAsset := anAsset.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAssets subclass: #Portfolio
	instanceVariableNames: 'assets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'assertions' stamp: 'DHV 6/9/2022 18:29:08'!
assertAssetIsNotAlreadyIncludedOrItself: anAsset
	(self isOrIncludesAsset: anAsset) ifTrue: [self error: self class errorMessageCannotAddAlreadyIncludedAssetOrItself].! !

!Portfolio methodsFor: 'assertions' stamp: 'DHV 6/9/2022 18:42:17'!
assertAssetParentDoesNotAlreadyInclude: anAsset
	(parentAsset isNil) ifFalse: [(anAsset isIncludedInAsset: parentAsset) ifTrue: [self error: self class errorMessageAssetAlreadyIncludedInParent]].! !

!Portfolio methodsFor: 'assertions' stamp: 'DHV 6/9/2022 18:33:21'!
validateCanRegisterAsset: anAsset
	self assertAssetIsNotAlreadyIncludedOrItself: anAsset.
	self assertAssetParentDoesNotAlreadyInclude: anAsset.
! !


!Portfolio methodsFor: 'initialization' stamp: 'DHV 6/8/2022 21:40:22'!
initialize
	assets := OrderedCollection new.! !


!Portfolio methodsFor: 'accounts - subportfolios' stamp: 'DHV 6/8/2022 21:36:13'!
assets
	^assets.! !

!Portfolio methodsFor: 'accounts - subportfolios' stamp: 'DHV 6/9/2022 18:36:00'!
registerAsset: anAsset
	self validateCanRegisterAsset: anAsset.

	assets add: anAsset.
	anAsset registerParentAsset: self.! !


!Portfolio methodsFor: 'transactions' stamp: 'DHV 6/8/2022 21:40:55'!
balance
	^self assets sum: [:anAccountOrPortfolio | anAccountOrPortfolio balance] ifEmpty: [^0].! !

!Portfolio methodsFor: 'transactions' stamp: 'DHV 6/8/2022 21:40:59'!
hasRegistered: aTransaction
	^self assets anySatisfy: [:anAccountOrPortfolio |
		anAccountOrPortfolio hasRegistered: aTransaction
	].! !

!Portfolio methodsFor: 'transactions' stamp: 'DHV 6/8/2022 21:41:03'!
transactions
	| transactions |
	
	transactions := OrderedCollection new.
	
	self assets do: [:anAccountOrPortfolio | transactions addAll: anAccountOrPortfolio transactions].
	
	^transactions.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 17:40:34'!
isOrIncludesAsset: anAssetToEvaluate
	^(self == anAssetToEvaluate) or: (assets anySatisfy: [:anAsset | anAsset isOrIncludesAsset: anAssetToEvaluate]).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'DHV 6/9/2022 18:42:05'!
errorMessageAssetAlreadyIncludedInParent
	^'Asset already included on its parent'.! !

!Portfolio class methodsFor: 'error messages' stamp: 'DHV 6/9/2022 18:09:33'!
errorMessageCannotAddAlreadyIncludedAssetOrItself
	^'Cannot add an account or portfolio already included'.! !

!Portfolio class methodsFor: 'error messages' stamp: 'DHV 6/9/2022 18:44:43'!
errorMessageCannotRegisterPortfolioWithAssetsInCommon
	^'Cannot register portfolio on another portfolio if they have assets in common'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAssets subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'jm 6/6/2022 21:01:46'!
balance

	^transactions sum: [ :aTransaction | aTransaction signedValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'DHV 6/9/2022 17:40:43'!
isOrIncludesAsset: anAssetToEvaluate
	^(self == anAssetToEvaluate).! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value credit debit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'jm 6/8/2022 19:02:53'!
credit
	^credit! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'jm 6/8/2022 19:03:01'!
debit
	^debit! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'jm 6/8/2022 18:40:48'!
initializeFrom: aSenderAccount to: aReceiverAccount for: aValue
	
	debit := Debit register: aValue on: aSenderAccount.
	credit := Credit register: aValue on: aReceiverAccount.
	
	debit registerCounterpart: credit.
	credit registerCounterpart: debit.
	
	value := aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'jm 6/6/2022 20:18:25'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'jm 6/6/2022 19:58:45'!
from: aSenderAccount to: aReceiverAccount for: aValue
	^self new initializeFrom: aSenderAccount to: aReceiverAccount for: aValue! !
