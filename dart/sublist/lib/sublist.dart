// Implement the Classification enum.
import 'package:collection/collection.dart';

enum Classification { sublist, superlist, equal, unequal }

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) {
    final listOneAsString = listOne.join(',');
    final listTwoAsString = listTwo.join(',');
    if (ListEquality().equals(listOne, listTwo)) {
      return Classification.equal;
    } else if (listTwo.isEmpty || listOneAsString.contains(listTwoAsString)) {
      return Classification.superlist;
    } else if (listOne.isEmpty || listTwoAsString.contains(listOneAsString)) {
      return Classification.sublist;
    }
    return Classification.unequal;
  }
}
