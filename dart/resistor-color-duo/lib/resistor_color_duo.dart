enum ResistorColor {
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  violet,
  grey,
  white,
}

class ResistorColorDuo {
  int value(List<String> colors) {
    final value = colors
        .take(2)
        .map(
          (color) => ResistorColor.values
              .firstWhere((resistorColor) => resistorColor.name == color)
              .index,
        )
        .fold('', (previousValue, color) => '$previousValue$color');

    return int.tryParse(value) ?? 0;
  }
}
