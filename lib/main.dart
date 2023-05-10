import 'package:camera/camera.dart';
import 'package:client/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'locator.dart';
import 'package:flutter/services.dart';

List<CameraDescription> cameras = [];
Future main() async {
  setupServices();
  await dotenv.load(fileName: ".env");
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.teal[700],
        ),
      ),
      home: Splash()));
}
