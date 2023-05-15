import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await ApiHelper().getApi(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
