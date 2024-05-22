import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:auth/dashboard/repos/localdb.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';


part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(FavoriteStateLoading());
    await repo.initDB();

    products = await repo.fetchFavoriteProducts();
    if (products.isEmpty) {
      emit(FavoriteStateEmpty());
    } else {
      emit(FavoriteStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    await repo.updateFavorite(value, id);
    await init();
    await ProductCubit.instance.fetchProducts();
    emit(FavoriteStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(FavoriteStateLoaded());
  }
}
