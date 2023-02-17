class BinarySearchTree {
  late final Node root;

  BinarySearchTree(String data) {
    root = Node(data);
  }

  List<String> get sortedData => root.sortedData;

  void insert(String data) {
    root.insert(data);
  }
}

class Node {
  final String data;
  Node? left;
  Node? right;

  Node(this.data);

  List<String> get sortedData {
    final result = <String>[];
    if (left.isNotNull) result.addAll(left!.sortedData);
    result.add(data);
    if (right.isNotNull) result.addAll(right!.sortedData);
    return result;
  }

  void insert(String value) {
    final n = value.asInt;
    if (n <= data.asInt) {
      if (left.isNull) {
        left = Node(value);
      } else {
        left!.insert(value);
      }
    } else {
      if (right.isNull) {
        right = Node(value);
      } else {
        right!.insert(value);
      }
    }
  }
}

extension on String {
  int get asInt => int.parse(this);
}

extension on Object? {
  bool get isNotNull => this != null;
  bool get isNull => !isNotNull;
}
