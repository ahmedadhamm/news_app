import 'package:apinew_app/core/api/api_manager.dart';
import 'package:apinew_app/core/model/NewsResponse.dart';
import 'package:apinew_app/core/model/Source.dart';
import 'package:apinew_app/view/news/news_item.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceId: source.id ?? ''),
        builder: (buildcontext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error Loading Date${snapshot.hasError.toString()}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server Error${snapshot.data?.message}'),
            );
          }
          var newsList = snapshot.data?.newsList;
          return ListView.builder(
            itemBuilder: (_, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
  }
}
