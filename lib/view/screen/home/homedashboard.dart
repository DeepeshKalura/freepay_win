import 'package:flutter/material.dart';

import '../work/request/request_service.dart';
import 'board/dash_board.dart';
import 'board/feed_board.dart';
import 'board/profile_board.dart';

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
    const RequestServicePageWidget(),
    SearchWidget(),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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

class SearchWidget extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
