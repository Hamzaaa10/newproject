import 'dart:developer';
import 'dart:typed_data';

import 'package:auth/dashboard/favorite/controller/favorite_cubit.dart';
import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//    ده يا احمد شكل ال card اللي هيتعرض

class FavoriteItemWidget extends StatelessWidget {
  FavoriteItemWidget({required this.productModel, required this.controler});
  final ProductModel productModel;
  final FavoriteCubit controler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 0.2,
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(1, 5)),
            ]),
            child: Card(
              elevation: 6,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productModel.name!,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              if (productModel.favorite == 1) {
                                controler.addItemToFavorite(
                                    productModel.id ?? 0, 0);
                              } else {
                                controler.addItemToFavorite(
                                    productModel.id ?? 0, 1);
                              }
                            },
                            child: productModel.favorite == 1
                                ? const Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Color.fromARGB(255, 239, 29, 9),
                                  )
                                : const Icon(
                                    CupertinoIcons.heart,
                                    color: Color.fromARGB(255, 239, 29, 9),
                                  )),
                      ],
                    ),
                  
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            productModel.desc!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: productModel.favorite == 1
                              ? const Icon(
                                  CupertinoIcons.cart,
                                  color: Color.fromARGB(255, 20, 160, 254),
                                )
                              : const Icon(
                                  CupertinoIcons.cart,
                                  color: Color.fromARGB(255, 10, 147, 216),
                                ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
          Positioned(
              bottom: 70,
              left: 20,
              child: Image.memory(
                productModel.image ?? Uint8List(8),
                width: 150,
                height: 50,
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}
