import 'package:collection/collection.dart';

class Luhn {
  final nonDigitExp = RegExp(r'^\d+$');
  final nonSpaceExp = RegExp(r'\s+');
  bool valid(String s) {
    /// Strip spaces
    final str = s.replaceAll(nonSpaceExp, '');

    if (str.length <= 1) return false;

    /// Should not contain any non digits
    RegExpMatch? match = nonDigitExp.firstMatch(str);
    if (match == null) return false;

    var isDouble = true;
    final _result = match
            .group(0)
            ?.split('')
            .reversed
            .map((e) => int.parse(e))
            .mapIndexed((index, number) {
          isDouble = !isDouble;
          if (!isDouble) return number;
          final doubled = number * 2;
          return doubled > 9 ? doubled - 9 : doubled;
        }).fold(0, (previousValue, element) => previousValue + element) ??
        0;

    return _result % 10 == 0;
  }
}
