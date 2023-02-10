class Isogram {
  bool isIsogram(String s) {
    final match =
        RegExp(r'[\w- ]+').firstMatch(s.toLowerCase())?.group(0) ?? '';
    final cleaned = match.replaceAll(RegExp(r'[\s-]+'), '').split('');

    return match.isEmpty || cleaned.toSet().length == cleaned.length;
  }
}
