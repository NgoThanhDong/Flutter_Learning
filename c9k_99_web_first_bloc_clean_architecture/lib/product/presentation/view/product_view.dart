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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Lắng nghe sự kiện scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // RẤT QUAN TRỌNG cho Web
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Nếu chưa tới cuối thì thôi
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    // Kéo gần cuối danh sách
    if (current >= maxScroll - 100) {
      context.read<ProductBloc>().add(LoadMoreEvent());
    }
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
              context.read<ProductBloc>().add(RefreshEvent());
            },
          ),
        ],
      ),

      // BlocBuilder lắng nghe state thay đổi
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          // 1️⃣ LOADING
          if (state.uxState == UXState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 2️⃣ ERROR
          if (state.uxState == UXState.error) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Something went wrong 😢'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(RetryLoad());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // 3️⃣ EMPTY
          if (state.uxState == UXState.empty) {
            return const Center(
              child: Text('No products'),
            );
          }

          // 4️⃣ SUCCESS (case chính)
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductBloc>().add(RefreshEvent());
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.products.length + 1,
              itemBuilder: (context, index) {
                // Item cuối → loading more
                if (index == state.products.length) {
                  if (state.isLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }

                final product = state.products[index];

                return ListTile(
                  title: Text(product.name),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
