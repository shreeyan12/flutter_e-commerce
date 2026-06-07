import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chips.dart';
import '../widgets/cart_badge.dart';
import '../state/app_state.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppState state = AppState();

  List<Product> filteredProducts = products;
  String selectedCategory = "All";
  String searchQuery = "";

  void applyFilters() {
    setState(() {
      filteredProducts = products.where((p) {
        final matchCategory =
            selectedCategory == "All" || p.category == selectedCategory;

        final matchSearch =
            p.name.toLowerCase().contains(searchQuery.toLowerCase());

        return matchCategory && matchSearch;
      }).toList();
    });
  }

  List<String> get categories {
    return ["All", ...{...products.map((p) => p.category)}];
  }

  int getCrossAxisCount(double width) {
    if (width > 1200) return 5;
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = getCrossAxisCount(width);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [
          CartBadge(
            count: state.cart.length,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(state: state),
                ),
              ).then((_) => setState(() {}));
            },
          )
        ],
      ),

      body: Column(
        children: [
          SearchBarWidget(
            onChanged: (value) {
              searchQuery = value;
              applyFilters();
            },
          ),

          CategoryChips(
            categories: categories,
            selectedCategory: selectedCategory,
            onSelected: (cat) {
              selectedCategory = cat;
              applyFilters();
            },
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return ProductCard(
                  product: product,
                  isFav: state.isInWishlist(product),
                  onFavToggle: () {
                    setState(() {
                      state.toggleWishlist(product);
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                          product: product,
                          state: state,
                          onUpdate: () => setState(() {}),
                        ),
                      ),
                    );
                  },
                  onAddToCart: () {
                    setState(() {
                      state.addToCart(product);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}