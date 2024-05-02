import 'package:auth/models/bordingmodel.dart';
import 'package:auth/modules/users/models/entity/usermodel.dart';

abstract class parentRebo {
  Future<void> insert({required String name, String? address});
  Future<List<UserModel>> fetch();
  Future<void> delete({required int id});
}
