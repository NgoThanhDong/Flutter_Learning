import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('👤 ProfilePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('➡️ PUSH EditProfile');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const EditProfilePage(),
              ),
            );
          },
          child: const Text('Edit Profile'),
        ),
      ),
    );
  }
}
