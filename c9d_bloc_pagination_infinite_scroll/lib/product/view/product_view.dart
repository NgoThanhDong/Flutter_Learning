import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 100) {
        context.read<ProductBloc>().add(LoadMore());
      }
    });
  }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loading &&
            state.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == ProductStatus.error &&
            state.products.isEmpty) {
          return Center(child: Text(state.error ?? 'Error'));
        }
        return ListView.builder(
          controller: _controller,
          itemCount: state.hasReachedEnd
              ? state.products.length
              : state.products.length + 1,
          itemBuilder: (context, index) {
            if (index >= state.products.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return ListTile(
              title: Text(state.products[index]),
            );
          },
        );
      },
    );
  }
}