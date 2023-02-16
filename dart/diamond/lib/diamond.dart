import 'package:collection/collection.dart';

class Diamond {
  final alphabet = String.fromCharCodes(
    Iterable.generate(26, (x) => 'A'.codeUnitAt(0) + x),
  );

  List<String> rows(String letter) {
    final indexOfLetter = alphabet.indexOf(letter);

    final firstHalf =
        alphabet.substring(0, indexOfLetter + 1).split('').mapIndexed(
      (index, letter) {
        final outer = ' ' * (indexOfLetter - index);
        final inner = (' ' * ((index * 2) - alphabet.indexOf('A') - 1));

        return outer + (letter == 'A' ? 'A' : letter + inner + letter) + outer;
      },
    );

    final secondHalf = firstHalf.toList().reversed.skip(1);

    return <String>[...firstHalf, ...secondHalf];
  }
}
