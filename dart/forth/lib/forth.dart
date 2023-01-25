class Forth {
  var _stack = <int>[];

  final emptyStackException = Exception('Stack empty');

  List<int> get stack {
    if (_stack.isEmpty) throw emptyStackException;
    return _stack;
  }

  final List<String> arithmatics = ['+', '-', '*', '/'];
  final List<String> manipulations = ['DUP', 'DROP', 'SWAP', 'OVER'];
  var customDefinitions = <String, String>{};

  // TODO regex for custom syntax definitions

  void evaluate(String s) {
    final operations = s.split(' ').map((e) => e.toUpperCase());
    final numbers = operations.where((element) => element.isNumeric);
    final arithmaticsAndManipulations = operations.where((element) =>
        arithmatics.contains(element) || manipulations.contains(element));
    for (final operation in operations) {
      if (numbers.length <= 1 && arithmaticsAndManipulations.length > 0) {
        throw emptyStackException;
      }

      // TODO: handle custom syntax definitions

      if (operation.isNumeric) {
        _stack.add(operation.toInt);
      }

      if (arithmatics.contains(operation)) {
        try {
          final arithmaticResult = _stack.reduce(
            (value, number) {
              return value.performArithmatic(
                number,
                arithmatics.firstWhere((element) => element == operation),
              );
            },
          );
          _stack = <int>[arithmaticResult];
        } catch (e) {
          throw e;
        }
      }

      if (manipulations.contains(operation)) {}
    }
    print(stack);
  }
}

extension on String {
  bool get isNumeric => num.tryParse(this) != null;
  int get toInt => isNumeric ? int.parse(this) : 0;
}

extension on int {
  int performArithmatic(int number, String operation) {
    switch (operation) {
      case '+':
        return this + number;
      case '-':
        return this - number;
      case '*':
        return (this * number).toInt();
      case '/':
        if (number == 0) throw Exception('Division by zero');
        return this ~/ number;
      default:
        return 0;
    }
  }
}
