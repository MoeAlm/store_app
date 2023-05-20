import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProduct(
      {required int id,
      required String title,
        required String price,
        required String description,
        required String image,
        required String category}) async {
    print('product id = $id');
    Map<String, dynamic> data = await ApiHelper().putApi(
      url: 'https://fakestoreapi.com/products/$id',
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