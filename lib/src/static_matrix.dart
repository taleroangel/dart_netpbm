import 'package:netpbm/netpbm.dart';

/// A Fixed size matrix containing values of type T
class StaticMatrix<T> {
  /// Matrix height
  final int height;

  /// Matrix width
  final int width;

  /// Pixels matrix
  final List<List<T>> data;

  /// Create a static matrix of specified size
  StaticMatrix(
      {required this.height, required this.width, required T defaultValue})
      : data = List<List<T>>.generate(
            height,
            (e) =>
                List<T>.generate(width, (e) => defaultValue, growable: false),
            growable: false);

  /// Create a StaticMatrix from List<List> matrix
  factory StaticMatrix.fromList(List<List<T>> matrix) {
    // Verify that matrix is correct
    int height = matrix.length;
    if (height == 0) throw Exception("Invalid data matrix");
    int width = matrix[0].length;
    for (var row in matrix) {
      if (row.length != width) throw Exception("Invalid data matrix");
    }

    return StaticMatrix._allParameters(
        height: height, width: width, data: matrix);
  }

  /// Override [] operator for direct access to data
  List<T> operator [](int index) => data[index];

  // Private matrix implementation
  StaticMatrix._allParameters(
      {required this.height, required this.width, required this.data});
}

/// Transform any rectangular matrix into a StaticMatrix
extension TransformToStaticMatrix<T> on List<List<T>> {
  /// Convert a list to matrix
  StaticMatrix<T> toMatrix() => StaticMatrix.fromList(this);
}

/// Transform any int matrix into bool matrix
extension TransformMatrixTypeMono on StaticMatrix<int> {
  StaticMatrix<bool> toMono() => StaticMatrix.fromList(
      data.map((e) => e.map((f) => f == 1).toList()).toList());
}

/// Transform any HEX strings matrix into Color matrix
extension TransformMatrixTypeHexColor on StaticMatrix<String> {
  StaticMatrix<Color> toColorFromHex() => StaticMatrix.fromList(
      data.map((e) => e.map((f) => Color.fromHEX(f)).toList()).toList());
}
