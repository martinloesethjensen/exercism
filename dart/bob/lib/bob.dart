class Bob {
  String response(String s) {
    final q = s.trim();
    if (q.isEmpty) return 'Fine. Be that way!';

    if (q.isQuestion && q.isUpperCase) {
      return 'Calm down, I know what I\'m doing!';
    }

    if (q.isQuestion) {
      return 'Sure.';
    }

    if (q.isUpperCase) {
      return 'Whoa, chill out!';
    }

    return 'Whatever.';
  }
}

extension on String {
  bool get isQuestion => endsWith('?');

  /// check if string contains and letters and if it is upper case.
  bool get isUpperCase =>
      contains(RegExp(r'[A-Za-z]')) && this == this.toUpperCase();
}
