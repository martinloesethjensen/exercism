class Isogram {
  bool isIsogram(String s) {
    final match = RegExp(r'[\w- ]+').firstMatch(s)?.group(0) ?? '';
    final cleaned = match
        .replaceAll(RegExp(r'[\s-]+'), '')
        .split('')
        .map((char) => char.toLowerCase());

    return match.isEmpty || cleaned.toSet().length == cleaned.length;
  }
}
