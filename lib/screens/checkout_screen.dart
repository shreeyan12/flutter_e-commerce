import 'package:flutter/material.dart';
import '../state/app_state.dart';
import 'order_verification_screen.dart';



class CheckoutScreen extends StatefulWidget {
  final AppState state;

  const CheckoutScreen({required this.state});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController addressController = TextEditingController();

  bool orderPlaced = false;

  @override
  Widget build(BuildContext context) {
    final cart = widget.state.cart;

    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: orderPlaced
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle,
                        color: Colors.green, size: 80),
                    SizedBox(height: 10),
                    Text(
                      "Order Placed Successfully!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Address",
                      style: TextStyle(fontSize: 16)),

                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: "Enter your address",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("Items: ${cart.length}"),

                  SizedBox(height: 5),

                  Text(
                    "Total: \$${widget.state.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OrderVerificationScreen(
                              state: widget.state,
                            ),
                          ),
                        );

                        if (result == true) {
                          setState(() {
                            orderPlaced = true;
                          });
                        }
                      },
                      child: Text("Place Order"),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}