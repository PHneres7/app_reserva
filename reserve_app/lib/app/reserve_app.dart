import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';

class ReserveApp extends StatelessWidget {
  const ReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouts.loginPage,
      routes: AppRouts.routes,
    );
  }
}
