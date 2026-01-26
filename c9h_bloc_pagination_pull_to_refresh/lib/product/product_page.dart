import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(LoadFirstPage());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<ProductBloc>().add(LoadNextPage());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return IconButton(
                icon: state.isRefreshing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh),
                onPressed: state.isRefreshing
                    ? null
                    : () {
                        context.read<ProductBloc>().add(RefreshProducts());
                      },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductBloc>().add(RefreshProducts());
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: state.products.length + (state.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final product = state.products[index];
                return ListTile(title: Text(product.name));
              },
            ),
          );
        },
      ),
    );
  }
}
