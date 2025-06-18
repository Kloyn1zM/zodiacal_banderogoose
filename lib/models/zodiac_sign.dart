class ZodiacSign {
  final String name;
  final String imageAsset;
  final String dateRange;
  final String description;
  final String quote;
  final String charmGun;
  final String luckyNumbers;
  final List<String> compatibility;
  final String forecast;
  final Map<String, Map<String, int>> compatibilityScores; 

  ZodiacSign({
    required this.name,
    required this.imageAsset,
    required this.dateRange,
    required this.description,
    required this.quote,
    required this.charmGun,
    required this.luckyNumbers,
    required this.compatibility,
    required this.forecast,
    required this.compatibilityScores,
  });
}
