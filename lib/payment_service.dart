import 'package:flutter/material.dart';
import 'package:quickai/payment_page.dart';

class PaymentServices extends StatefulWidget {
  const PaymentServices({super.key});

  @override
  State<PaymentServices> createState() => _PaymentServicesState();
}

class _PaymentServicesState extends State<PaymentServices> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'CONGRATS! YOU ARE JUST ONE STEP AWAY FROM MASTERING AI TOOLS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width < 600 ? 14.0 : 32.0,
            fontWeight: FontWeight.bold,
          ),
          maxLines: MediaQuery.of(context).size.width < 600 ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Additional line
                Text(
                  'Anyone from any field can attend this workshop.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 20.0 : 24.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  'Simply Pay ₹ 9 + GST and Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 28.0 : 34.0,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius:
                      MediaQuery.of(context).size.width < 600 ? 60.0 : 100.0,
                  backgroundImage: AssetImage('assets/quickai.png'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'QuickAI',
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 20.0 : 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 25.0),
                // Responsive TextFields
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? double.infinity
                      : 400.0,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name*',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? double.infinity
                      : 400.0,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? double.infinity
                      : 400.0,
                  child: TextField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number (WhatsApp Number)*',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Responsive ElevatedButton
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? double.infinity
                      : 400.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ),
                      );
                    },
                    child: Text('NEXT'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
