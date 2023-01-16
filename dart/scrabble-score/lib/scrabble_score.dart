/// Letter                           Value
/// A, E, I, O, U, L, N, R, S, T       1
/// D, G                               2
/// B, C, M, P                         3
/// F, H, V, W, Y                      4
/// K                                  5
/// J, X                               8
/// Q, Z                               10
const _points = {
  /// 1 point
  'AEIOULNRST': 1,

  /// 2 points
  'DG': 2,

  /// 3 points
  'BCMP': 3,

  /// 4 points
  'FHVWY': 4,

  /// 5 points
  'K': 5,

  /// 8 points
  'JX': 8,

  /// 10 points
  'QZ': 10,
};

int score(String s) {
  return s.toUpperCase().split('').fold(0, (previousValue, character) {
    final point = _points.entries.firstWhere(
      (point) => point.key.contains(character),
    );

    return previousValue + point.value;
  });
}
