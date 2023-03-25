import 'package:flutter/material.dart';

import 'work/request/request_service.dart';

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
    MoneyBarGraph(
        activeProjects: const ['Pankaj'], moneyEarned: const [120, 200, 300]),
    const JobContainer(
      jobContact: 'Pankaj',
      jobTitle: 'Flutter Developer',
      jobDescription: "I need a flutter developer to work on my project",
      jobSalary: '200000',
      jobType: 'Full Time',
      jobTime: '2 year',
    ),
    const ProfilePage(),
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

class MoneyBarGraph extends StatelessWidget {
  final List<double> moneyEarned;
  final List<String> activeProjects;
  final double maxMoney;

  MoneyBarGraph(
      {super.key, required this.moneyEarned, required this.activeProjects})
      : maxMoney = moneyEarned
            .reduce((value, element) => value > element ? value : element);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Dash Board',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              activeProjects.length,
              (index) {
                final percentage = (moneyEarned[index] / maxMoney) * 100;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200 * (moneyEarned[index] / maxMoney),
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${moneyEarned[index].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activeProjects[index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${percentage.toStringAsFixed(2)}%',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
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

class JobContainer extends StatelessWidget {
  final String jobTitle;
  final String jobDescription;
  final String jobType;
  final String jobSalary;
  final String jobTime;
  final String jobContact;

  const JobContainer({
    Key? key,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobType,
    required this.jobSalary,
    required this.jobTime,
    required this.jobContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            jobDescription,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDetailChip('Type', jobType),
              const SizedBox(width: 8),
              _buildDetailChip('Salary', jobSalary),
              const SizedBox(width: 8),
              _buildDetailChip('Time', jobTime),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Contact:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(jobContact),
        ],
      ),
    );
  }

  Widget _buildDetailChip(String label, String value) {
    return Chip(
      label: Text(
        '$label:',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey[200],
      shape: const StadiumBorder(),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      avatar: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.info_outline),
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'I am a passionate developer who loves to build amazing mobile and web applications using Flutter and other technologies. I have over 5 years of experience in software development and have worked on various projects for clients around the world. In my free time, I like to read books and learn new technologies.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: const <Widget>[
                      Chip(
                        label: Text('Flutter'),
                      ),
                      Chip(
                        label: Text('Dart'),
                      ),
                      Chip(
                        label: Text('Firebase'),
                      ),
                      Chip(
                        label: Text('SQL'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Contact Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: john.doe@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone: (123) 456-7890',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Website: www.deepesh.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
