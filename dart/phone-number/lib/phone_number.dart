class PhoneNumber {
  final letterExp = RegExp(r'[a-zA-Z]');
  final punctuationExp = RegExp(r'[^0-9-.()+\sa-zA-Z]');

  String clean(String input) {
    if (punctuationExp.hasMatch(input)) {
      throw FormatException('punctuations not permitted');
    }

    if (letterExp.hasMatch(input)) {
      throw FormatException('letters not permitted');
    }

    final cleaned = input.replaceAll(RegExp(r'[\W]'), '');

    if (cleaned.length < 10) {
      throw FormatException('incorrect number of digits');
    }

    if (cleaned.length > 11) {
      throw FormatException('more than 11 digits');
    }

    if (cleaned.length == 11) {
      if (!cleaned.startsWith('1')) {
        throw FormatException('11 digits must start with 1');
      }
      final cleaned11 = cleaned.substring(1);

      final areaCode = cleaned11.areaCode;
      final exchangeCode = cleaned11.exchangeCode;
      final subscriberNumber = cleaned11.subscriberNumber;

      if (areaCode.startsWith('0')) {
        throw FormatException('area code cannot start with zero');
      }
      if (areaCode.startsWith('1')) {
        throw FormatException('area code cannot start with one');
      }
      if (exchangeCode.startsWith('0')) {
        throw FormatException('exchange code cannot start with zero');
      }
      if (exchangeCode.startsWith('1')) {
        throw FormatException('exchange code cannot start with one');
      }

      return areaCode + exchangeCode + subscriberNumber;
    }

    final areaCode = cleaned.areaCode;
    final exchangeCode = cleaned.exchangeCode;
    final subscriberNumber = cleaned.subscriberNumber;

    if (areaCode.startsWith('0')) {
      throw FormatException('area code cannot start with zero');
    }
    if (areaCode.startsWith('1')) {
      throw FormatException('area code cannot start with one');
    }
    if (exchangeCode.startsWith('0')) {
      throw FormatException('exchange code cannot start with zero');
    }
    if (exchangeCode.startsWith('1')) {
      throw FormatException('exchange code cannot start with one');
    }

    return areaCode + exchangeCode + subscriberNumber;
  }
}

extension on String {
  String get areaCode => substring(0, 3);
  String get exchangeCode => substring(3, 5);
  String get subscriberNumber => substring(5);
}
