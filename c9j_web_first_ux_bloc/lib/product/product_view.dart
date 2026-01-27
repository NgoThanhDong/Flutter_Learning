// 7️⃣ product_view.dart – UX THẬT

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

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
      if (_controller.position.pixels >
          _controller.position.maxScrollExtent - 200) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductBloc>().add(RefreshProducts());
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.uxState == UXState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.uxState == UXState.error) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProductBloc>().add(RetryLoad());
                },
                child: const Text('Retry'),
              ),
            );
          }

          if (state.uxState == UXState.empty) {
            return const Center(child: Text('No data'));
          }

          return ListView.builder(
            controller: _controller,
            itemCount: state.products.length +
                (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.products.length) {
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
      ),
    );
  }
}
