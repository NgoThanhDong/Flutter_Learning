import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ScrollController _scrollController = ScrollController();
  double _savedOffset = 0;

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
              final isRefreshing =
                  state.status == ProductStatus.refreshing;

              return IconButton(
                icon: isRefreshing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh),
                onPressed: isRefreshing
                    ? null
                    : () {
                        _savedOffset = _scrollController.offset;
                        context
                            .read<ProductBloc>()
                            .add(RefreshProducts());
                      },
              );
            },
          ),
        ],
      ),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.status == ProductStatus.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollController.jumpTo(_savedOffset);
            });
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.status == ProductStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == ProductStatus.error) {
              return Center(child: Text(state.error!));
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(title: Text(product.name));
              },
            );
          },
        ),
      ),
    );
  }
}