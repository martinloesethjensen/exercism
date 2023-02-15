final vowelRegex = RegExp(r'\b[aeiou]\w*', caseSensitive: false);
final consonantRegex = RegExp(r'\b[^\Waeiou]\w*', caseSensitive: false);
final quRegex = RegExp(r'qu', caseSensitive: false);

String translate(String phrase) {
  final result = phrase.split(' ').map((e) {
    final ay = 'ay';
    if (e.isVowel || e.startsWith('xr') || e.startsWith('yt')) {
      return e + ay;
    } else if (e.isConsonant) {
      if (e.startsWith('th') && e.substring(2, 3).isVowel) {
        return e.substring(2) + e.substring(0, 2) + ay;
      }

      if (e.contains('y')) {
        final yIndex = e.startsWith('y') ? e.indexOf('y') + 1 : e.indexOf('y');
        return e.substring(yIndex) + e.substring(0, yIndex) + ay;
      }

      if (quRegex.hasMatch(e)) {
        final match = quRegex.firstMatch(e)?.group(0) ?? '';
        final splitted = e.split(quRegex).reversed.join().trim();
        return (splitted[0] != 'q' ? splitted : splitted) + match + ay;
      }
      final match =
          RegExp(r'[aeiou]\w*', caseSensitive: false).firstMatch(e)?.group(0) ??
              '';
      final splitted =
          e.split(RegExp(r'[aeiou]\w*', caseSensitive: false)).join().trim();
      return match + splitted + ay;
    }
    return e;
  }).join(' ');
  return result;
}

extension on String {
  bool get isVowel => vowelRegex.hasMatch(this);
  bool get isConsonant => consonantRegex.hasMatch(this);
}
