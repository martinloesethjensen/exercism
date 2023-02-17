class BinarySearchTree {
  BinarySearchTree(this.data);

  BinarySearchTree get root => this;

  String data;
  BinarySearchTree? left;
  BinarySearchTree? right;

  List<String> get sortedData {
    return <String>[];
  }

  void insert(String data) {
    final n = data.asInt;
    if (n <= root.data.asInt) {
      if (left == null) {
        left = BinarySearchTree(data);
      } else {
        left!.insert(data);
      }
    } else if (n > root.data.asInt) {
      if (right == null) {
        right = BinarySearchTree(data);
      } else {
        right!.insert(data);
      }
    }
  }
}

extension on String {
  int get asInt => int.parse(this);
}

extension on String? {
  bool get isNotNull => this != null;
  bool get isNull => !isNotNull;
}
