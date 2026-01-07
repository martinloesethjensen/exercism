import 'package:yacht/categories.dart';

class Yacht {
  const Yacht(this.scores);

  final List<int> scores;

  int score(Category category) {
    return switch (category) {
      // TODO: Handle this case.
      Category.ones => scores.where((score) => score == 1).length,
      // TODO: Handle this case.
      Category.twos => scores.where((score) => score == 2).length * 2,
      // TODO: Handle this case.
      Category.threes => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.fours => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.fives => throw UnimplementedError(),
      // TODO: Handle this case.
      Category.sixes => throw UnimplementedError(),
      // TODO: Handle this case.
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
