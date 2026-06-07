import 'package:flutter/material.dart';
import '../models/product.dart';
import '../state/app_state.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final AppState state;
  final VoidCallback onUpdate;

  const ProductDetailScreen({
    required this.product,
    required this.state,
    required this.onUpdate,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final isFav = widget.state.isInWishlist(widget.product);
    final inCart = widget.state.isInCart(widget.product);

    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.product.name,
            child: Image.network(
              widget.product.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "\$${widget.product.price}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    // 🛒 CART TOGGLE BUTTON
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              inCart ? Colors.red : Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            if (widget.state.isInCart(widget.product)) {
                              widget.state.removeFromCart(widget.product);
                            } else {
                              widget.state.addToCart(widget.product);
                            }
                          });

                          widget.onUpdate();
                        },
                        child: Text(
                          inCart
                              ? "Remove from Cart"
                              : "Add to Cart",
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // ❤️ WISHLIST
                    IconButton(
                      icon: Icon(
                        isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.state
                              .toggleWishlist(widget.product);
                        });

                        widget.onUpdate();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}