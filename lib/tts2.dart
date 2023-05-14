import 'package:flutter_tts/flutter_tts.dart';

class MyTTS {
  final FlutterTts tts = FlutterTts();
  int state = 0;

  MyTTS() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
    tts.awaitSpeakCompletion(true);
    tts.awaitSynthCompletion(true);
  }

  Future<void> speakEnglish(String text) async {
    tts.setLanguage('en'); // set language to English
    tts.setStartHandler(() {
      state = 1;
    });
    await tts.speak(text); // speak English message
    tts.setCompletionHandler(() {
      state = 0;
    });
  }

  Future<void> speakArabic(String text) async {
    tts.setLanguage('ar'); // set language to Arabic
    tts.setStartHandler(() {
      state = 1;
    });
    await tts.speak(text); // speak Arabic message
    tts.setCompletionHandler(() {
      state = 0;
    });
  }

  void stop() {
    tts.stop();
  }
}