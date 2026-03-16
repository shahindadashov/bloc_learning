import 'package:bloc_learning/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: SplashPage(),
      // home: BlocProvider(create: (context) => CounterBloc(), child: CounterPage()),
    );
  }
}
