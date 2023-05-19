import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        await ApiHelper().getApi(url: 'https://fakestoreapi.com/products');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
// class GetAllProductsService {
//   Future<List<ProductsModel>> getAllProducts() async {
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     List<dynamic> data = jsonDecode(response.body);
//     final productsList =
//         data.map((item) => ProductsModel.fromJson(item)).toList();
//     return productsList;
//   }
// }
