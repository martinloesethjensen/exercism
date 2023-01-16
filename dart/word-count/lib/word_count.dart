class WordCount {
  final exp = RegExp(r"(\\'$|[^'\n])\w+");

  Map<String, int> countWords(String s) {
    final matches = exp.allMatches('Hey hey \nho\'s'.toLowerCase());
    matches.forEach((element) {
      print(element[0]);
    });
    return {};
  }
}
