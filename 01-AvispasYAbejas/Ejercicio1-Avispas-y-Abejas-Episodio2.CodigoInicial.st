!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'jm 4/23/2022 17:55:34'!
intentarReproducirse
	(MiHabitat cantidadDeHuevosDeAvispas > 0)
		ifTrue: [
			(MiHabitat huevosConFirmaOrianaYOrnella > 0)
				ifTrue: [
					MiHabitat restarHuevoConFirmaOrianaYOrnella.
					MiHabitat sumarHuevoConFirmaLara.
					^nil
				].
			(MiHabitat huevosConFirmaPolly > 0)
				ifTrue: [
					MiHabitat restarHuevoConFirmaPolly.
					MiHabitat sumarHuevoConFirmaLara.
					^nil
				]
		]
! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'jm 4/23/2022 17:22:07'!
intentarReproducirse
	(MiHabitat cantidadDeOrugas > 0)
		ifTrue: [
			MiHabitat restarOruga.
			MiHabitat sumarHuevoConFirmaOrianaYOrnella.
		]! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'jm 4/23/2022 17:28:35'!
intentarReproducirse
	(MiHabitat cantidadDeOrugas > 0)
		ifTrue: [
			MiHabitat restarOruga.
			MiHabitat sumarHuevoConFirmaOrianaYOrnella.
		]	! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'jm 4/23/2022 17:28:43'!
intentarReproducirse
	(MiHabitat cantidadDePolillas > 0)
		ifTrue: [
			MiHabitat restarPolilla.
			MiHabitat sumarHuevoConFirmaPolly.
		]	! !


!classDefinition: #MiHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #MiHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MiHabitat class' category: 'AvispasYAbejasParte2'!
MiHabitat class
	instanceVariableNames: 'cantidadHuevos cantidadOrugas cantidadPolillas diccionarioHuevos'!

!MiHabitat class methodsFor: 'Orugas' stamp: 'jm 4/21/2022 20:14:54'!
actualizarCantidadOrugas: nuevaCantidad
	cantidadOrugas := nuevaCantidad! !

!MiHabitat class methodsFor: 'Orugas' stamp: 'jm 4/21/2022 20:13:25'!
cantidadDeOrugas
	^cantidadOrugas! !

!MiHabitat class methodsFor: 'Orugas' stamp: 'jm 4/21/2022 20:18:29'!
restarOruga
	self actualizarCantidadOrugas: (self cantidadDeOrugas-1)! !

!MiHabitat class methodsFor: 'Orugas' stamp: 'jm 4/21/2022 20:18:44'!
sumarOruga
	self actualizarCantidadOrugas: (self cantidadDeOrugas+1)! !


!MiHabitat class methodsFor: 'Polillas' stamp: 'jm 4/21/2022 20:54:29'!
actualizarCantidadPolillas: nuevaCantidad
	cantidadPolillas := nuevaCantidad! !

!MiHabitat class methodsFor: 'Polillas' stamp: 'jm 4/21/2022 20:54:47'!
cantidadDePolillas
	^cantidadPolillas! !

!MiHabitat class methodsFor: 'Polillas' stamp: 'jm 4/21/2022 20:55:16'!
restarPolilla
	self actualizarCantidadPolillas: (self cantidadDePolillas-1)! !

!MiHabitat class methodsFor: 'Polillas' stamp: 'jm 4/23/2022 16:49:40'!
sumarPolilla
	self actualizarCantidadPolillas: (self cantidadDePolillas+1)! !


!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/21/2022 20:06:31'!
actualizarCantidadHuevos: nuevaCantidad
	cantidadHuevos := nuevaCantidad! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/21/2022 19:57:25'!
cantidadDeHuevosDeAvispas
	^cantidadHuevos! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:35:29'!
huevosConFirmaLara
	^diccionarioHuevos at: 'huevosFirmaLara'! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:35:36'!
