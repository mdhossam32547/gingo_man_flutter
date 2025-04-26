import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gingo_man/firebase_options.dart';
import 'package:gingo_man/home_screen.dart';
import 'package:gingo_man/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: DefaultFirebaseOptions.android.apiKey,
          appId: DefaultFirebaseOptions.android.appId,
          messagingSenderId: DefaultFirebaseOptions.android.messagingSenderId,
          projectId: DefaultFirebaseOptions.android.projectId,
          storageBucket: DefaultFirebaseOptions.android.storageBucket,
        ),
      ).whenComplete(() {
        // FirebaseCloudMessaging().init();
        // LocalNotificationService.init();
      })
      : await Firebase.initializeApp().whenComplete(() {
        // FirebaseCloudMessaging().init();
        // LocalNotificationService.init();
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Development',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
