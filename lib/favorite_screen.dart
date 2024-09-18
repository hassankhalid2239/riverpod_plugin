import 'package:flutter/material.dart';
import 'data.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // favoriteProvider.addUser(
              //     data[index]['name'], data[index]['image']);
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,//favoriteProvider.selectedUser.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 90,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                      NetworkImage('https://img.freepik.com/premium-photo/smiling-man-professional-profile-picture_606187-680.jpg?w=826'),
                      // NetworkImage(value.selectedUser[index]['image']),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        // value.deleteUser(index);
                      },
                      icon: const Icon(
                        Icons.clear,
                        // color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Name',
                      // value.selectedUser[index]['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
