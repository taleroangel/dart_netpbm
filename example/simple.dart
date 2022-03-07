import 'package:netpbm/netpbm.dart' as netpbm;
import 'package:netpbm/src/static_matrix.dart';

void main() {
  //* ----- Example 1 (Using [] operator) ----- */

  // Create a letter 'J' in Mono
  netpbm.Image example1 = netpbm.ImageMono(height: 10, width: 6);
  // Set bits
  example1[0][4] = example1[1][4] = example1[2][4] = example1[3][4] =
      example1[4][4] = example1[5][4] = example1[6][4] = example1[6][0] =
          example1[7][1] = example1[7][2] = example1[7][3] = true;

  example1.toFile('example1');

  //* ----- Example 2 (defining a Matrix) ----- */

  var example2 = netpbm.ImageMono.fromMatrix([
    [1, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 1, 0],
    [0, 0, 0, 1]
  ].toMatrix().toMono());

  example2.toFile('example2');

  //* ----- Example 3 (Using HEX colors) ----- */
  var example3 = netpbm.ImageColor.fromMatrix([
    ['#FF0000', '#00FF00', '#0000FF'],
    ['#FFFF00', '#FF00FF', '#00FFFF']
  ].toMatrix().toColorFromHex());

  example3.toFile('example3');
}
