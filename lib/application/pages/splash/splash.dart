import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rnd_clean_architecture/application/pages/weather/weather_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
