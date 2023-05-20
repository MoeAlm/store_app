import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/product_model.dart';
import '../services/update_product_service.dart';

class UpdateProductScreen extends StatefulWidget {
  final ProductsModel products;

  const UpdateProductScreen({Key? key, required this.products})
      : super(key: key);

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height * 0.1,
              ),
              defaultTextFormField(
                  label: 'Product Name',
                  hint: '',
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    productName = value;
                  }).p12(),
              defaultTextFormField(
                  label: 'Description',
                  hint: '',
                  inputType: TextInputType.text,
                  maxLines: 3,
                  onChanged: (value) {
                    description = value;
                  }).p12(),
              defaultTextFormField(
                  label: 'Price',
                  hint: '',
                  inputType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  }).p12(),
              defaultTextFormField(
                  label: 'Image',
                  hint: '',
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    image = value;
                  }).p12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * 0.34,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.34,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await updateProducts();
                          print('success');
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          print('$e');
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ).px32()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProducts() async {
    await UpdateProductService().updateProduct(
      id: widget.products.id,
      title: productName == null ? widget.products.title : productName!,
      price: price == null ? widget.products.price.toString() : price!,
      description: description == null ? widget.products.description : description!,
      image: image == null ? widget.products.image : image!,
      category: widget.products.category,
    );
  }
}
