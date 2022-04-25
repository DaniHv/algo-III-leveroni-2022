# Ejercicio 01 - AvispasYAbejas

## Respuestas

### Sobre implementar funcionalidad:
No, no pasaron todos los tests a la vez. Fuimos haciendo lo mínimo e indispensable para pasar cada test individual, y luego construyendo sobre ésto para pasar el siguiente test, etcétera. En una ocasión más adelante, sin embargo, si avanzamos de una manera tal que se pasen múltiples tests a la vez. 

Consideramos que cada una de estas maneras de implementar la funcionalidad tiene sus ventajas y desventajas. Pasar una prueba una por una tiene una clara ventaja y es que es mucho más fácil detectar y corregir errores en caso que aparezca uno. Por otro lado, esta estrategia puede tomar mucho más tiempo dado que se van implementando las funcionalidades poco a poco, en vez de ver todo lo que se nos pide e implementarlo junto. 

### Sobre código repetido:
El código repetido que tenemos es más que nada en los mensajes de las avispas y en los mensajes a completar, en donde las funcionalidades de los mismos son básicamente las mismas pero son respondidos por distintas avispas, por lo que son mensajes distintos.

### Sobre cógido repetido 2:
Para guardar los huevos usamos un diccionario, cuyas claves eran las firmas genéticas y valores la cantidad de huevos con dichas firmas. 
Buena pregunta. Una alternativa posible es tener un colaborador por cada firma genética y modificar su valor cada vez que una avispa con dicha firma se reproduce. Para el problema actual,  esto debería ser suficiente y quizás, más simple (pero menos elegante).
