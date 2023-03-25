import 'package:flutter/material.dart';

import '../../../../controller/project_controller.dart';
import 'widget/done.dart';

class FeedsBoard extends StatelessWidget {
  FeedsBoard({super.key});
  final ProjectController _projectController = ProjectController();

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
            child: FutureBuilder(
              future: _projectController.getProject(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return done(
                        MediaQuery.of(context).size.height * 0.4,
                        snapshot.data![index].imagePath,
                        snapshot.data![index].title,
                        snapshot.data![index].name,
                        snapshot.data![index].amount,
                        context,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
