
import 'package:auth/dashboard/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//    ده يا احمد شكل ال card اللي هيتعرض

class customcard extends StatelessWidget {
   const customcard({super.key,required this.productModel});
 final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productModel.name?? 'XXX',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              productModel.desc?? 'XXX',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
