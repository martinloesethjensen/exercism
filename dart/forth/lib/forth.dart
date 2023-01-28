import 'package:collection/collection.dart';

class Forth {
  var stack = <int>[];

  final emptyStackException = Exception('Stack empty');

  final List<String> arithmatics = ['+', '-', '*', '/'];
  final List<String> manipulations = ['DUP', 'DROP', 'SWAP', 'OVER'];
  final customDefinitions = <String, String>{};

  void evaluate(String s) {
    final commands = s.trim().split(' ');
    final operations = commands

        /// We want all in upper case
        .map((op) => op.toUpperCase())

        /// Replace with value from custom definition if it exists.
        .map(
          (op) {
            if (!commands.isValidDefinition &&
                customDefinitions.containsKey(op)) {
              return customDefinitions[op]!;
            }
            return op;
          },
        )

        /// Need to get it back to a string as some definition value
        /// could be parsed as list of values.
        .join(' ')
        .split(' ')
        .toList();

    /// If valid custom definition then set store it.
    /// Else throw exception.
    /// Do an early return.
    if (operations.isValidDefinition) {
      if (operations.length >= 4 && operations.elementAt(1).isNumeric) {
        throw Exception('Invalid definition');
      }
      setCustomDefinition(operations);
      return;
    }

    /// Check for valid commands:
    /// - number
    /// - arithmatic operation
    /// - manipulation operation
    final validCommand = operations.every((op) {
      return op.isNumeric ||
          arithmatics.contains(op) ||
          manipulations.contains(op);
    });

    /// Throw exception on invalid command.
    if (!validCommand) throw Exception('Unknown command');

    /// Gather numbers
    final numbers = operations.where((op) => op.isNumeric);

    /// Gather arithmatics and manipulations
    final arithmaticsAndManipulations = operations.where(
      (op) => arithmatics.contains(op) || manipulations.contains(op),
    );

    operations.forEachIndexed((index, op) {
      if (((numbers.length <= 1 && arithmatics.contains(op)) ||
              (numbers.length < 1 && manipulations.contains(op))) &&
          arithmaticsAndManipulations.length > 0) {
        throw emptyStackException;
      }

      if (op.isNumeric) {
        stack.add(op.toInt);
      }

      if (arithmatics.contains(op)) {
        try {
          final arithmaticResult = stack.reduce(
            (value, number) {
              return value.performArithmatic(
                number,
                arithmatics.firstWhere((element) => element == op),
              );
            },
          );
          stack = <int>[arithmaticResult];
        } catch (e) {
          throw e;
        }
      }

      if (manipulations.contains(op)) {
        switch (op) {
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
          case 'OVER':
            if (stack.length < 2) throw emptyStackException;
            stack.add(stack.elementAt(stack.length - 2));
            break;
        }
      }
    });
  }

  void setCustomDefinition(List<String> operations) {
    final definitionOperations = operations.definitionOperations.split(' ').map(
      (operation) {
        if (customDefinitions.containsKey(operation)) {
          return customDefinitions[operation]!;
        }
        return operation;
      },
    ).join(' ');

    customDefinitions.update(
      operations[1],
      (_) => definitionOperations,
      ifAbsent: () => definitionOperations,
    );
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
