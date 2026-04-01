import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final appStateProvider = StateProvider<AppState>((ref) {
  return AppState(slider: 0.0, showPassword: false);
});

class AppState {

  
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

class MultipleStateHandleCopyWithMethod extends StatelessWidget {
  const MultipleStateHandleCopyWithMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final showPassword = ref.watch(
                  appStateProvider.select((state) => state.showPassword),
                );

                print("build eye");
                return IconButton(
                  onPressed: () {
                    ref.read(appStateProvider.notifier).state = ref
                        .read(appStateProvider)
                        .copyWith(showPassword: !showPassword);
                  },
                  icon: showPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                );
              },
            ),

            Consumer(
              builder: (context, ref, child) {
                print("build Slider Container");
                final slider = ref.watch(
                  appStateProvider.select((state) => state.slider),
                );
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue.withOpacity(slider),
                );
              },
            ),

            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(
                  appStateProvider.select((state) => state.slider),
                );
                return Slider(
                  value: slider,
                  onChanged: (value) {
                    ref.read(appStateProvider.notifier).state =
                        ref.read(appStateProvider).copyWith(slider: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
