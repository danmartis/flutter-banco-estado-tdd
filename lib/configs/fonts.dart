import 'package:flutter/services.dart';

Future<void> loadFonts() async {

  final fontLoader = FontLoader('nunito');
    
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-BlackItalic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-Black.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-Bold.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-BoldItalic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-ExtraBold.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-ExtraBoldItalic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-ExtraLight.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-ExtraLightItalic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-Italic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-Light.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-LightItalic.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-Regular.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-SemiBold.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Nunito_Sans/NunitoSans-SemiBoldItalic.ttf'));
    
  await fontLoader.load();

}