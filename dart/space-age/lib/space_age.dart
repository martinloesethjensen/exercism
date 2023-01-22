const int _earthSeconds = 31557600;

class SpaceAge {
  static const planetsAndOribitalPeriods = <String, double>{
    'earth': 1.0,
    'mercury': 0.2408467,
    'venus': 0.61519726,
    'mars': 1.8808158,
    'jupiter': 11.862615,
    'saturn': 29.447498,
    'uranus': 84.016846,
    'neptune': 164.79132
  };

  double age({required String planet, required int seconds}) {
    final _planet = planet.toLowerCase();
    assert(
      planetsAndOribitalPeriods.containsKey(_planet),
      'Planet doesn\'t exist in our solar system',
    );
    return seconds.toAgeFromOrbitalPeriod(planetsAndOribitalPeriods[_planet]!);
  }
}

extension on int {
  double toAgeFromOrbitalPeriod([double period = 1.0]) =>
      double.parse((this / (_earthSeconds * period)).toStringAsFixed(2));
}
