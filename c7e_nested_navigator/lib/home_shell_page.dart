import 'package:flutter/material.dart';
import 'tabs/home/home_page.dart';
import 'tabs/profile/profile_page.dart';

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(int index) {
    if (index == _currentIndex) {
      // Pop về root của tab
      _navigatorKeys[index]
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 HomeShellPage build index=$_currentIndex');

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildTabNavigator(
            navigatorKey: _navigatorKeys[0],
            child: const HomePage(),
          ),
          _buildTabNavigator(
            navigatorKey: _navigatorKeys[1],
            child: const ProfilePage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
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

  Widget _buildTabNavigator({
    required GlobalKey<NavigatorState> navigatorKey,
    required Widget child,
  }) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        debugPrint('➡️ Tab Navigator push ${settings.name}');
        return MaterialPageRoute(
          builder: (_) => child,
        );
      },
    );
  }
}
