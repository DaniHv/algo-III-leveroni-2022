# Ejercicio 03 - Números

## Preguntas

### Aporte de los mensajes de DD
```En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?```

Un mensaje tiene la capacidad de convertir un problema polimórfico en uno monomórfico. En otras palabras, toma un problema que debe ser resuelto con la ejecución de un método que puede ser utilizado en varias clases distintas (y que es distinto según la clase en cuestión), y utiliza aquel correspondiende a la clase del objeto con el cual  estamos trabajando. Esto es posible ya que al envíar un mensaje a un objeto, nosotros conocemos dicho objeto, y por ende, su clase.

Sin embargo, cuando queremos realizar una acción que depende de más de un objeto, y estos pueden ser de distintas clases, no será suficiente saber la clase de uno de los objetos, ya que el comportamiento de la operación será distinto según la clase del otro objeto. Dando un ejemplo de este ejercicio, al sumar dos números, la operación  será resuelta de distintas maneras dependiendo de las clases de los números a ser sumados. Entonces, primero enviamos un mensaje a uno de los números, y por lo tanto pasamos a conocer su clase. Luego, enviamos un segundo mensaje al otro número, lo cual nos permite conocer su clase también. Al mismo tiempo, pasamos a ejecutar el método correspondiente a estas clases en particular.


### Lógica de instanciado
```Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?```

En nuestro problema, nos pareció apropiado el enfoque de instanciar un nuevo objeto mediante su creación en métodos de clase propios con el objetivo de crearlos partiendo de los números deseados (con `with:` en el caso de Entero y `with: over:` en el caso de Fraccion). Esto nos permite, además, hacer verificación de valores, para que en caso de obtener un valor indeseado (como denominador = 1 en fraccion) lanzar una excepción.

Esto además, nos permite asegurarnos que instancias de nuestras clases sean creadas de manera consistentes alrededor de todas las aplicaciones que hagan uso de ellos.


### Nombres de las categorías de métodos
```Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?```

Nuestros métodos propios están categorizados dentro de `arithmetic operations - private` puesto que, no esperamos que el usuario interactue directamente con ellos, sino más bien sea el Double Dispatch el encargado de dirigir correctamente al método necesario. Esto permite al usuario, desconocer en su totalidad la nomenclatura, y aún así ser capaz de seguir usando los métodos que normalmente conoce, -, +, *, /...

En cuanto a la nomenclatura de métodos, optamos por verb+instance para llamar a los métodos privados, tal como addFraction, multiplyByInteger... En ciertas situaciones, ayudados también con conectores, como por ejemplo substractToFraction, para describir de mejor manera aquellos métodos que van a "hacer algo" con el colaborador (en lugar de el colaborador algo con ellos), por ejemplo en divisiones o restas, en donde el orden importa, y no es lo mismo restar self - colaborator, que colaborator - self.


### Subclass Responsibility
```Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?```

El mensaje subclassResponsibility valida que la implementación de dicho método debe ser provista por la clase que herede dicha superclase.

Nuestra clase número está siendo utilizada como la representanción de una idea de la realidad; representa como su nombre indica, la idea de un número, no importa cual (entero/fraccion/complejo/etc), simplemente un número. Por ende, es representada como un template class, una clase abstracta que nos permite definir una estructura/comportamiento polimórfico entre las representaciones (subclasses) que hereden de dicha de idea (hijos). Esto nos permite, no solo tener bien definido el comportamiento que un número debe tener para nuestro uso, sino también hacer consistente entre todas las subclases los mensajes que reciben, y poder utilizar a estos de manera similar.


### No rompas
```¿Por qué está mal/qué problemas trae romper encapsulamiento?```

Una instancia no debe tener la necesidad de conocer o depender de detalles internos de funcionamiento sobre otra instancia. Por el contrario, solo debe ser capaz de interactuar con ella de la misma manera en la que una aplicación externa y no dependiente de su implementación la utilizaría.

Esto nos permite tener instancias cuyas relaciones puedan ser reemplazadas por todas aquellas que sean capaz de realizar las mismas acciones (o responder a los mismos mensajes) sin afectar en términos generales su funcionamiento.

Como ya se ha dicho, en el Double Dispatch, nuestros mensajes nos permiten conocer la clase del objeto con el cual estamos trabajando. Esta información debería ser suficiente para saber qué método ejecutar (pues sólo depende de la clase). Si se rompe el encapsulamiento, el comportamiento del objeto dependerá también de componentes externos al objeto y a su clase.
