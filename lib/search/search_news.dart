import 'package:apinew_app/core/api/api_manager.dart';
import 'package:apinew_app/core/model/news.dart';
import 'package:apinew_app/view/news/news_item.dart';
import 'package:flutter/material.dart';

class SearchNews extends StatefulWidget {
  static const String routName = 'search';

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  String query = '';
  TextEditingController textQuery = TextEditingController();

  List<News> newDataList = [];

  List<News> search() {
    ApiManager.getNews(searchKeyword: query ?? '').then((newResponse) {
      newDataList = newResponse.newsList ?? [];
    }).catchError((error) {
      print('Error During Searc !! $error');
    });
    return newDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            leading: Container(),
            leadingWidth: 10,
            title: Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              // margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: textQuery,
                // onChanged: (String text) {
                // setState(() {
                //query = text;
                //print(text);
                //  });
                //},
                onFieldSubmitted: (String text) {
                  setState(() {
                    query = text;
                    print(text);
                  });
                },

                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 18),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            query= '';
                            textQuery.text = '';
                          });
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Theme.of(context).primaryColor,
                        )),
                    suffixIcon: IconButton(
                        onPressed: () {
                          search();
                        },
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        )),
                    hintText: 'Search Article',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(57, 165, 82, 0.3),
                    )),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsItem(search()[index]);
                  },
                  itemCount: search().length,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
