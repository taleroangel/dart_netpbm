# Netpbm

Dart's netpbm image format manipulation library

## Features

-   Create Portable BitMap format images 'P1'
-   Create Portable GrayMap format images 'P2'
-   Create Portable PixMap format images 'P3'
-   Export images

## Getting started

> "The portable pixmap format (PPM), the portable graymap format (PGM) and the portable bitmap format (PBM) are image file formats designed to be easily exchanged between platforms." - [from Wikipedia](https://en.wikipedia.org/wiki/Netpbm)

This is an easy, human-readable image format easy for beginners to get into, this library allows creation of images based on pixel matrixes

## Usage

### Import

First import the library using 'import' directive

```dart
import 'package:netpbm/netpbm.dart';
```

### Declaring an image

Create an Image by creating an instance of ImageMono, ImageGrayscale or ImageColor, and specifying a Height and a Width

```dart
final Image image = new ImageGrayscale(height: 10, width: 10);
```

### Manipulating pixel values

Image is automatically initialized with all 0's (black).
Add pixel values by accesing the image as a matrix

```dart
image[5][5] = 52;
```

> this line assigns a value of 52 to the pixel at x=5, y=5

The line above only works with ImageGrayscale, which values are of type 'int' and vary between 0 to 255.

> ImageMono values are either true or false (white or black)

```dart
final Image image = new ImageMono(height: 10, width: 10);
image[5][5] = true;
```

> ImageColor values are a \<Color> class instance, which can be initialized with an HEX color string

```dart
final Image image = new ImageColor(height: 10, width: 10);
image[5][5] = Color('#AABBCC');
```

### Declaring images from matrices

You can also declare matrices with [] operator and construct an image from them using the 'toMatrix()' extension and .fromMatrix() constructor as long as the matrix is rectangular (all rows have the same lenght)

```dart
final Image image = new ImageGrayscale.fromMatrix(
    [
        [50, 25, 0, 0],
        [25, 50, 25, 0],
        [0, 25, 50, 25],
        [0, 0, 25, 50]
    ].toMatrix() //<- Transforms matrix into StaticMatrix<int>
);
```

StaticMatrix (or PixelMatrix which is an alias), contains all the pixel values, the implementation above only works with ImageGrayscale which is compatible with int types.

> For creating ImageMono matrices, you can create a matrix with 1's and 0's and use the .toMono() extension for transforming it into bool compatible values

```dart
final Image image = new ImageMono.fromMatrix(
    [
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
    ].toMatrix().toMono() //<- Transform into matrix and then into StaticMatrix<bool>
);
```

> For creating ImageColor matrices you can Skip the color constructor by just creating a matrix of Strings containing HEX values and then transforming it with .toColorFromHex() extension

```dart
final Image image = new ImageColor.fromMatrix(
    [
        ['#FF0000', '#00FF00', '#0000FF'],
        ['#FFFF00', '#FF00FF', '#00FFFF']
    ].toMatrix().toColorFromHex()); //<- Transform into matrix and then into Colors
);
```

### Exporting images

You can export any image with the _.toFile(filename)_ method implemented in every image type

```dart
final Image image = new ...// Create some sort of image
...
image.toFile('my_image'); // Export image
```

Image extension is automatically assigned according to Image type

## Additional information

_TODO:_ Read file
Feel free to contribute and use this library in your own project 😉
