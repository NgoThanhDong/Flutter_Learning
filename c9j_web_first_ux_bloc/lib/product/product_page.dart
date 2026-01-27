// 6️⃣ product_page.dart – DÂY NỐI NÃO & UI
// 🧒 “Page chỉ tạo Bloc, còn View lo hiển thị”

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_repository.dart';
import 'product_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductBloc(ProductRepository())..add(LoadInitial()),
      child: const ProductView(),
    );
  }
}
