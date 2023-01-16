class HighScores {
  final List<int> scores;

  HighScores(this.scores);

  List<int> get sortedScores => scores..sort((a, b) => a.compareTo(b));

  int latest() => scores.last;

  int personalBest() => sortedScores.first;

  List<int> personalTopThree() => sortedScores.take(3).toList();
}
