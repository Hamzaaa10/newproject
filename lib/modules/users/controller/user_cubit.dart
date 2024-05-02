import 'dart:math';

import 'package:auth/modules/users/controller/userstate.dart';
import 'package:auth/modules/users/models/entity/usermodel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/modules/users/models/rebo/local_db_data.dart';
import 'package:sqflite/utils/utils.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(Userloading()) {
    init();
  }

  List<UserModel> users = [];
  init() async {
    emit(Userloading());

    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    // if (connectivityResult.contains(connectivityResult.mobile) ||
    //     connectivityResult.contains(connectivityResult.wifi)) {
    //   // users = await Firebaserepo
    // } else {
    //   users = await (await DataBaseUserRebo.instance).fetch();
    // }
    if (users.isEmpty) {
      emit(UserEmpty());
    } else {
      emit(Userloaded());
    }
  }
}