huevosConFirmaOrianaYOrnella
	^diccionarioHuevos at: 'huevosFirmaOrianaYOrnella'! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:35:43'!
huevosConFirmaPolly
	^diccionarioHuevos at: 'huevosFirmaPolly'! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:51:54'!
restarHuevoConFirmaOrianaYOrnella
	self restarHuevosTotales.
	diccionarioHuevos at: 'huevosFirmaOrianaYOrnella' put: (diccionarioHuevos at: 'huevosFirmaOrianaYOrnella')-1.! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:51:11'!
restarHuevoConFirmaPolly
	self restarHuevosTotales.
	diccionarioHuevos at: 'huevosFirmaPolly' put: (diccionarioHuevos at: 'huevosFirmaPolly')-1.! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:51:45'!
restarHuevosTotales
	self actualizarCantidadHuevos: (self cantidadDeHuevosDeAvispas-1)! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:38:41'!
sumarHuevoConFirmaLara
	self sumarHuevosTotales.
	diccionarioHuevos at: 'huevosFirmaLara' put: (diccionarioHuevos at: 'huevosFirmaLara')+1.! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:27:45'!
sumarHuevoConFirmaOrianaYOrnella
	self sumarHuevosTotales.
	diccionarioHuevos at: 'huevosFirmaOrianaYOrnella' put: (diccionarioHuevos at: 'huevosFirmaOrianaYOrnella')+1.! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:28:09'!
sumarHuevoConFirmaPolly
	self sumarHuevosTotales.
	diccionarioHuevos at: 'huevosFirmaPolly' put: (diccionarioHuevos at: 'huevosFirmaPolly')+1.! !

!MiHabitat class methodsFor: 'Huevos' stamp: 'jm 4/23/2022 17:27:52'!
sumarHuevosTotales
	self actualizarCantidadHuevos: (self cantidadDeHuevosDeAvispas+1)! !


!MiHabitat class methodsFor: 'Inicializar' stamp: 'jm 4/23/2022 17:38:56'!
inicializarHabitat
	diccionarioHuevos := 	Dictionary new.
	diccionarioHuevos at: 'huevosFirmaOrianaYOrnella' put: 0.
	diccionarioHuevos at: 'huevosFirmaPolly' put: 0.
	diccionarioHuevos at: 'huevosFirmaLara' put: 0.
	self actualizarCantidadHuevos:0.
	self actualizarCantidadOrugas:0.
	self actualizarCantidadPolillas:0.
	! !


!MiHabitat class methodsFor: '--** private fileout/in **--' stamp: 'jm 4/23/2022 17:58:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadHuevos := 1.
	cantidadOrugas := 2.
	cantidadPolillas := 1.
	diccionarioHuevos := ((Dictionary new) add: ('huevosFirmaLara'->0); add: ('huevosFirmaOrianaYOrnella'->0); add: ('huevosFirmaPolly'->1); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:33:27'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat huevosConFirmaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:33:51'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat huevosConFirmaOrianaYOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:34:13'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat huevosConFirmaOrianaYOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:34:22'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat huevosConFirmaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 20:02:43'!
habitat
	^MiHabitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 21:07:15'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat actualizarCantidadOrugas: 2.
	self habitat actualizarCantidadPolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:40:46'!
laAvispaLara
	^AvispaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 20:02:32'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 20:51:54'!
laAvispaOrnella
	^AvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 21:01:13'!
laAvispaPolly
	^AvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 20:21:50'!
queElHabitatTengaDosOrugasMas
	self habitat sumarOruga.
	self habitat sumarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 16:50:33'!
queElHabitatTengaDosPolillasMas
	self habitat sumarPolilla.
	self habitat sumarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/21/2022 20:20:16'!
queElHabitatTengaUnaOrugaMas
	self habitat sumarOruga! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 16:50:06'!
queElHabitatTengaUnaPolillaMas
	self habitat sumarPolilla! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'jm 4/23/2022 17:11:34'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat inicializarHabitat! !

MiHabitat initializeAfterFileIn!
