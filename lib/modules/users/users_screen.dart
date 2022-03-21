import 'package:flutter/material.dart';
import '../../models/user/user_model.dart';

// ignore: must_be_immutable
class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mohamed Sharaf',
      phone: '01116477579',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Sharaf',
      phone: '01111473619',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Sharaf',
      phone: '01227442150',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Sharaf',
      phone: '01116477579',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Sharaf',
      phone: '01111473619',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Sharaf',
      phone: '01227442150',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Sharaf',
      phone: '01116477579',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Sharaf',
      phone: '01111473619',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Sharaf',
      phone: '01227442150',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Sharaf',
      phone: '01116477579',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Sharaf',
      phone: '01111473619',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Sharaf',
      phone: '01227442150',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Sharaf',
      phone: '01116477579',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Sharaf',
      phone: '01111473619',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Sharaf',
      phone: '01227442150',
    ),
  ];

  UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 25.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
            itemCount: users.length));
  }

  // 1.build item
  // 2.build list
  // 3.add item to list

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  user.phone,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
