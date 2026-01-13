import 'package:collection/collection.dart';

enum Classification { sublist, superlist, equal, unequal }

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) {
    if (ListEquality().equals(listOne, listTwo)) {
      return Classification.equal;
    } else if (listOne.partialContains(listTwo)) {
      return Classification.superlist;
    } else if (listTwo.partialContains(listOne)) {
      return Classification.sublist;
    }
    return Classification.unequal;
  }
}

extension ListExt<T> on List<T> {
  bool partialContains(List<T> other) {
    // Custom rule to return true if other is empty
    if (other.isEmpty) return true;

    final otherLength = other.length;

    if (otherLength > length) return false;

    outerLoop:
    for (var index = 0; index < length; index++) {
      if ((length - index) < otherLength) break;

      for (var i = 0; i < otherLength; i++) {
        if (this[index + i] != other[i]) {
          continue outerLoop;
        }
      }
      return true;
    }

    return false;
  }
}
