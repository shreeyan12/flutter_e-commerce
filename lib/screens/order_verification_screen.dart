import 'package:flutter/material.dart';
import '../state/app_state.dart';

class OrderVerificationScreen extends StatefulWidget {
  final AppState state;

  const OrderVerificationScreen({required this.state});

  @override
  State<OrderVerificationScreen> createState() =>
      _OrderVerificationScreenState();
}

class _OrderVerificationScreenState
    extends State<OrderVerificationScreen> {
  final TextEditingController codeController = TextEditingController();

  final String correctCode = "1234";
  bool error = false;

  void verify() {
    if (codeController.text == correctCode) {
      widget.state.cart.clear();

      Navigator.pop(context, true); // ✅ SUCCESS RETURN
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify Order")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Enter OTP (1234)",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: error ? "Invalid Code" : null,
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: verify,
                child: Text("Verify & Place Order"),
              ),
            )
          ],
        ),
      ),
    );
  }
}