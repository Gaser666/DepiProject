import 'package:depi_project/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  CustomCard({required this.product, super.key});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 14),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price.toString()}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                            isFavorite = !isFavorite;
                          },
                          icon: isFavorite
                              ? Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -70,
            child: Image.network(
              widget.product.img,
              height: 120,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
