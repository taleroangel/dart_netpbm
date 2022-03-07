/// netpbm Image format support
library netpbm;

import './src/static_matrix.dart';
export './src/static_matrix.dart';

export './src/image.dart';
export './src/image_color.dart';
export './src/image_grayscale.dart';
export './src/image_mono.dart';

typedef PixelMatrix<T> = StaticMatrix<T>;
