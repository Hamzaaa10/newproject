
// import 'package:auth/dashboard/repos/firbase_repo.dart';
import 'package:auth/dashboard/repos/localdb.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(UserLoading());
  List product_list =[];
  DatabaseRepo repo = DatabaseRepo();
  Future<void> apper() async {
    emit(UserLoading());
     product_list = await repo.fetchProducts();
        
    // product_list = await firebase_repo.instance.getProducts();
    if (product_list.isEmpty) {
     
      emit(UserEmpty());
      

    } else {
        
      emit(UserLoaded());

    }
  }
  
}
