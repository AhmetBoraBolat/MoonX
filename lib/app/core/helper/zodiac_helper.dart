String getZodiacSign(DateTime selectedDate) {
  const List<String> zodiacSigns = [
    'Capricorn',
    'Aquarius',
    'Pisces',
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius'
  ];
  const List<int> cutoffDays = [20, 19, 20, 20, 21, 21, 22, 22, 22, 22, 21, 21];

  int zodiacIndex = selectedDate.month -
      (selectedDate.day < cutoffDays[selectedDate.month - 1] ? 1 : 0);
  return zodiacSigns[zodiacIndex % 12];
}

String getZodiacImagePath(String zodiacSign) {
  switch (zodiacSign) {
    case 'Capricorn':
      return 'assets/horoscope/capricornius.png';
    case 'Aquarius':
      return 'assets/horoscope/aquarius.png';
    case 'Pisces':
      return 'assets/horoscope/pisces.png';
    case 'Aries':
      return 'assets/horoscope/aries.png';
    case 'Taurus':
      return 'assets/horoscope/taurus.png';
    case 'Gemini':
      return 'assets/horoscope/gemini.png';
    case 'Cancer':
      return 'assets/horoscope/cancer.png';
    case 'Leo':
      return 'assets/horoscope/leo.png';
    case 'Virgo':
      return 'assets/horoscope/virgo.png';
    case 'Libra':
      return 'assets/horoscope/libra.png';
    case 'Scorpio':
      return 'assets/horoscope/scorpio.png';
    case 'Sagittarius':
      return 'assets/horoscope/sagittarius.png';
    default:
      return '';
  }
}
