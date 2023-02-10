import 'package:apinew_app/core/model/news.dart';
import 'package:apinew_app/view/news/news_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routName,
            arguments: News);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  width: double.infinity,
                  height: 200,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                news.author ?? '',
                textAlign: TextAlign.start,
              ),
              Text(
                news.title ?? '',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                news.publishedAt ?? '',
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
