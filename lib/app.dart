import 'package:flutter/material.dart';
import 'package:riverpod_practice/screen/state_provider_example.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StateProviderExample());
  }
}
