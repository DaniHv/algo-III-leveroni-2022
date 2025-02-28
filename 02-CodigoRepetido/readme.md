# Ejercicio 01 - CodigoRepetido

## Preguntas
### Abstracción de los tests 01 y 02
En los tests 01 y 02 hay código repetido, en la forma en la que se cronometra el tiempo de ejecución de una acción particular. Por eso, abstraímos esta funcionalidad en un método auxiliar que recibe como colaborador externo a la acción a ejecutar, la cronometra, y devuelve el tiempo de ejecución de la misma. Luego, podemos utilizar este método tanto en el test 01 y el 02.
Esta abstracción realizada representa a un cronómetro, una entidad de la realidad que no estaba representada en el código anteriormente. 

### Cómo representar en Smalltalk
En la realidad nosotros podemos distinguir entre la idea de un objeto y los objetos concretos de dicha idea. Por ejemplo, podemos distinguir entre la idea de un auto, lo que nosotros asociamos en nuestras mentes al concepto de auto; y un auto físico, el objeto concreto en sí. 

En Smalltalk, tenemos una suerte de paralelismo con esta característica de la realidad. Este paralelismo es el modelo que nosotros creamos para representar estas entidades de la realidad. En este modelo,  existen clases e instancias. Las clases representan la "idea" de un objeto, y las instancias son  las representaciones de objetos concretos. Siguiendo el ejemplo anterior, podríamos crear una clase "auto" que represente la idea o el concepto de auto, y luego crear varias instancias de autos concretos,  entidades físicas de la realidad.

### Teoria de Naur
Según Naur, y citamos al paper, "programar debería ser considerada una actividad por la cual los programadores forman o logran un cierto tipo de intuición". Un programa debe tener la capacidad de ser entendido y utilizado por otros programadores en un futuro. Por esto, debería ser claro e intuitivo. La abstracción realizada al eliminar código repetido facilita la lectura y el entendimiento del código.

Esto resulta importante, debido a que en ausencia de los programadores que idearon o realizaron el programa, el código legible permitirá tener una idea real del funcionamiento del mismo. Permitiendo o garantizando en parte la posibilidad de extensión y vida útil del mismo en estas situaciones
