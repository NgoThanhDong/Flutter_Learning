import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<int> {
  UserBloc() : super(0) {
    debugPrint('👤 UserBloc CREATED');
  }

  @override
  Future<void> close() {
    debugPrint('💀 UserBloc DISPOSED');
    return super.close();
  }
}
