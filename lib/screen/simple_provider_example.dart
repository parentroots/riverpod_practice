import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return "Hello";
});

final ageProvider = Provider<int>((ref) {
  return 25;
});

final rollProvider = Provider<int>((ref) {
  return 639142;
});

final technologyProvider = Provider<String>((ref) {
  return "Computer Science And Technology";
});

final userListProvider = Provider<List<String>>((ref) {
  return ["Ibrahim", "Nazmul", "Saiful"];
});

final userDataProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "name": "Ibrahim",
      "age": 25,
      "roll": 639142,
      "technology": "Computer Science And Technology",
    },
    {
      "name": "Nazmul",
      "age": 25,
      "roll": 639142,
      "technology": "Computer Science And Technology",
    },
    {
      "name": "Saiful",
      "age": 25,
      "roll": 639142,
      "technology": "Computer Science And Technology",
    },
  ];
});



/*
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wellCome = ref.watch(helloProvider);
    final userList = ref.watch(userListProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(child: Text(userList[index]));
        },
      ),
    );
  }
}*/

class SimpleProviderExample extends ConsumerStatefulWidget {
  const SimpleProviderExample({super.key});

  @override
  ConsumerState<SimpleProviderExample> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<SimpleProviderExample> {
  @override
  Widget build(BuildContext context) {
    final userList = ref.watch(userDataProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final userData = userList[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(userData['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userData['roll'].toString()),
                      Text(userData['age'].toString()),
                    ],
                  ),
                  trailing: Text(userData['technology']),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
