import 'package:flutter/material.dart';

import '../work/create/create_project_screen.dart';
import 'board/dash_board.dart';
import 'board/feed_board.dart';
import 'board/profile_board.dart';
import 'board/search_board.dart';

class HomeDashBoardNaviagtorScreen extends StatefulWidget {
  const HomeDashBoardNaviagtorScreen({super.key});

  @override
  State<HomeDashBoardNaviagtorScreen> createState() =>
      _HomeDashBoardNaviagtorScreenState();
}

class _HomeDashBoardNaviagtorScreenState
    extends State<HomeDashBoardNaviagtorScreen> {
  int _selectedIndex = 2;
  static final List<Widget> _widgetOptions = <Widget>[
    const CreateProjectPageScreen(),
    const SearchWidget(),
    const Dashboard(),
    FeedsBoard(),
    const ProfileBoard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
