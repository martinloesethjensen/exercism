import 'package:yacht/categories.dart';

class Yacht {
  const Yacht(this.scores);

  final List<int> scores;

  int score(Category category) {
    return switch (category) {
      Category.ones ||
      Category.twos ||
      Category.threes ||
      Category.fours ||
      Category.fives ||
      Category.sixes =>
        scores.where((score) => score == category.index + 1).length *
            (category.index + 1),
      Category.full_house => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.four_of_a_kind => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.little_straight => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.big_straight => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.choice => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.yacht => throw UnimplementedError(),
    };
  }
}
