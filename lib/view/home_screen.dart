import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/view/detail_screen.dart';
import 'package:store_app/view/update_product_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/card.dart';
import '../constant/colors.dart';
import '../services/get_all_product_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> productsList = [
      'All',
      'Shirts',
      'Jackets',
      'Jeans',
      'Shoes',
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ).px(6),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            style: OutlinedButton.styleFrom(backgroundColor: kPrimaryColor),
          )
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Search..',
              labelStyle: const TextStyle(color: Colors.grey),
              hintText: 'Axel Arigato',
              fillColor: Vx.gray200,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
              ),
              suffixIcon: IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list_outlined,
                  color: Colors.white,
                ),
                style: OutlinedButton.styleFrom(backgroundColor: kPrimaryColor),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(width: 0.0001),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(width: 0.0001),
              ),
            ),
          ).px(26),
          /////////////////Category
          SizedBox(
            height: height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: AllCategoriesService().getAllCategories(),
                  builder: (context, snapshot) {
                    return Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: index == 0 ? kPrimaryColor : Colors.grey,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            productsList[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                );
              },
            ),
          ).py(8.5),
          SizedBox(
            height: height * 0.655,
            child: FutureBuilder<List<ProductsModel>>(
                future: GetAllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductsModel> products = snapshot.data!;
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onDoubleTap: (){
                              //UpdateProductScreen()
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return UpdateProductScreen(products: products[index],);
                              }));
                            },
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DetailsScreen(model: products[index]);
                              }));
                            },
                              child: customCard(height, width, model: products[index]));
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ).pSymmetric(h: 16)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Card'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
