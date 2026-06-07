import '../models/product.dart';
import '../models/cart_item.dart';

class AppState {
  List<CartItem> cart = [];
  List<Product> wishlist = [];

  // 🛒 ADD TO CART (INCREASE QUANTITY)
  void addToCart(Product product) {
    final index = cart.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index >= 0) {
      cart[index].quantity += 1;
    } else {
      cart.add(CartItem(product: product, quantity: 1));
    }
  }

  // ➖ DECREASE QUANTITY OR REMOVE ITEM
  void decreaseQty(Product product) {
    final index = cart.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index >= 0) {
      if (cart[index].quantity > 1) {
        cart[index].quantity -= 1;
      } else {
        cart.removeAt(index);
      }
    }
  }

  // 🗑️ REMOVE ENTIRE ITEM
  void removeFromCart(Product product) {
    cart.removeWhere(
      (item) => item.product.name == product.name,
    );
  }

  // ❤️ WISHLIST
  void toggleWishlist(Product product) {
    final exists = wishlist.any((p) => p.name == product.name);

    if (exists) {
      wishlist.removeWhere((p) => p.name == product.name);
    } else {
      wishlist.add(product);
    }
  }

  bool isInWishlist(Product product) {
    return wishlist.any((p) => p.name == product.name);
  }

  // 💰 TOTAL PRICE
  double get totalPrice {
    return cart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  bool isInCart(Product product) {
    return cart.any((item) => item.product.name == product.name);
  }
}