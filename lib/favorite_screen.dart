import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_plugin/Providers/favlist_provider.dart';
import 'data.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build.....');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'List App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              ref
                  .watch(favListProvider.notifier)
                  .addUser(data[index]['name'], data[index]['image']);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]['image']),
            ),
            title: Text(data[index]['name']),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          height: 90,
          child: Consumer(builder: (context, WidgetRef ref, child) {
            final user = ref.watch(favListProvider);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 90,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(user[index]['image']),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            ref
                                .read(favListProvider.notifier)
                                .deleteUser(index);
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 28,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          user[index]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          })),
    );
  }
}
