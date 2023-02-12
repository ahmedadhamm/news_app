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
      child: Consumer<CategoryNewsListViewModel>(
        builder: (BuildContext context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  child!,
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadNewsSources(widget.category.categoryID);
                      },
                      child: const Text('Try Again',))
                ],
              ),
            );
          }
          else if  (viewModel.sources == null) {
            return Column(
              children:  [
                child!,
                 const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );}
          else {
            return Column(
              children: [
                child!,
                Expanded(child: CategoryTabsWidget(viewModel.sources!)),
              ],
            );
          }
        },
        child: Text('header Text Veiw '),
      ),
    );
  }

  @override
  CategoryNewsListViewModel initViewModel() {
    return CategoryNewsListViewModel();
  }
}
