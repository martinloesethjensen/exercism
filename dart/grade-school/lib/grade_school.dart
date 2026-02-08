class GradeSchool {
  Map<int, List<String>> _roster = {};
  Set<String> _allNames = {};

  List<String>? _cachedRoster;
  bool _isDirty = true;

  List<String> roster() {
    if (!_isDirty && _cachedRoster != null) {
      return List.unmodifiable(_cachedRoster!);
    }

    final sortedByGrade = _roster.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    _cachedRoster = [
      for (final entry in sortedByGrade) ...grade(entry.key),
    ];

    _isDirty = false;
    return List.unmodifiable(_cachedRoster!);
  }

  List<bool> add(List<(String, int)> list) {
    final result = <bool>[];

    for (final student in list) {
      final name = student.$1;
      if (_allNames.contains(name)) {
        result.add(false);
      } else {
        result.add(true);
        _roster.putIfAbsent(student.$2, () => <String>[]).add(name);
        _allNames.add(name);
        _isDirty = true;
      }
    }

    return result;
  }

  List<String> grade(int grade) => List.from(_roster[grade] ?? [])..sort();
}
