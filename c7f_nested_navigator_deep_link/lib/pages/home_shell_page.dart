import 'package:flutter/material.dart';
import '../app_routes.dart';
import 'home/home_page.dart';
import 'home/home_detail_page.dart';
import 'profile/profile_page.dart';
import 'profile/edit_profile_page.dart';

class HomeShellPage extends StatefulWidget {
  final AppRoutePath initialPath;

  const HomeShellPage({
    super.key,
    required this.initialPath,
  });

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  late int _currentIndex;

  final _homeKey = GlobalKey<NavigatorState>();
  final _profileKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPath.tabIndex;
    debugPrint('🏠 HomeShell init, tab=$_currentIndex');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('🔁 HomeShell didChangeDependencies');

    final path = widget.initialPath;

    if (path.homeDetailId != null) {
      debugPrint('➡️ Deep link HomeDetail ${path.homeDetailId}');
      _homeKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => HomeDetailPage(id: path.homeDetailId!),
        ),
      );
    }

    if (path.profileEdit) {
      debugPrint('➡️ Deep link ProfileEdit');
      _profileKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        ),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    debugPrint('🏗️ HomeShell build');

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
          builder: (_) => const ProfilePage(),
        );
      },
    );
  }
}
