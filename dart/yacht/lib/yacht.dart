import 'package:yacht/categories.dart';

class Yacht {
  const Yacht(this.scores);

  final List<int> scores;

  int score(Category category) {
    scores.sort();
    print(scores);
    return switch (category) {
      Category.ones ||
      Category.twos ||
      Category.threes ||
      Category.fours ||
      Category.fives ||
      Category.sixes =>
        scores.where((score) => score == category.index + 1).length *
            (category.index + 1),
      Category.full_house => scores.fullHouse(),
      Category.four_of_a_kind => scores.fourOfAKind(),
      Category.little_straight =>
        scores.toSet().containsAll([1, 2, 3, 4, 5]) ? 30 : 0,
      Category.big_straight =>
        scores.toSet().containsAll([2, 3, 4, 5, 6]) ? 30 : 0,
      Category.choice => scores.reduce((a, b) => a + b),
      Category.yacht => scores.toSet().length == 1 ? 50 : 0
    };
  }
}

extension ListExt on List<int> {
  int? _numberOfAKind(int value) {
    return where((element) => where((e) => e == element).length == value)
        .firstOrNull;
  }

  int fourOfAKind() {
    final four =
        where((element) => where((e) => e == element).length >= 4).firstOrNull;
    return four != null ? four * 4 : 0;
  }

  int fullHouse() {
    final three = _numberOfAKind(3);
    final two = _numberOfAKind(2);
    return three != null && two != null ? three * 3 + two * 2 : 0;
  }
}
