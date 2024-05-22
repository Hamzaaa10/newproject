
import 'package:auth/dashboard/favorite/controller/favorite_cubit.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:auth/dashboard/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/favorite_item_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final FavoriteCubit controller = context.read<FavoriteCubit>();
          return Scaffold(
            body: state is ProductStateLoading
                ? const CircularProgressIndicator()
                : state is ProductStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemCount: controller.products.length,
              itemBuilder: (_, int index) {
                return FavoriteItemWidget(productModel: controller.products[index], controler: controller,);
              },
            )
          );
        },
      ),
    );
  }
}
