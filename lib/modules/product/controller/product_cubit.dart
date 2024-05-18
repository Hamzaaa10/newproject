import 'package:auth/modules/product/model/entity/product_model';
import 'package:auth/modules/product/model/rebo/database_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();

  ProductCubit() : super(ProductStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DataBaseproductRebo repo = DataBaseproductRebo();

  Future<void> init() async {
    emit(ProductStateLoading());
    await repo.initDB();

    products = await repo.fetchProducts();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    emit(ProductStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(ProductStateLoaded());
  }
}