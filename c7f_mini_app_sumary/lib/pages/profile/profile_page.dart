import 'package:flutter/material.dart';
import '../../app_routes.dart';
import '../../auth_state.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  final AuthState authState;

  const ProfilePage({super.key, required this.authState});

  @override
  Widget build(BuildContext context) {
    debugPrint('👤 ProfilePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const EditProfilePage()),
                );
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                authState.logout();
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
