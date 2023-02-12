class Pangram {
  bool isPangram(String phrase) =>
      phrase
          .toLowerCase()
          .replaceAll(RegExp(r'[^a-z]'), '')
          .split('')
          .toSet()
          .length ==
      26;
}
