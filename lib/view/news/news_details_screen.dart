import 'package:apinew_app/core/model/news.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetailsScreen extends StatefulWidget {
  static const String routName = 'news_details';

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/pattern.jpg"),
            ),),
         // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
         // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('News Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
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
                  style: const TextStyle(color: Colors.black),
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
                const SizedBox(
                  height: 12,
                ),
                Text(news.content ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('View Full Ari tcl',style: TextStyle(
                      color: Color(0xff42505C),
                      fontSize: 14,
                    ),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.play_arrow_sharp,size: 25,))
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
