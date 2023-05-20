import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/colors.dart';
import '../models/product_model.dart';

class DetailsScreen extends StatefulWidget {
  final ProductsModel model;

  const DetailsScreen({super.key,required this.model});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.gray50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              color: Vx.gray50,
              image: DecorationImage(
                image: NetworkImage(widget.model.image),
              ),
              borderRadius: const BorderRadiusDirectional.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.model.title.substring(0, 23),
                style: TextStyle(
                    fontSize: width * 0.065, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ).px(8).py(10),
          Row(
            children: [
              RatingBar.builder(
                itemSize: width * 0.05,
                initialRating: widget.model.rating.rate,
                minRating: 0.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    rating = widget.model.rating.rate;
                  });
                },
              ),
              Text(
                '${widget.model.rating.rate} Rating',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.043,
                    fontWeight: FontWeight.bold),
              ).pOnly(left: 6),
              SizedBox(width: width * 0.24,),
              IconButton(
                onPressed: () {},
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    size: width * 0.1,
                  ),
                ),
              ),
            ],
          ).px(8),
          const Text(
            'Description',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ).py12().px8(),
           Text(
            widget.model.description,
            style: TextStyle(fontSize: width * 0.05),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ).px8(),
          Container(
            color: Vx.gray50,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.model.price}',
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.67,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ).px8(),
          ).pOnly(top: 10),
        ],
      ).p(8),
    );
  }
}
