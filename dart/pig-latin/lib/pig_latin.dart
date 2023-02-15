final vowelRegex = RegExp(r'\b[aeiou]\w*', caseSensitive: false);
final vowelSectionRegex = RegExp(r'[aeiou]\w*', caseSensitive: false);
final consonantRegex = RegExp(r'\b[^\Waeiou]\w*', caseSensitive: false);
final quRegex = RegExp(r'qu', caseSensitive: false);

String translate(String phrase) {
  final result = phrase.split(' ').map((word) {
    final ay = 'ay';

    if (word.isVowel || word.startsWith('xr') || word.startsWith('yt')) {
      return word + ay;
    }

    if (word.isConsonant) {
      if (word.startsWith('th') && word.substring(2, 3).isVowel) {
        return word.substring(2) + word.substring(0, 2) + ay;
      }

      if (word.contains('y')) {
        final yIndex =
            word.startsWith('y') ? word.indexOf('y') + 1 : word.indexOf('y');
        return word.substring(yIndex) + word.substring(0, yIndex) + ay;
      }

      if (quRegex.hasMatch(word)) {
        final match = quRegex.firstMatch(word)?.group(0) ?? '';
        final splitted = word.split(quRegex).reversed.join().trim();
        return splitted + match + ay;
      }

      final match = vowelSectionRegex.firstMatch(word)?.group(0) ?? '';
      final splitted = word.split(vowelSectionRegex).join().trim();
      return match + splitted + ay;
    }
    return word;
  }).join(' ');
  return result;
}

extension on String {
  bool get isVowel => vowelRegex.hasMatch(this);
  bool get isConsonant => consonantRegex.hasMatch(this);
}
