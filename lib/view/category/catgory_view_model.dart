import 'package:apinew_app/base/base_view_model.dart';
import 'package:apinew_app/core/api/api_manager.dart';
import 'package:apinew_app/core/model/Source.dart';
import 'package:apinew_app/view/category/navigator.dart';

class CategoryNewsListViewModel
    extends BaseViewModel<CatgoryNewsListNavigator> {
  List<Source>? sources = null;
  String? errorMessage = null;

  void loadNewsSources(String categoryId) async {
    //navigator?.showMessage('Loading...');
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);

      if (response.status == 'Error') {
        errorMessage = response.message;
      } else {
        sources = response.sources;
      }
    } catch (e) {
      // navigator?.showMessage('Error getting news sources');
      errorMessage = 'Error getting news sources';
    }
    notifyListeners();
  }
}
