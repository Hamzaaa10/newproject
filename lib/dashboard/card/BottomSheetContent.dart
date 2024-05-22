import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  final ProductModel productModel;
  final ProductCubit controller;

  BottomSheetContent({required this.productModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Container(
      height: 200,
      child: Column(
        children: [
          Text('اختر الكمية لـ ${productModel.name}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(CupertinoIcons.minus_circle),
                onPressed: () {
                  if (quantity > 1) {
                    quantity--;
                  }
                },
              ),
              Text('$quantity'),
              IconButton(
                icon: Icon(CupertinoIcons.plus_circle),
                onPressed: () {
                  quantity++;
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              controller.addItemToCart(productModel as int, quantity);
              Navigator.pop(context);
            },
            child: Text('أضف إلى السلة' ,style: Theme.of(context).textTheme.displayLarge,
),
          ),
        ],
      ),
    );
  }
}