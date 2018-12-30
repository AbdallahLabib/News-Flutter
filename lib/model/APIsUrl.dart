//Must be constant because it is using static
class APIs {
  static const String mainLink = 'https://newsapi.org/v2/top-headlines?country=eg&category=';
  static const String apiKey = '&apiKey=584ce948c79f47c4855786a84f30ace9';
  static const String technology = mainLink + 'technology' + apiKey;
  static const String business = mainLink + 'business' + apiKey;
  static const String entertainment = mainLink + 'entertainment' + apiKey;
  static const String sports = mainLink + 'sports' + apiKey;
  static const String science = mainLink + 'science' + apiKey;
  static const String health = mainLink + 'health' + apiKey;
}