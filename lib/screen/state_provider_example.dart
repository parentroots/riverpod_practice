import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print("Scaffold Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("StateProvider",style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);
              return Text(counter.toString());
            },
          ),

          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
              print("Increment Build");
            },
            child: Text("Increment"),
          ),
          ElevatedButton(onPressed: () {
            ref.read(counterProvider.notifier).state--;
            print("Decrement Build");
          }, child: Text("Decrement")),
        ],
      ),
    );
  }
}
