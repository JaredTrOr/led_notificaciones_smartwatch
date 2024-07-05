import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weartest/api/firebase_api.dart';
import 'package:weartest/pages/home_page.dart';
import 'package:weartest/pages/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartWatch Counter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.compact,
      ),
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_page': (context) => const NotificationPage()
      },
    );
  }
}

