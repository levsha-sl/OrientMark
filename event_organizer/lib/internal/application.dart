import 'package:flutter/material.dart';

import 'package:event_organizer/presentation/home/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
      },
    );
  }
}
