import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text('Сохранить'),
          ),

        ],
      ),
    );
  }
}
