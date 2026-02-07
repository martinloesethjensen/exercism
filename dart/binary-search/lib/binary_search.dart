import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  BinarySearch(this.list);

  final List<int> list;

  int find(int target) {
    if (list.isEmpty) throw ValueNotFoundException('$target');

    var low = 0;
    var high = list.length - 1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      final item = list[mid];
      if (target == item) return mid;
      if (target < item) {
        high = mid - 1;
      }
      if (target > item) {
        low = mid + 1;
      }
    }

    throw ValueNotFoundException('$target');
  }
}
