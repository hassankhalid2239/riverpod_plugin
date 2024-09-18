import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favlist_provider.g.dart';
@riverpod

class FavList extends _$FavList{
  @override

  List build(){
    return [];
  }

  void addUser(String name, String img) {
    // Create a new list to trigger Riverpod's state update mechanism
    state = [...state, {'name': name, 'image': img}];
  }

  void deleteUser(int index) {
    // Create a new list without the removed user
    state = [...state]..removeAt(index);
  }


}

// dart run build_runner watch --delete-conflicting-outputs