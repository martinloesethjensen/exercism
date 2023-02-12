class Acronym {
  String abbreviate(String s) {
    return s
        .replaceAll(RegExp('[-_]'), ' ')
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word.substring(0, 1).toUpperCase())
        .join();
  }
}
