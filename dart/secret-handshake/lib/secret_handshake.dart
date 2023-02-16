import 'package:collection/collection.dart';

class SecretHandshake {
  final handshakes = {
    '1': 'wink',
    '10': 'double blink',
    '100': 'close your eyes',
    '1000': 'jump',
  };

  List<String> commands(int input) {
    if (input == 0 || input == 16) return <String>[];

    final isReversed = input >= 16;

    final converted = isReversed ? input - 16 : input;

    final rtl = converted.toRadixString(2).split('').reversed;

    return rtl
        .mapIndexed((i, n) => n + '0' * i)
        .sortedByCompare(
          (n) => int.parse(n),
          (a, b) => isReversed ? b.compareTo(a) : a.compareTo(b),
        )
        .map((n) => handshakes[n])
        .whereNotNull()
        .toList();
  }
}
