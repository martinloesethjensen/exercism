class WordCount {
  final exp = RegExp(r'''(\w+'*\w+|\w+|^>)''');

  Map<String, int> countWords(String s) {
    final wordsAndCount = <String, int>{};

    exp.allMatches(s.replaceAll(r'\n', '').toLowerCase()).forEach(
      (match) {
        final word = match[0];
        if (word != null) {
          wordsAndCount.update(
            word,
            (value) => value + 1,
            ifAbsent: () => 1,
          );
        }
      },
    );

    return wordsAndCount;
  }
}
