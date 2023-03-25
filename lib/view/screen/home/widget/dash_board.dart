import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Transcitions> transcitions = [
    Transcitions(
      amount: "2000",
      date: "12/12/2021",
      name: "Deepesh Kalura",
      imageUrl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Transcitions(
      amount: "5000",
      date: "12/12/2021",
      name: "Deepesh Kalura",
      imageUrl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Transcitions(
      amount: "3000",
      date: "12/12/2021",
      name: "Deepesh Kalura",
      imageUrl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Transcitions(
      amount: "1000",
      date: "12/12/2021",
      name: "Deepesh Kalura",
      imageUrl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
  ];

  final List<EarningHistory> data = [
    EarningHistory(
      day: "Mon",
      earning: 1000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Tue",
      earning: 1100000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Wed",
      earning: 1200000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Thur",
      earning: 1000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Fri",
      earning: 850000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Sat",
      earning: 770000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    EarningHistory(
      day: "Sun",
      earning: 760000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
  ];

  final int activeProjects = 5;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<EarningHistory, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (EarningHistory series, _) => series.day,
          measureFn: (EarningHistory series, _) => series.earning,
          colorFn: (EarningHistory series, _) => series.barColor)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: charts.BarChart(series, animate: true),
          ),
          const SizedBox(height: 16.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  const Text(
                    "Active Projects",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "$activeProjects",
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: transcitions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TransitionCard(
                  name: transcitions[index].name,
                  date: transcitions[index].date,
                  amount: double.parse(transcitions[index].amount),
                  imageUrl: transcitions[index].imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EarningHistory {
  final String day;
  final double earning;
  final charts.Color barColor;

  EarningHistory(
      {required this.day, required this.earning, required this.barColor});
}

class Transcitions {
  final String date;
  final String name;
  final String amount;
  final String imageUrl;

  Transcitions(
      {required this.imageUrl,
      required this.date,
      required this.name,
      required this.amount});
}

class TransitionCard extends StatelessWidget {
  final String name;
  final String date;
  final double amount;
  final String imageUrl;

  const TransitionCard({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Image.network(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
