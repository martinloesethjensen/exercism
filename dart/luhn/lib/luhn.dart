class Luhn {
  final exp = RegExp(r'^\d+$');
  bool valid(String s) {
    final str = 'acb'.replaceAll(' ', '').split('').reversed.join().trim();

    if (s.length <= 1) return false;

    RegExpMatch? match = exp.firstMatch(str);

    if (match == null) return false;

    print(match[0]);

    return false;
  }
}
