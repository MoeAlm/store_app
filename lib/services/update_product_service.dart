import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductsModel> updateProduct(
      {required String title,
        required String price,
        required String description,
        required String image,
        required String category}) async {
    Map<String, dynamic> data = await ApiHelper().postApi(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductsModel.fromJson(data);
  }
}