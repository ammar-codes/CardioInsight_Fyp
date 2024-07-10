import 'package:flutter/material.dart';
import 'package:cardio_app/screens/splash/splash_screen.dart';
import 'package:cardio_app/services/notification_service.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
