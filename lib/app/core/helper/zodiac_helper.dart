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
      return '/Users/bora/Desktop/moon_x/assets/horoscope/capricornius.png';
    case 'Aquarius':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/aquarius.png';
    case 'Pisces':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/pisces.png';
    case 'Aries':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/aries.png';
    case 'Taurus':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/taurus.png';
    case 'Gemini':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/gemini.png';
    case 'Cancer':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/cancer.png';
    case 'Leo':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/leo.png';
    case 'Virgo':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/virgo.png';
    case 'Libra':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/libra.png';
    case 'Scorpio':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/scorpio.png';
    case 'Sagittarius':
      return '/Users/bora/Desktop/moon_x/assets/horoscope/sagittarius.png';
    default:
      return '';
  }
}
