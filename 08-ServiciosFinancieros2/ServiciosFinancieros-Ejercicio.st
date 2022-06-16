!classDefinition: #BankAssetTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #BankAssetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
BankAssetTest subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:40:56'!
test01AnEmptyPortfolioHasZeroBalance
	| portfolio |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	self assert: portfolio balance equals: 0 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:41:15'!
test02PortfolioBalanceEqualsSumOfAccountsBalances
	| portfolio account1 account2 |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	account1 := ReceptiveAccount named: 'Account1'.
	Deposit register: (100 * peso) on: account1.
	account2 := ReceptiveAccount named: 'Account2'.
	Deposit register: (200 * peso) on: account2.
	
	portfolio registerAsset: account1.
	portfolio registerAsset: account2.

	self assert: portfolio balance equals: 300 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:42:31'!
test03PortfolioBalanceEqualsSumOfItsAssetsBalances
	| portfolio account0 account1 account2 subportfolio1 subportfolio2 |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	account0 := ReceptiveAccount named: 'Account0'.
	Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.

	subportfolio1 := Portfolio named: 'Subportfolio1'.
	account1 := ReceptiveAccount  named: 'Account1'.
	Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.
	
	subportfolio2 := Portfolio named: 'Subportfolio2'.
	account2 := ReceptiveAccount  named: 'Account2'.
	Deposit register: (300 * peso) on: account2.
	subportfolio2 registerAsset: account2.
	portfolio registerAsset: subportfolio2.

	self assert: portfolio balance equals: 600 * peso. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:45:03'!
test04PortfolioKnowsRegisteredTransactionOnItsAssets
	| portfolio account0 deposit0 subportfolio1 account1 deposit1 |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	account0 := ReceptiveAccount named: 'Account0'.
	deposit0 := Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.
	
	subportfolio1 := Portfolio named: 'Subportfolio1'.
	account1 := ReceptiveAccount named: 'Account1'.
	deposit1 := Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.

	self assert: (portfolio hasRegistered: deposit0).
	self assert: (portfolio hasRegistered: deposit1).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:43:11'!
test05PortfolioDoesNotKnowUnregisteredTransaction
	| portfolio account deposit |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	account := ReceptiveAccount named: 'Account'.
	portfolio registerAsset: account.
	
	deposit := Deposit for: (100 * peso).

	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:44:30'!
test06PortfolioCanAccessTransactionsFromItsAssets
	| portfolio account0 deposit0 subportfolio1 account1 deposit1 transactions |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	account0 := ReceptiveAccount named: 'Account0'.
	deposit0 := Deposit register: (100 * peso) on: account0.
	portfolio registerAsset: account0.
	
	subportfolio1 := Portfolio named: 'Subportfolio1'.
	account1 := ReceptiveAccount named: 'Account1'.
	deposit1 := Deposit register: (200 * peso) on: account1.
	subportfolio1 registerAsset: account1.
	portfolio registerAsset: subportfolio1.

	transactions := portfolio transactions.

	self assert: (transactions includes: deposit0).
	self assert: (transactions includes: deposit1).
	self assert: transactions size equals: 2.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:44:20'!
