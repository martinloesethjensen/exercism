import 'package:collection/collection.dart';

class Forth {
  var _stack = <int>[];

  final emptyStackException = Exception('Stack empty');

  List<int> get stack {
    if (_stack.isEmpty) throw emptyStackException;
    return _stack;
  }

  final List<String> arithmatics = ['+', '-', '*', '/'];
  final List<String> manipulations = ['DUP', 'DROP', 'SWAP', 'OVER'];
  final customDefinitions = <String, String>{};

  void evaluate(String s) {
    final operations = s.trim().split(' ').map((e) => e.toUpperCase()).toList();
    final numbers = operations.where((element) => element.isNumeric);
    final arithmaticsAndManipulations = operations.where((element) =>
        arithmatics.contains(element) || manipulations.contains(element));

    if (operations.isValidDefinition) {
      setCustomDefinition(operations);
      return;
    }

    operations.forEachIndexed((index, _operation) {
      if (numbers.length <= 1 && arithmaticsAndManipulations.length > 0) {
        throw emptyStackException;
      }

      final operation = customDefinitions.containsKey(_operation)
          ? customDefinitions.containsKey(customDefinitions[_operation])
              ? customDefinitions[customDefinitions[_operation]]!
              : customDefinitions[_operation]!
          : _operation;

      // TODO: loop custom operations
      operation.split(' ').forEach((element) {
        print(element);
      });

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
    });

    print(stack);
  }

  void setCustomDefinition(List<String> operations) {
    final definitionOperations = operations.definitionOperations;

    // TODO lookup and update definitions by looping
    final customOperations = customDefinitions.containsKey(definitionOperations)
        ? customDefinitions[definitionOperations]!
        : definitionOperations;

    customDefinitions.update(
      operations[1],
      (_) => customOperations,
      ifAbsent: () => customOperations,
    );

    print(customDefinitions);
  }
}

extension on String {
  bool get isNumeric => num.tryParse(this) != null;
  int get toInt => isNumeric ? int.parse(this) : 0;
}

extension on List<String> {
  bool get isValidDefinition => first == ':' && last == ';';
  String get definitionOperations => sublist(2, length - 1).join(' ');
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
