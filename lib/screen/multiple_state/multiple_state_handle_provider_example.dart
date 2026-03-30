import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider<double>((ref) {
  return 0.0;
});

class MultipleStateHandleProviderExample extends ConsumerWidget {
  const MultipleStateHandleProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = ref.watch(sliderProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final sliderValue = ref.watch(sliderProvider);
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: sliderValue),
                  ),
                );
              },
            ),

            Consumer(
              builder: (context, ref, _) {

                print("build");
                return Slider(
                  thumbColor: Colors.blue,
                  value: sliderValue,
                  onChanged: (value) {
                    ref.read(sliderProvider.notifier).state = value;
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
