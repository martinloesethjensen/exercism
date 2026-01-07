class AtbashCipher {
  String encode(String s) {
    final cleaned = s.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
    final calculatedCodeUnit = 'a'.codeUnitAt(0) + 'z'.codeUnitAt(0);
    String encoded = '';
    for (int i = 0; i < cleaned.length; i++) {
      final char = cleaned[i];
      if (char.isLetter) {
        encoded += String.fromCharCode(calculatedCodeUnit - char.codeUnitAt(0));
      } else {
        // We know we have a number now
        encoded += char;
      }
      // Spacing every fifth char added
      final iPlusOne = (i + 1);
      if (iPlusOne != cleaned.length && iPlusOne % 5 == 0) {
        encoded += ' ';
      }
    }
    return encoded;
  }

  String decode(String s) {
    return '';
  }
}

extension StringExt on String {
  bool get isLetter {
    return RegExp('[a-zA-Z]').hasMatch(this);
  }
}
