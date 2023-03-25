import 'package:flutter/material.dart';

class JobRequest {
  final String title;
  final String name;
  final String imagePath;
  final String amount;
  final String tags;

  JobRequest({
    required this.title,
    required this.name,
    required this.imagePath,
    required this.amount,
    required this.tags,
  });
}

class FeedsBoard extends StatelessWidget {
  FeedsBoard({super.key});

  final List<JobRequest> request = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds Board'),
      ),
      body: ListView.builder(
        itemCount: request.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(request[index].imagePath),
              ),
              title: Text(request[index].title),
              subtitle: Text(request[index].name),
              trailing: Text(request[index].amount),
            ),
          );
        },
      ),
    );
  }
}
