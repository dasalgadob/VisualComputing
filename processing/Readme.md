# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises: promedio _rgb_ y [luma](https://en.wikipedia.org/wiki/HSL_and_HSV#Disadvantages).
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

### Alternativas para video en Linux y `gstreamer >=1`

Distribuciones recientes de Linux que emplean `gstreamer >=1`, requieren alguna de las siguientes librerías de video:

1. [Beta oficial](https://github.com/processing/processing-video/releases).
2. [Gohai port](https://github.com/gohai/processing-video/releases/tag/v1.0.2).

Descompriman el archivo `*.zip` en la caperta de `libraries` de su sketchbook (e.g., `$HOME/sketchbook/libraries`) y probar cuál de las dos va mejor.

## Integrantes

Completar la tabla:

| Integrante | github nick |
|------------|-------------|
|   DIego Salgado         |   dasalgadob          |

## Discusión

* La conversión a escala de grises consiste en tomar el promedio de la suma de los 3 canales a color y dejar ese como el nuevo color se puede observar oprimiendo la tecla G. Para el caso de Luma consiste en la multiplicación de cada canal por una constante respectiva(observar con la tecla L).

* Para las mascaras de convolución se implemento una función de padding de forma que los filtros aplicaran totalmente a la imagen. Luego en la operación de convolución se le pasa la matriz respectiva con el filtro a aplicar. Para observar su funcionamiento tecla E activa Edge Detection, tecla S activa Sharpen, tecla B activa efecto borroso(Blur).

* Se crea un arreglo de 256 posiciones, luego se itera sobre los pixeles de la imagen se convierten a color gris y a partir de ahí se cuenta la frecuencia de los valores. Se activa con la tecla H.
(describa brevemente las actividades realizadas y los resultados obtenidos)

## Entrega

* Plazo para hacer _push_ del repositorio a github: 29/9/19 a las 24h.
