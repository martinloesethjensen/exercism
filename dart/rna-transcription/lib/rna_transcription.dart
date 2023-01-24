class RnaTranscription {
  static const nucleotides = <String, String>{
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
  };

  String toRna(String dna) => dna.split('').map((e) => nucleotides[e]).join();
}
