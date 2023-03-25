import 'package:flutter/material.dart';

import 'widget/done.dart';

class JobRequest {
  final String title;
  final String name;
  final String imagePath;
  final String amount;

  JobRequest({
    required this.title,
    required this.name,
    required this.imagePath,
    required this.amount,
  });
}

class FeedsBoard extends StatelessWidget {
  FeedsBoard({super.key});

  final List<JobRequest> request = [
    JobRequest(
      title: 'Flutter Job Portal App with Admin Panel',
      name: 'DizitalTrends',
      imagePath:
          'https://codecanyon.img.customer.envatousercontent.com/files/407590832/Flutter+Job+App.png?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=300&s=e778b1255b0cd8017b9feedeef889f8e',
      amount: '21',
    ),
    JobRequest(
      title: "QJobs-Flutter Job Portal Kit",
      name: "codesolutions101",
      imagePath:
          'https://codecanyon.img.customer.envatousercontent.com/files/281501615/inlineimage.png?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=300&s=6bda36bd9a3adab79ac326b92bb8e777',
      amount: "14",
    ),
    JobRequest(
      title: "Cariera - Wp Job manager Flutter App",
      name: "gnodesign",
      imagePath:
          "https://codecanyon.img.customer.envatousercontent.com/files/422004036/preview.jpg?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=300&s=555291cca1a509ea7e42a1328ce3c982",
      amount: "149",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: const Text(
              "Get Projects",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: request.length,
              itemBuilder: (context, index) {
                return done(
                  MediaQuery.of(context).size.height * 0.4,
                  request[index].imagePath,
                  request[index].title,
                  request[index].name,
                  request[index].amount,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
