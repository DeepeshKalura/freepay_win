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
      day: "Sun",
      earning: 10000,
      barColor: charts.ColorUtil.fromDartColor(
        Colors.purpleAccent.withOpacity(
          0.6,
        ),
      ),
    ),
    EarningHistory(
      day: "Mon",
      earning: 11000,
      barColor: charts.ColorUtil.fromDartColor(
        Colors.orange.withOpacity(
          0.6,
        ),
      ),
    ),
    EarningHistory(
      day: "Tue",
      earning: 12000,
      barColor: charts.ColorUtil.fromDartColor(
        Colors.purpleAccent.withOpacity(
          0.6,
        ),
      ),
    ),
    EarningHistory(
      day: "Web",
      earning: 10000,
      barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 46.0,
              left: 16.0,
              bottom: 10,
            ),
            child: Text(
              "FEED",
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 4.0,
              left: 16.0,
              bottom: 10,
            ),
            child: Text(
              "Resume",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.29,
                width: MediaQuery.of(context).size.width * 0.65,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Total Gains",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "43 K",
                    style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Active Projects $activeProjects",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 14.0,
              left: 16.0,
            ),
            child: Text(
              "Transcitions",
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 2000, maxWidth: 260),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
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
