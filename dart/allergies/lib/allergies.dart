class Allergies {
  final allergies = <String, int>{
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128,
  };

  bool allergicTo(String allergy, int score) =>
      score & allergies[allergy]! != 0;

  List<String> list(int score) =>
      allergies.keys.where((allergy) => allergicTo(allergy, score)).toList();
}
