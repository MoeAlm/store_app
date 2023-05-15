
import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class CategoriesService {
  Future<List<ProductsModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await ApiHelper().getApi(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
