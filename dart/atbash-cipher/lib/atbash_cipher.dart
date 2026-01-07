class AtbashCipher {
  // 'a'.codeUnitAt(0) + 'z'.codeUnitAt(0);
  static const int _calculatedCodeUnit = 219;

  String _cipher(String s, {required bool encode}) {
    final cleaned = s.cleaned;
    String result = '';
    for (int i = 0; i < cleaned.length; i++) {
      final char = cleaned[i];
      if (char.isLetter) {
        result += String.fromCharCode(_calculatedCodeUnit - char.codeUnitAt(0));
      } else {
        // We know we have a number now
        result += char;
      }
      if (encode) {
        // Spacing every fifth char added
        final iPlusOne = (i + 1);
        if (iPlusOne != cleaned.length && iPlusOne % 5 == 0) {
          result += ' ';
        }
      }
    }
    return result;
  }

  String encode(String s) => _cipher(s, encode: true);

  String decode(String s) => _cipher(s, encode: false);
}

extension StringExt on String {
  bool get isLetter {
    return RegExp('[a-zA-Z]').hasMatch(this);
  }

  String get cleaned {
    return toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  }
}
