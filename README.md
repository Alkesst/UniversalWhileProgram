# Programa While Universal
Implementación en Haskell del programa While universal

## ¿Qué es el programa universal?
El programa universal es un programa While capaz de simular
el comportamiento de otros programas While. En teoría de la
computación, existe también la Máquina de Turing universal, cuya
idea es la misma que el programa While universal, una máquina de
turing capaz de simular el comportamiento de otras máquinas de
turing con una entrada en concreto.

### ¿Cómo funciona?
Usando la Codificación de Cantor [Cantor Pairing][1] y la
Codificación de Gödel para "traducir" los programas while a
1 único número natural.

### ¿Porqué Haskell?
Uso haskell por el simple hecho de que en cualquier otro lenguaje de programación no tengo la opción de poder generar números "infinitos". Recordemos que la Codificación De Gödel consiste en asignarle a un vector de entrada de tamaño indefinido un único número natural, entonces, la lista puede ser "infinita" con números "infinitos". Haskell me proporciona esta facilidad con el tipo Integer.

#### TODO
Traducir el readme al inglés. Realizar el programa universal por completo.



[1]: https://en.wikipedia.org/wiki/Pairing_function
