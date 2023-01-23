class Raindrops {
  String convert(int number) {
    var result = '';
    if (number % 3 == 0) result = result + 'Pling';
    if (number % 5 == 0) result = result + 'Plang';
    if (number % 7 == 0) result = result + 'Plong';
    return result.isNotEmpty ? result : '$number';
  }
}
