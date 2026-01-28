import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<int> {
  OrderBloc() : super(0) {
    debugPrint('📦 OrderBloc CREATED');
  }

  @override
  Future<void> close() {
    debugPrint('💀 OrderBloc DISPOSED');
    return super.close();
  }
}
