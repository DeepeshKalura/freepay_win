import 'package:flutter/material.dart';

import 'widget/done.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _textController = TextEditingController();

  final List<Articles> request = [
    Articles(
      author: "Deepesh Kalura",
      title: "Pay With Cash, No Credit Card",
      description:
          "Study Suggested That young people will lost money beacuse of bad ",
      urlToImage:
          "https://images.pexels.com/photos/3767397/pexels-photo-3767397.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: ''' 
    Exercise patience and self-control with your finances. If you wait and save money for what you need, you will pay with cash or a debit card to deduct money directly from your checking account and avoid using a credit card.

A credit card is a loan that accumulates interest unless you can afford to pay off the balance in full every month. Credit cards can help you build a good credit score but use them for emergencies only.
    ''',
    ),
    Articles(
      author: "Krishna Joshi",
      title: "Educate Yourself",
      description:
          "Study Suggested That young people will lost money beacuse of bad ",
      urlToImage:
          "https://images.pexels.com/photos/7129656/pexels-photo-7129656.jpeg?auto=compress&cs=tinysrgb&w=600",
      content:
          '''Take charge of your financial future and read a few basic books on personal finance. Once armed with knowledge, don’t let anyone take you off track, whether a significant other who encourages you to waste money or friends who plan expensive trips and events you can't afford. Research professionals like financial planners, mortgage lenders, or accountants before utilizing their services.''',
    ),
    Articles(
      author: "Koopal Pareek",
      title: "Learn to Budget",
      description: "Learning is Important",
      urlToImage:
          "https://images.pexels.com/photos/4050315/pexels-photo-4050315.jpeg?auto=compress&cs=tinysrgb&w=600",
      content:
          '''Once you’ve read a few personal finance books, you will understand two rules. Never let your expenses exceed your income, and watch where your money goes. The best way to do this is by budgeting and creating a personal spending plan to track the money coming in and going out.

Tracking expenses, like your expensive morning coffee, can provide a valuable wake-up call. Small changes in your everyday expenses are under your control and can impact your financial situation. Keeping monthly expenses, like rent, as low as possible can save you money over time and put you in a position to invest in your own home sooner than later.''',
    ),
  ];
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 20,
            ),
            child: Text(
              'Search',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 10,
            ),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: request.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: done(
                    MediaQuery.of(context).size.height * 0.4,
                    request[index].urlToImage,
                    request[index].title,
                    request[index].author,
                    "Read More",
                    context,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Articles {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String content;

  Articles({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
  });
}
