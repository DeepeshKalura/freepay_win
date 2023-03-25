import 'package:flutter/material.dart';

import '../../../../controller/search_controller.dart';
import '../../../../model/articles_model.dart';
import 'widget/done.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _textController = TextEditingController();
  final ArticleController _articleController = ArticleController();

  List<Articles> request = [];
  List<Articles> result = [];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
                  onPressed: () async {
                    result = await _articleController
                        .searchArticles(_textController.text);
                    SearchTextResult(request: request);
                  },
                ),
              ),
              onSubmitted: (value) async {
                isLoading = true;
                setState(() {});
                result = await _articleController.searchArticles(value);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchTextResult(request: result),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Articles>>(
                future: _articleController.getArticles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    request = snapshot.data!;
                    return ListView.builder(
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
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class SearchTextResult extends StatelessWidget {
  const SearchTextResult({super.key, required this.request});

  final List<Articles> request;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
        ),
        body: Container(
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
                  'Searched',
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
        ),
      ),
    );
  }
}

class Ontap extends StatelessWidget {
  const Ontap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
