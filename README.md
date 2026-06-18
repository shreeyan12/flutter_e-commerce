# flutter_store

# 🛍️ Flutter E-Commerce App
 
A fully-featured mobile e-commerce application built with Flutter, featuring a clean multi-screen architecture, provider-based state management, and a polished shopping experience

## ✨ Features
 
- 🏠 **Home Screen** — Browsable product catalog with category filtering and search
- 🔍 **Product Detail** — Rich product view with images, description, and add-to-cart
- 🛒 **Cart Management** — Real-time cart with quantity control and item removal
- ✅ **Checkout Flow** — Streamlined checkout screen with order summary
- 📦 **Order Verification** — Post-purchase confirmation and order tracking screen
- 🔎 **Search** — Live search bar with instant product filtering
- 🏷️ **Category Chips** — Quick-filter navigation by product category
- 🔔 **Cart Badge** — Live cart item count displayed in the app bar

 ## 🗂️ Project Structure
 
```
lib/
├── data/
│   └── product_data.dart        # Static/mock product dataset
│
├── models/
│   ├── cart_item.dart           # CartItem model
│   └── product.dart             # Product model
│
├── screens/
│   ├── home_screen.dart         # Main product listing screen
│   ├── product_detail_screen.dart  # Individual product view
│   ├── cart_screen.dart         # Shopping cart screen
│   ├── checkout_screen.dart     # Checkout & payment screen
│   └── order_verification_screen.dart  # Order confirmation screen
│
├── state/
│   └── app_state.dart           # Global state via Provider
│
├── widgets/
│   ├── cart_badge.dart          # Animated cart icon with item count
│   ├── category_chips.dart      # Horizontal category filter chips
│   ├── product_card.dart        # Reusable product grid card
│   └── search_bar.dart          # Search input widget
│
└── main.dart                    # App entry point & route configuration

🚀 Getting Started
 
Prerequisites 
- [Flutter SDK] `>=3.0.0`
- Dart `>=3.0.0`
Installation
 
bash
1. Clone the repository
git clone https://github.com/your-username/flutter-ecommerce-app.git
 
2. Navigate into the project
cd flutter-ecommerce-app
 
3. Install dependencies
flutter pub get
 
4. Run the app
flutter run
```

🗺️ Roadmap
 
The following features are currently in progress or planned for upcoming releases:
 
- [ ] **User Registration & Login** — Email/password authentication with form validation
- [ ] **User Profile Screen** — View and edit account details (name, email, avatar)
- [ ] **Order History** — Per-account history of past orders with status tracking
- [ ] **Wishlist** — Save products for later across sessions

Built with ❤️ using Flutter
