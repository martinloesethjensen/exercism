import 'package:collection/collection.dart';

class Forth {
  var stack = <int>[];

  final emptyStackException = Exception('Stack empty');

  final List<String> arithmatics = ['+', '-', '*', '/'];
  final List<String> manipulations = ['DUP', 'DROP', 'SWAP', 'OVER'];
  final customDefinitions = <String, String>{};

  void evaluate(String s) {
    final operations = s.trim().split(' ').map((e) => e.toUpperCase()).toList();

    if (operations.isValidDefinition) {
      setCustomDefinition(operations);
      return;
    }

    final numbers = operations.where((element) => element.isNumeric);
    final arithmaticsAndManipulations = operations.where((element) =>
        arithmatics.contains(element) || manipulations.contains(element));

    operations.forEachIndexed((index, _operation) {
      // TODO: refactor
      if (((numbers.length <= 1 && arithmatics.contains(_operation)) ||
              (numbers.length < 1 && manipulations.contains(_operation))) &&
          arithmaticsAndManipulations.length > 0) {
        throw emptyStackException;
      }

      // TODO: refactor
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
        stack.add(operation.toInt);
      }

      if (arithmatics.contains(operation)) {
        try {
          final arithmaticResult = stack.reduce(
            (value, number) {
              return value.performArithmatic(
                number,
                arithmatics.firstWhere((element) => element == operation),
              );
            },
          );
          stack = <int>[arithmaticResult];
        } catch (e) {
          throw e;
        }
      }

      print(operation);

      if (manipulations.contains(operation)) {
        switch (operation) {
          case 'DUP':
            stack.add(stack.last);
            break;
          case 'DROP':
            stack.removeLast();
            break;
          case 'SWAP':
            if (stack.length < 2) throw emptyStackException;
            final removedValue = stack.removeAt(stack.length - 1);
            stack.insert(stack.length - 1, removedValue);
            break;
        }
      }
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
