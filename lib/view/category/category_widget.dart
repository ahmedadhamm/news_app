import 'package:apinew_app/base/base_state.dart';
import 'package:apinew_app/core/model/SourcseResponse.dart';
import 'package:apinew_app/view/category/category_tabs_widget.dart';
import 'package:apinew_app/view/category/catgory_view_model.dart';
import 'package:apinew_app/view/category/navigator.dart';
import 'package:apinew_app/view/home/category_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:apinew_app/core/api/api_manager.dart';
import 'package:provider/provider.dart';

class CategoryNewsList extends StatefulWidget {
  Category category;

  CategoryNewsList(this.category);

  @override
  State<CategoryNewsList> createState() => _CategoryNewsListState();
}

class _CategoryNewsListState
    extends BaseState<CategoryNewsList, CategoryNewsListViewModel>
    implements CatgoryNewsListNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadNewsSources(widget.category.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryNewsListViewModel>(
      create: (context) => viewModel,
      child: Container(
        child: Consumer<CategoryNewsListViewModel>(
          builder: (BuildContext context, viewModel, __) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Try Again'))
                  ],
                ),
              );
            }
            else if  (viewModel.sources == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );}
            else {
              return CategoryTabsWidget(viewModel.sources!);
            }
          },
        ),
      ),
    );
  }

  @override
  CategoryNewsListViewModel initViewModel() {
    return CategoryNewsListViewModel();
  }
}