test07PortfolioCannotRegisterAssetsAlreadyIncluded
	| portfolio account subportfolio |
	
	portfolio := Portfolio named: 'Portfolio'.

	account := ReceptiveAccount named: 'Account'.
	subportfolio := Portfolio named: 'Subportfolio'.

	portfolio registerAsset: account.
	portfolio registerAsset: subportfolio.

	self should: [portfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].
		
	self should: [portfolio registerAsset: subportfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:44:04'!
test08PortfolioCannotRegisterAssetAlreadyIncludedInItsSubportfolios
	| portfolio subportfolio subsubportfolio account |

	portfolio := Portfolio named: 'Portfolio'.
	subportfolio := Portfolio named: 'Subportfolio'.
	subsubportfolio := Portfolio named: 'Subsubportfolio'.

	account := ReceptiveAccount named: 'Account'.
	subportfolio registerAsset: account.
	subportfolio registerAsset: subsubportfolio.
	portfolio registerAsset: subportfolio.

	self should: [portfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].


	self should: [portfolio registerAsset: subsubportfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:43:41'!
test09PortfolioCannotAddItself
	| portfolio |

	portfolio := Portfolio named: 'Portfolio'.

	self should: [portfolio registerAsset: portfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageCannotAddAlreadyIncludedAssetOrItself].
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:43:45'!
test10PortfolioCannotRegisterAssetAlreadyIncludedOnItsParent
	| portfolio subportfolio account |

	portfolio := Portfolio named: 'Portfolio'.
	subportfolio := Portfolio named: 'Subportfolio'.
	account := ReceptiveAccount  named: 'Account'.
	portfolio registerAsset: account.
	portfolio registerAsset: subportfolio.

	self should: [	subportfolio registerAsset: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText equals: portfolio class errorMessageAssetAlreadyIncludedInParent].
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 17:50:00'!
test11PortfolioKnowsItsName
	| portfolio |
	
	portfolio := Portfolio named: 'Hola'.
	
	self assert: portfolio name  equals: 'Hola'.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
BankAssetTest subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:39:46'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount named: 'Account'.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:39:49'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount named: 'Account'.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:39:54'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount named: 'Account'.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:39:58'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount named: 'Account'.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:01'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount named: 'Account'.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:05'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount named: 'Account'.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:09'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount named: 'Account'.
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:20'!
test08TransferValuesAreCorrect

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount named: 'SenderAccount'.
	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: transfer value equals: (200* peso).
	self assert: transfer credit value equals: (200 * peso).
	self assert: transfer debit value equals: (200 * peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:32'!
test09TransferUpdatesBalanceAccordingly
	| receiverAccount senderAccount |
	
	senderAccount := ReceptiveAccount named: 'SenderAccount'.
	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	Deposit register: 200 * peso on: senderAccount.
	Transfer from: senderAccount to: receiverAccount for: (100 * peso).
	
	self assert: receiverAccount balance equals: (100 * peso).
	self assert: senderAccount balance equals: (100 * peso).
	
	
	
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:35'!
test10AccountsKnowRespectiveTransferTransactions 

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount named: 'SenderAccount'.
	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: (senderAccount hasRegistered: transfer debit).
	self assert: (receiverAccount hasRegistered: transfer credit).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:38'!
test11AccountsDontKnowCounterpartTransferTransactions 

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount named: 'SenderAccount'.
	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self deny: (senderAccount hasRegistered: transfer credit).
	self deny: (receiverAccount hasRegistered: transfer debit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/15/2022 20:40:42'!
test12DebitKnowsCreditAndCreditKnowsDebit

	| senderAccount receiverAccount transfer |
	
	senderAccount := ReceptiveAccount named: 'SenderAccount'.
	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	Deposit register: 500 * peso on: senderAccount.
	transfer := Transfer from: senderAccount to: receiverAccount for: (200 * peso).
		
	self assert: transfer credit counterpart = transfer debit.
	self assert: transfer debit counterpart = transfer credit.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'DHV 6/16/2022 17:50:22'!
test12ReceptiveAccountKnowsItsName
	| portfolio |
	
	portfolio := ReceptiveAccount named: 'Hola'.
	
	self assert: portfolio name  equals: 'Hola'.! !


!classDefinition: #BankReportTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #BankReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Ejercicio'!
BankReportTest subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:36:35'!
test01AccountSummaryShowsNoTransactionsIfAssetHasNoTransactions
	| account report |
	
	account := ReceptiveAccount named: 'Account'.
	report := AccountSummary createFor: account.

	self assert: (report generateReport at: 1) equals: 'Balance = 0 pesos'.
	! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:36:41'!
test02AccountSummaryReportsATMTransactionsCorrectly
	| account report |

	account := ReceptiveAccount named: 'Account'.
	Deposit register: (100 * peso) on: account.
	Withdraw register: (50 * peso) on: account.
	report := (AccountSummary createFor: account) generateReport.

	self assert: (report at: 1) equals: 'Depósito por 100 pesos'.
	self assert: (report at: 2) equals: 'Extracción por 50 pesos'.
	self assert: (report at: 3) equals: 'Balance = 50 pesos'.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:36:56'!
test03AccountSummaryReportsTransferTransactionsCorrectly
	| receiverAccount senderAccount receiverReport senderReport |

	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	senderAccount := ReceptiveAccount named: 'senderAccount'.
	
	Transfer from: senderAccount to: receiverAccount for: (100 * peso).

	receiverReport := (AccountSummary createFor: receiverAccount) generateReport.
	senderReport := (AccountSummary createFor: senderAccount) generateReport.

	self assert: (receiverReport at: 1) equals: 'Entrada por transferencia de 100 pesos'.
	self assert: (receiverReport at: 2) equals: 'Balance = 100 pesos'.
	self assert: (senderReport at: 1) equals: 'Salida por transferencia de 100 pesos'.
	self assert: (senderReport at: 2) equals: 'Balance = -100 pesos'.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:35:22'!
test04AccountSummaryReportsMixedTransactionsCorrectly
	| receiverAccount senderAccount receiverReport senderReport |

	receiverAccount := ReceptiveAccount named: 'ReceiverAccount'.
	senderAccount := ReceptiveAccount named: 'senderAccount'.
	Withdraw register: (100 * peso) on: receiverAccount.
	Deposit register: (50 * peso) on: senderAccount.

	Transfer from: senderAccount to: receiverAccount for: (100 * peso).

	receiverReport := (AccountSummary createFor: receiverAccount) generateReport.
	senderReport := (AccountSummary createFor: senderAccount) generateReport.

	self assert: (receiverReport at: 1) equals: 'Extracción por 100 pesos'.
	self assert: (receiverReport at: 2) equals: 'Entrada por transferencia de 100 pesos'.
	self assert: (receiverReport at: 3) equals: 'Balance = 0 pesos'.
	self assert: (senderReport at: 1) equals: 'Depósito por 50 pesos'.
	self assert: (senderReport at: 2) equals: 'Salida por transferencia de 100 pesos'.
	self assert: (senderReport at: 3) equals: 'Balance = -50 pesos'.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:39:52'!
test05AccountSummaryReportsPortfolioTransactionsCorrectly
	| portfolio account1 account2 report |

	portfolio := Portfolio named: 'Portfolio'.
	account1 := ReceptiveAccount named: 'account1'.
	account2 := ReceptiveAccount named: 'account2'.
	Withdraw register: (100 * peso) on: account1.
	Deposit register: (50 * peso) on: account2.
	portfolio registerAsset: account1.
	portfolio registerAsset: account2.
	
	report := (AccountSummary createFor: portfolio) generateReport.

	self assert: (report at: 1) equals: 'Extracción por 100 pesos'.
	self assert: (report at: 2) equals: 'Depósito por 50 pesos'.
	self assert: (report at: 3) equals: 'Balance = -50 pesos'.
! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Ejercicio'!
BankReportTest subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:02:46'!
test01CannotReportForNonPortfolioAsset
	| account |
	
	account := ReceptiveAccount named: 'My Account'.
	
	self
		should: [PortfolioTreePrinter createFor: account]
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTreePrinter errorMessageCannotReportForNonPortfolioAssets].! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:44:45'!
test02PortfolioTreePrinterIsCorrectForEmptyPortfolio
	| portfolio report |
	
	portfolio := Portfolio named: 'Portfolio'.
	
	report := PortfolioTreePrinter createFor: portfolio.
	
	self assert: (report generateReport) equals: 'Portfolio'.! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:45:05'!
test03PortfolioTreePrinterIsCorrectForPortfolioWithAccounts
	| portfolio report account1 account2 |
	
	portfolio := Portfolio named: 'Portfolio'.
	account1 := ReceptiveAccount named: 'Account1'.
	account2 := ReceptiveAccount named: 'Account2'.
	
	portfolio registerAsset: account1.
	portfolio registerAsset: account2.

	report := PortfolioTreePrinter createFor: portfolio.
	
	self assert: (report generateReport) equals: 
		'Portfolio' , String newLineString,
		String tab, 'Account1', String newLineString,
		String tab,  'Account2'.! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Ejercicio'!
BankReportTest subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:39:14'!
test01TransferNetReportIsZeroIfAccountHasNoTransactions
	| account report |
	
	account := ReceptiveAccount named: 'Account'.

	report := (TransferNet createFor: account) generateReport.
	
	self assert: report equals: 0.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:39:21'!
test02TransferNetReportIsZeroIfAccountHasNoTransfers
	| account report |
	
	account := ReceptiveAccount named: 'Account'.
	Deposit register: (100 * peso) on: account.
	Withdraw register: (100 * peso) on: account.

	report := (TransferNet createFor: account) generateReport.
	
	self assert: report equals: 0.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:39:32'!
test03TransferNetReportWithASingleTransferIsCorrect
	| senderAccount receiverAccount senderReport receiverReport |

	senderAccount := ReceptiveAccount named: 'Account'.
	receiverAccount := ReceptiveAccount named: 'Account'.
	
	Transfer from: senderAccount to: receiverAccount for: (100 * peso).

	senderReport := (TransferNet createFor: senderAccount) generateReport.
	receiverReport := (TransferNet createFor: receiverAccount) generateReport.

	self assert: senderReport equals: (-100 * peso).
	self assert: receiverReport equals: (100 * peso).! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:39:38'!
test04TransferNetReportWithMultipleTransfersIsCorrect
	| account1 account2 account1Report account2Report |

	account1 := ReceptiveAccount named: 'Account'.
	account2 := ReceptiveAccount named: 'Account'.
	
	Transfer from: account1 to: account2 for: (100 * peso).
	Transfer from: account2 to: account1 for: (300 * peso).
	Transfer from: account1 to: account2 for: (50 * peso).

	account1Report := (TransferNet createFor: account1) generateReport.
	account2Report := (TransferNet createFor: account2) generateReport.

	self assert: account1Report equals: (150 * peso).
	self assert: account2Report equals: (-150 * peso).! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:43:00'!
test05TransferNetReportWithPortfolioIsCorrect
	| portfolio account1 account2 report |

	portfolio := Portfolio named: 'Portfolio'.
	account1 := ReceptiveAccount named: 'Account1'.
	account2 := ReceptiveAccount named: 'Account2'.
	
	Transfer from: account1 to: account2 for: (100 * peso).
	Transfer from: account2 to: account1 for: (300 * peso).
	Transfer from: account1 to: account2 for: (50 * peso).

	portfolio registerAsset: account1.
	portfolio registerAsset: account2.

	report := (TransferNet createFor: portfolio) generateReport.

	self assert: report equals: (0 * peso).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'DHV 6/16/2022 17:47:21'!
reportValueFor: aReport
	self subclassResponsibility.! !

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

!Deposit methodsFor: 'value' stamp: 'DHV 6/15/2022 20:20:32'!
reportValueFor: aReport
	^aReport depositReportValue: self.! !

!Deposit methodsFor: 'value' stamp: 'jm 6/6/2022 21:00:52'!
signedValue

	^self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
ATMTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'value' stamp: 'DHV 6/15/2022 20:21:03'!
reportValueFor: aReport
	^aReport withdrawReportValue: self.! !

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

!Credit methodsFor: 'value' stamp: 'DHV 6/15/2022 20:21:21'!
reportValueFor: aReport
	^aReport transferCreditReportValue: self.! !

!Credit methodsFor: 'value' stamp: 'jm 6/8/2022 18:31:46'!
signedValue
	^self value! !


!classDefinition: #Debit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #Debit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Debit methodsFor: 'value' stamp: 'DHV 6/15/2022 20:22:06'!
reportValueFor: aReport
	^aReport transferDebitReportValue: self.! !

!Debit methodsFor: 'value' stamp: 'jm 6/8/2022 18:32:13'!
signedValue
	^(self value)*(-1)! !


!classDefinition: #BankAssets category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAssets
	instanceVariableNames: 'name parentAsset'
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


!BankAssets methodsFor: 'relations' stamp: 'DHV 6/9/2022 18:06:18'!
isIncludedInAsset: anAsset
	^anAsset isOrIncludesAsset: self.! !

!BankAssets methodsFor: 'relations' stamp: 'DHV 6/9/2022 17:38:20'!
isOrIncludesAsset: anAsset
	self subclassResponsibility.! !

!BankAssets methodsFor: 'relations' stamp: 'DHV 6/9/2022 18:25:30'!
parentAsset
	^parentAsset.! !

!BankAssets methodsFor: 'relations' stamp: 'DHV 6/9/2022 18:25:58'!
registerParentAsset: anAsset
	parentAsset := anAsset.! !


!BankAssets methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:52:38'!
isPortfolio
	self subclassResponsibility.! !

!BankAssets methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:52:43'!
isReceptiveAccount
	self subclassResponsibility.! !


!BankAssets methodsFor: 'initialization' stamp: 'DHV 6/15/2022 20:37:41'!
initializeWithName: aName
	self subclassResponsibility.! !


!BankAssets methodsFor: 'name' stamp: 'DHV 6/16/2022 17:50:33'!
name
	^name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankAssets class' category: 'ServiciosFinancieros-Ejercicio'!
BankAssets class
	instanceVariableNames: ''!

!BankAssets class methodsFor: 'as yet unclassified' stamp: 'DHV 6/15/2022 20:37:36'!
named: aName
	^self new initializeWithName: aName.! !


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


!Portfolio methodsFor: 'initialization' stamp: 'DHV 6/15/2022 20:36:11'!
initializeWithName: aName
	assets := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'accounts - subportfolios' stamp: 'DHV 6/8/2022 21:36:13'!
assets
	^assets.! !

!Portfolio methodsFor: 'accounts - subportfolios' stamp: 'DHV 6/9/2022 17:40:34'!
isOrIncludesAsset: anAssetToEvaluate
	^(self == anAssetToEvaluate) or: (assets anySatisfy: [:anAsset | anAsset isOrIncludesAsset: anAssetToEvaluate]).! !

!Portfolio methodsFor: 'accounts - subportfolios' stamp: 'DHV 6/16/2022 18:08:39'!
iterateAssetsAndDo: aBlock
	assets do: 
		[:anAsset | 
			aBlock value: anAsset.
			
			(anAsset isPortfolio) ifTrue: [anAsset iterateAssetsAndDo: aBlock].
		]! !

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


!Portfolio methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:52:57'!
isPortfolio
	^true! !

!Portfolio methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:53:12'!
isReceptiveAccount
	^false! !

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


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAssets subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DHV 6/15/2022 20:30:50'!
initializeWithName: aName
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DHV 6/15/2022 20:23:48'!
balance

	^transactions sum: [ :aTransaction | aTransaction signedValue ] ifEmpty: [ 0 * peso ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DHV 6/9/2022 17:40:43'!
isOrIncludesAsset: anAssetToEvaluate
	^(self == anAssetToEvaluate).! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:53:00'!
isPortfolio
	^false! !

!ReceptiveAccount methodsFor: 'identifiers' stamp: 'DHV 6/16/2022 17:53:06'!
isReceptiveAccount
	^true! !


!classDefinition: #BankReport category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankReport
	instanceVariableNames: 'asset'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankReport methodsFor: 'initialization' stamp: 'DHV 6/14/2022 20:33:18'!
initializeFor: aBankAsset
	asset := aBankAsset.! !


!BankReport methodsFor: 'report' stamp: 'DHV 6/14/2022 20:36:26'!
generateReport
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankReport class' category: 'ServiciosFinancieros-Ejercicio'!
BankReport class
	instanceVariableNames: ''!

!BankReport class methodsFor: 'nil' stamp: 'DHV 6/14/2022 20:36:03'!
createFor: aBankAsset
	^self new initializeFor: aBankAsset.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Ejercicio'!
BankReport subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 18:48:27'!
valueNameOf: aValue
	^(aValue amount asString), ' ', (aValue unit nameFor: aValue amount).! !


!AccountSummary methodsFor: 'report' stamp: 'DHV 6/16/2022 18:48:27'!
generateReport
	| report |
	
	report := asset transactions collect: [:aTransaction | aTransaction reportValueFor: self].
	report add: 'Balance = ', (self valueNameOf: asset balance).

	^report.! !


!AccountSummary methodsFor: 'transactions values' stamp: 'DHV 6/16/2022 18:48:27'!
depositReportValue: aDeposit
	^'Depósito por ', (self valueNameOf: aDeposit value).! !

!AccountSummary methodsFor: 'transactions values' stamp: 'DHV 6/16/2022 18:48:27'!
transferCreditReportValue: aTransferCredit
	^'Entrada por transferencia de ', (self valueNameOf: aTransferCredit value).! !

!AccountSummary methodsFor: 'transactions values' stamp: 'DHV 6/16/2022 18:48:27'!
transferDebitReportValue: aTransferDebit
	^'Salida por transferencia de ', (self valueNameOf: aTransferDebit value).! !

!AccountSummary methodsFor: 'transactions values' stamp: 'DHV 6/16/2022 18:48:27'!
withdrawReportValue: aWithdraw
	^'Extracción por ', (self valueNameOf: aWithdraw value).! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Ejercicio'!
BankReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTreePrinter methodsFor: 'report' stamp: 'DHV 6/16/2022 18:24:09'!
generateReport
	| report |
	
	report := asset name.
	
	asset iterateAssetsAndDo: [:anAsset | report := report, String newLineString, String tab, anAsset name].

	^report.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'error messages' stamp: 'DHV 6/16/2022 17:55:29'!
errorMessageCannotReportForNonPortfolioAssets
	^'PortfolioTreePrinter report can only be used for Portfolios'! !


!PortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 17:56:42'!
createFor: aBankAsset
	self validateAsset: aBankAsset.
	
	^self new initializeFor: aBankAsset.! !

!PortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'DHV 6/16/2022 17:57:28'!
validateAsset: aBankAsset
	(aBankAsset isPortfolio) ifFalse: [self error: self errorMessageCannotReportForNonPortfolioAssets].! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Ejercicio'!
BankReport subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNet methodsFor: 'report' stamp: 'DHV 6/15/2022 20:19:24'!
generateReport
	| transferBalance |
	
	transferBalance := asset transactions sum: [:aTransaction | aTransaction reportValueFor: self] ifEmpty: [0 * peso].
	
	^transferBalance! !


!TransferNet methodsFor: 'transations values' stamp: 'DHV 6/15/2022 20:20:32'!
depositReportValue: aDeposit
	^0.! !

!TransferNet methodsFor: 'transations values' stamp: 'DHV 6/15/2022 20:21:21'!
transferCreditReportValue: aTransferCredit
	^aTransferCredit signedValue.! !

!TransferNet methodsFor: 'transations values' stamp: 'DHV 6/15/2022 20:22:06'!
transferDebitReportValue: aTransferDebit
	^aTransferDebit signedValue.! !

!TransferNet methodsFor: 'transations values' stamp: 'DHV 6/15/2022 20:21:02'!
withdrawReportValue: aWithdraw
	^0.! !


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
