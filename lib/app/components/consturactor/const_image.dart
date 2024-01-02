enum ImageEnum {
  firstImage,
  secondImage,
  thirdImage,
}

// Enum sabitlerine karşılık gelen resim yolları
const Map<ImageEnum, String> imagePaths = {
  ImageEnum.firstImage:
      '/Users/bora/Desktop/moon_x/assets/onboarding/img_background_first.png',
  ImageEnum.secondImage:
      '/Users/bora/Desktop/moon_x/assets/onboarding/img_background_second.png',
  ImageEnum.thirdImage:
      '/Users/bora/Desktop/moon_x/assets/onboarding/img_background_third.png',
};

// Enum sabitlerine extension ile özel fonksiyonlar ekleme
extension ImageEnumExtension on ImageEnum {
  String get imagePath {
    return imagePaths[this] ??
        ''; // Belirtilen sabite karşılık gelen resim yolu
  }
}
