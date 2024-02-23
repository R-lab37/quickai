import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  double orderSummary = 9.0;
  double discount = -919.80;
  double gst = 1.65;
  double totalPayable = 10.79;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle successful payment
    print("Payment Successful: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print("Payment Failed: ${response.code.toString()} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet Selected: ${response.walletName}");
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_test_hCJQJUDrkLEDyu',
      'amount': (totalPayable * 100).toInt(), // amount in paise
      'name': 'QuikAI',
      'description': 'Payment for QuikAi Course ',
      'prefill': {
        'contact': '+91 7999968538',
        'email': 'rishikarya37@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuikAI Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary: Rs $orderSummary'),
            Text('Discount: Rs ${-discount}'),
            Text('GST @18%: Rs $gst'),
            Text('Total Payable: Rs $totalPayable'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openCheckout();
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
