import 'dart:developer';
import 'dart:typed_data';

import 'package:auth/dashboard/card/BottomSheetContent.dart';
import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//    ده يا احمد شكل ال card اللي هيتعرض

class customcard extends StatelessWidget {
  customcard({required this.productModel, required this.controller});
  final ProductModel productModel;
  final ProductCubit controller;

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
                         style: Theme.of(context).textTheme.displayLarge
                        ),
                        InkWell(
                            onTap: () {
                              if (productModel.favorite == 1) {
                                controller.addItemToFavorite(
                                    productModel.id ?? 0, 0);
                              } else {
                                controller.addItemToFavorite(
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
                            style: Theme.of(context).textTheme.displayLarge
                          ),
                        ),
                        InkWell(
                          onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetContent(
                                  productModel: productModel,
                                  controller: controller);
                            },
                          );
                        },
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
