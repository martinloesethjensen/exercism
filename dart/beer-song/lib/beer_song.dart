class BeerSong {
  List<String> recite(int amount, int times) {
    final verses = List.generate(times, (index) {
      if (index < times - 1) {
        return generateVerse(bottleAmount: amount - index)..add('');
      }
      return generateVerse(bottleAmount: amount - index);
    });
    return verses.expand((element) => element).toList();
  }

  List<String> generateVerse({required int bottleAmount}) {
    if (bottleAmount > 1) {
      return <String>[
        '$bottleAmount bottles of beer on the wall, $bottleAmount bottles of beer.',
        'Take one down and pass it around, ${bottleAmount - 1} bottle${(bottleAmount - 1) > 1 ? 's' : ''} of beer on the wall.'
      ];
    } else if (bottleAmount == 1) {
      return <String>[
        '1 bottle of beer on the wall, 1 bottle of beer.',
        'Take it down and pass it around, no more bottles of beer on the wall.'
      ];
    } else {
      return <String>[
        'No more bottles of beer on the wall, no more bottles of beer.',
        'Go to the store and buy some more, 99 bottles of beer on the wall.'
      ];
    }
  }
}
