final vowelRegex = RegExp(r'\b[aeiou]\w*', caseSensitive: false);
final consonantRegex = RegExp(r'\b[^\Waeiou]\w*', caseSensitive: false);
//final _consonantRegex = RegExp(r'\b[^\Waeiou]*', caseSensitive: false);
final quRegex = RegExp(r'qu', caseSensitive: false);

String translate(String phrase) {
  final result = phrase.split(' ').map((e) {
    if (vowelRegex.hasMatch(e)) {
      return e + 'ay';
    } else if (consonantRegex.hasMatch(e)) {
      print(e);

      print(quRegex.hasMatch(e));
      if (quRegex.hasMatch(e)) {
        final match = quRegex.firstMatch(e)?.group(0) ?? '';
        final splitted = e.split(quRegex).reversed.join().trim();
        print(splitted);
        return (splitted[0] != 'q' ? splitted : splitted) + match + 'ay';
      }
      final match =
          RegExp(r'[aeiou]\w*', caseSensitive: false).firstMatch(e)?.group(0) ??
              '';
      final splitted =
          e.split(RegExp(r'[aeiou]\w*', caseSensitive: false)).join().trim();
      return match + splitted + 'ay';
    }
    return e;
  }).join(' ');
  print(result);
  return result;
}
