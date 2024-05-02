
import 'package:auth/dashboard/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//    ده يا احمد شكل ال card اللي هيتعرض

class customcard extends StatelessWidget {
   const customcard({super.key,required this.productModel});
 final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      
      children: [
        
        
        
        Container(
          decoration: BoxDecoration(
              
              boxShadow: [
                BoxShadow(
                    blurRadius: 0.2,
                    color: Colors.grey.withOpacity(0.1),
                    offset:const Offset(1, 5)),
              ]),
          
          child:  Card(
            elevation: 6,
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.title??'no name',
                    style:const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.desc??"no desc",
                          style:
                             const TextStyle(color: Colors.black, fontSize: 20)),
                     const Icon(
                        CupertinoIcons.heart,
                        color: Colors.red,
                      )
                    ],
                  )
                ]),
          ),
        ),
        // لو عملت الصوره اللغي comment
        
      // Positioned(bottom:70 ,left: 40,
      //    child: Image.network(product.image,width: 150,height: 80,))
      ],
        
    );
  }
}