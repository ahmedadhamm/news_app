import 'package:apinew_app/base/base_state.dart';
import 'package:apinew_app/core/api/api_manager.dart';
import 'package:apinew_app/core/model/NewsResponse.dart';
import 'package:apinew_app/core/model/Source.dart';
import 'package:apinew_app/view/news/navigator.dart';
import 'package:apinew_app/view/news/news_item.dart';
import 'package:apinew_app/view/news/news_list_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseState<NewsList, NewsListViewModel>
    implements NewsListNavigator {
  @override
  NewsListViewModel initViewModel() {
    return NewsListViewModel();
  }
  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        child: Consumer<NewsListViewModel>(
          builder: (buildcontext, viewModel, _) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text('${viewModel.errorMessage}'),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id!);
                      },
                      child: const Text('Try Again')),
                ],
              );
            } else if (viewModel.newsList == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList?.length ?? 0,
            );
          },
        ),
      ),
      // FutureBuilder<NewsResponse>(
      //   future: ApiManager.getNews(sourceId: source.id ?? ''),
      //   builder: (build context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error Loading Date${snapshot.hasError.toString()}'),
      //       );
      //     }
      //     if (snapshot.data?.status == 'error') {
      //       return Center(
      //         child: Text('Server Error${snapshot.data?.message}'),
      //       );
      //     }
      //     var newsList = snapshot.data?.newsList;
      //     return ListView.builder(
      //       itemBuilder: (_, index) {
      //         return NewsItem(newsList![index]);
      //       },
      //       itemCount: newsList?.length ?? 0,
      //     );
      //   },
      // ),
    );
  }
}
