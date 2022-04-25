# Ejercicio 01 - AvispasYAbejas

## Respuestas

### Sobre implementar funcionalidad:
No, no pasaron todos los tests a la vez. Fuimos haciendo lo mínimo e indispensable para pasar cada test individual, y luego construyendo sobre ésto para pasar el siguiente test, etcétera. En una ocasión más adelante, sin embargo, si avanzamos de una manera tal que se pasen múltiples tests a la vez. 

Consideramos que cada una de estas maneras de implementar la funcionalidad tiene sus ventajas y desventajas. Pasar una prueba una por una tiene una clara ventaja y es que es mucho más fácil detectar y corregir errores en caso que aparezca uno. Por otro lado, esta estrategia puede tomar mucho más tiempo dado que se van implementando las funcionalidades poco a poco, en vez de ver todo lo que se nos pide e implementarlo junto, lo que además nos ocasiona en muchos casos, y al estar relacionados los tests, regresar atrás para verificar que estos continuan funcionando correctamente.

### Sobre código repetido:
El código repetido que tenemos es más que nada en los mensajes de las avispas y en los mensajes a completar, en donde las funcionalidades de los mismos son básicamente las mismas pero son respondidos por distintas avispas, por lo que son mensajes distintos. Quizás al representar a una Avispa como un objeto del cual desciendan Oriana y Ornella (Porque son las únicas con un método idéntico) nos permita reducir esa duplicidad de un mismo método para un mismo mensaje. 

El responsable de nuestro modelo de verificar la cantidad suficiente de recursos (orugas o polillas), es el método de intentarReproducirse correspondiente a cada avispa, el cual se lleva a cabo mediante envío de mensajes al habitat para conocer la cantidad de recursos, así como también este mismo método de intentarReproducirse es el encargado de poner el huevo. 

### Sobre cógido repetido 2:
El uso de clases hubiera supuesto una solución al problema antes descrito, con el cual podríamos abstraer el funcionamiento de intentarReproducirse en las avispas Ornella y Oriana, y quizás también intentar hacerlo aún más abstracto pudiendo modificar en los "hijos" que recurso consume, para así poder utilizarse no solo en Ornella y Oriana, sino también en Polly.

Para guardar los huevos usamos un diccionario, cuyas claves eran las firmas genéticas y sus valores las cantidades de huevos con dichas firmas. 
Buena pregunta. Una alternativa posible es tener un colaborador por cada firma genética y modificar su valor cada vez que una avispa con dicha firma se reproduce. Para el problema actual, esto debería ser suficiente y quizás, más simple (pero menos elegante).
