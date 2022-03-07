import 'static_matrix.dart';

/// File abstraction
abstract class Image<T> {
  final int maxValue;
  final StaticMatrix<T> pixels;

  Image(
      {required int height,
      required int width,
      required this.maxValue,
      required T defaultValue})
      : pixels = StaticMatrix<T>(
            height: height, width: width, defaultValue: defaultValue);

  Image.allParameters({required this.maxValue, required this.pixels});

  int get height => pixels.height;
  int get width => pixels.width;

  /// Override [] operator for direct access to data
  List<T> operator [](int index) => pixels[index];

  /// Print image to file, extension is automatically asigned
  void toFile(String baseName);
}
