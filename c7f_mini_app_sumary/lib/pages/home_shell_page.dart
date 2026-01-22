import 'package:flutter/material.dart';
import '../auth_state.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class HomeShellPage extends StatefulWidget {
  final AuthState authState;

  const HomeShellPage({
    super.key,
    required this.authState,
  });

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  final _homeKey = GlobalKey<NavigatorState>();
  final _profileKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomeShell build');

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeNavigator(),
          _buildProfileNavigator(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onTabTap(int index) {
    debugPrint('🔀 Tap tab $index');

    if (index == _currentIndex) {
      final key = index == 0 ? _homeKey : _profileKey;
      key.currentState?.popUntil((r) => r.isFirst);
    } else {
      setState(() => _currentIndex = index);
    }
  }

  Widget _buildHomeNavigator() {
    return Navigator(
      key: _homeKey,
      onGenerateRoute: (_) {
        debugPrint('🏠 HomeNavigator root');
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      },
    );
  }

  Widget _buildProfileNavigator() {
    return Navigator(
      key: _profileKey,
      onGenerateRoute: (_) {
        debugPrint('👤 ProfileNavigator root');
        return MaterialPageRoute(
          builder: (_) => ProfilePage(
            authState: widget.authState,
          ),
        );
      },
    );
  }
}
