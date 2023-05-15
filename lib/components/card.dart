import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/colors.dart';

Widget customCard(double height, double width, {required ProductsModel model}) {
  return Card(
    color: Colors.white,
    elevation: 0.5,
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(model.image),
                ),
              ),
              height: height * 0.17,
            ),
            Positioned(
              left: width * 0.27,
              child: IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_rounded,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
              ),
            )
          ],
        ).pOnly(bottom: 6),
        Text(
          model.title.substring(0, 16),
          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          model.description,
          style: TextStyle(
              fontSize: width * 0.03,
              fontWeight: FontWeight.bold,
              color: Vx.gray400),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).px4(),
        Text(
          '\$${model.price}',
          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
