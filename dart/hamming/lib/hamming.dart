import 'package:collection/collection.dart';

class Hamming {
  int distance(String str1, String str2) {
    if (str1.length != str2.length) {
      throw ArgumentError('strands must be of equal length');
    }
    return IterableZip([str1.split(''), str2.split('')])
        .where((pair) => pair[0] != pair[1])
        .length;
  }
}
