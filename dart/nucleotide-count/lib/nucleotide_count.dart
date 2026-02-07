class InvalidNucleotideException implements Exception {
  const InvalidNucleotideException();
}

class NucleotideCount {
  Map<String, int> count(String strand) {
    var a = 0, c = 0, g = 0, t = 0;

    for (final codeUnit in strand.codeUnits) {
      switch (codeUnit) {
        case 65:
          a++;
        case 67:
          c++;
        case 71:
          g++;
        case 84:
          t++;
        default:
          throw InvalidNucleotideException();
      }
    }

    return {'A': a, 'C': c, 'G': g, 'T': t};
  }
}
