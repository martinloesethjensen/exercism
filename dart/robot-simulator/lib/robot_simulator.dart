import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Robot(this.position, this.orientation);

  Position position;
  Orientation orientation;

  void move(String commands) {
    commands.toUpperCase().split('').forEach((command) {
      switch (command) {
        case 'R':
          final index = orientation.index + 1;
          orientation =
              index > 3 ? Orientation.values.first : Orientation.values[index];
          break;
        case 'L':
          final index = orientation.index - 1;
          orientation =
              index < 0 ? Orientation.values.last : Orientation.values[index];
          break;
        case 'A':
          switch (orientation) {
            case Orientation.north:
              position.y++;
              break;
            case Orientation.east:
              position.x++;
              break;
            case Orientation.south:
              position.y--;
              break;
            case Orientation.west:
              position.x--;
              break;
          }
          break;
      }
    });
  }
}
