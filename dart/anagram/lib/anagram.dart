class Anagram {
  List<String> findAnagrams(String s, List<String> words) {
    final str = s.toLowerCase().split('');

    return words

        /// must have same lenght
        .where((word) => word.length == str.length)

        /// can't be the same
        .where((word) => word.toLowerCase() != str.join())

        /// rules:
        /// - all characters must be present in the word
        /// - check that there's the same amount of characters
        ///   being filled
        .where(
      (word) {
        final characters = word.toLowerCase().split('');

        return characters.every(
          (character) {
            final count = characters.where((c) => c == character).length;
            final checkCount = str.where((c) => c == character).length;

            if (checkCount != count) return false;

            return str.contains(character);
          },
        );
      },
    ).toList();
  }
}
