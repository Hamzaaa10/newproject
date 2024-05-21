import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(ParentInitial());
  static final ParentCubit instance = ParentCubit();
  Map<String, dynamic> local = {};

  Future<void> loadLanguage() async {
    String s = await rootBundle.loadString('assets/lang/AR.json');
    local = json.decode(s);
    emit(ParentInitial());
  }

}



