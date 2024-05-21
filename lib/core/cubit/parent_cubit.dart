import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:auth/core/cubit/parent_state.dart';
part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ParentCubit() : super(ParentInitial());
  Map<String, dynamic> local = {};

  Future<void> loadLanguage() async {
    String s = await rootBundle.loadString('assets/lang/AR.json');
    local = json.decode(s);
    emit(ParentInitial());
  }
}
