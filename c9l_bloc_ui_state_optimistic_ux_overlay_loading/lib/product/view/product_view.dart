import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        Widget content;

        switch (state.status) {
          case UXStatus.loading:
            content = const Center(child: CircularProgressIndicator());
            break;

          case UXStatus.error:
            content = const Center(child: Text('Error'));
            break;

          case UXStatus.empty:
            content = const Center(child: Text('Empty'));
            break;

          case UXStatus.success:
            content = ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, i) =>
                  ListTile(title: Text(state.products[i].name)),
            );
            break;

          default:
            content = const SizedBox();
        }

        return Stack(
          children: [
            content,
            if (state.isOverlayLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.2),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
