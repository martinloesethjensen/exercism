class MatchingBrackets {
  final pairs = {'[': ']', '{': '}', '(': ')'};

  bool isPaired(String expression) {
    final brackets = RegExp(r'[[\](){}]')
        .allMatches(expression)
        .map((match) => match.group(0)!)
        .toList();

    final stack = <String>[];

    for (final symbol in brackets) {
      if ('[({'.contains(symbol)) {
        stack.add(symbol);
      } else if ('])}'.contains(symbol) &&
          stack.isNotEmpty &&
          pairs[stack.last]! == symbol) {
        stack.removeLast();
      } else {
        return false;
      }
    }

    return stack.isEmpty;
  }
}
