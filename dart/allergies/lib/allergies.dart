class Allergies {
  final allergies = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128,
  };

  bool allergicTo(String input, int score) => list(score).contains(input);

  List<String> list(int score) {
    if (score > 256) score -= 256;
    return allergies.entries
        .toList()
        .reversed
        .where((allergy) {
          if (score >= allergy.value) {
            score -= allergy.value;
            return true;
          }
          return false;
        })
        .map((e) => e.key)
        .toList()
        .reversed
        .toList();
  }
}
