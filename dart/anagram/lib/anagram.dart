class Anagram {
  List<String> findAnagrams(String target, List<String> words) {
    final lowerTarget = target.toLowerCase();
    final targetFrequency = _getFrequency(lowerTarget);
    final results = <String>[];

    for (final word in words) {
      if (word.length != target.length) continue;
      final lowerWord = word.toLowerCase();
      if (lowerTarget == lowerWord) continue;
      if (_isAnagram(lowerWord, targetFrequency)) results.add(word);
    }

    return results;
  }

  List<int> _getFrequency(String str) {
    final counts = List.filled(26, 0); // assuming a-z alphabet
    for (final charCode in str.codeUnits) {
      // 97 => 'a'
      counts[charCode - 97]++;
    }
    return counts;
  }

  bool _isAnagram(String word, List<int> targetFrequency) {
    final counts = List.filled(26, 0);
    for (final charCode in word.codeUnits) {
      final index = charCode - 97;
      counts[index]++;
      if (counts[index] > targetFrequency[index]) return false;
    }
    return true;
  }
}
