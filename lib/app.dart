import 'package:flutter/material.dart';
import 'package:riverpod_practice/screen/multiple_state/multiple_state_handle_copy_with_method.dart';
import 'package:riverpod_practice/screen/multiple_state/multiple_state_handle_provider_example.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultipleStateHandleCopyWithMethod(),
    );
  }
}
