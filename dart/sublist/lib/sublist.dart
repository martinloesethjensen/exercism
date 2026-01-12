// Implement the Classification enum.
import 'package:collection/collection.dart';

enum Classification { sublist, superlist, equal, unequal }

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) {
    if (ListEquality().equals(listOne, listTwo)) {
      return Classification.equal;
    } else if (listTwo.isEmpty || listTwo.every((e) => listOne.contains(e))) {
      return Classification.superlist;
    } else if (listOne.isEmpty || listOne.every((e) => listTwo.contains(e))) {
      return Classification.sublist;
    }
    return Classification.unequal;
  }
}
