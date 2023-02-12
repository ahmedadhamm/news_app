import 'package:apinew_app/base/base_view_model.dart';
import 'package:apinew_app/core/api/api_manager.dart';
import 'package:apinew_app/view/news/navigator.dart';

import '../../core/model/news.dart';

class NewsListViewModel extends BaseViewModel<NewsListNavigator> {
  String?errorMessage;
  List<News>?newsList;


 void getNewsBySourceId(String sourceId) async{
   errorMessage=null;
   newsList =null;
   notifyListeners();
   try{
     var response = await ApiManager.getNews(sourceId: sourceId);
     if(response.status=='Error'){
       errorMessage=response.message;
     }else{
       newsList=response.newsList;
     }
   }catch(e){
     errorMessage='Error Loading News';
   }
   notifyListeners();

  }

}