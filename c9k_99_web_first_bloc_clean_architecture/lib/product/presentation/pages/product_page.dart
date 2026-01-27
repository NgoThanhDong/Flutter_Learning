import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../bloc/product_event.dart';
import '../view/product_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createProductBloc()..add(LoadInitial()),
      child: const ProductView(),
    );
  }
}
