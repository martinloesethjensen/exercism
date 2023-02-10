import 'package:collection/collection.dart';

bool isValid(String isbn) {
  final noDashes = isbn.replaceAll('-', '');
  final match = RegExp(r'[\d]+[\dX]').stringMatch(noDashes) ?? '';

  if (match.length != 10) return false;

  final result = match
      .split('')
      .reversed
      .mapIndexed((i, e) => e == 'X' ? 10 * (i + 1) : int.parse(e) * (i + 1))
      .fold(0, (prev, curr) => prev + curr);

  return result % 11 == 0;
}
