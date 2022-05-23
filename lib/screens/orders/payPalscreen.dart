import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:vinsartisanmarket/components/tots.dart';
import 'package:vinsartisanmarket/screens/home/home_screen.dart';
import 'package:vinsartisanmarket/service/http_handeler/httpClient.dart';

class PayPalScreen extends StatefulWidget {
  final String orderid;
  const PayPalScreen({
    Key? key,
    required this.total,
    required this.orderid,
  }) : super(key: key);
  final double total;

  @override
  State<PayPalScreen> createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pay & Confirm"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => UsePaypal(
                    sandboxMode: true,
                    clientId:
                        "AVlmssJ8mal9ilnzAUa0z3Pt00gTjTa8l5iuHgkIgWdTtB7uLQ3SzIGctpY--lpxDtBHhYiKE49VpqzH",
                    secretKey:
                        "EOrfd5bzMfNAOiO4fPzSOcfJlnH2xwOnbRB_AhV0HP5lQnQASjQDqRypYqnLhsnNRQ1_hqlsZupVd2OY",
                    returnURL: "https://samplesite.com/return",
                    cancelURL: "https://samplesite.com/cancel",
                    transactions: [
                      {
                        "amount": {
                          "total": widget.total.toString(),
                          "currency": "USD",
                          "details": {
                            "subtotal": widget.total.toString(),
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        // "item_list": {
                        //   "items": [
                        //     {
                        //       "name": "A demo product",
                        //       "quantity": 1,
                        //       "price": '10.12',
                        //       "currency": "USD"
                        //     }
                        //   ],

                        //   // shipping address is not required though
                        //   // "shipping_address": {
                        //   //   "recipient_name": "Jane Foster",
                        //   //   "line1": "Travis County",
                        //   //   "line2": "",
                        //   //   "city": "Austin",
                        //   //   "country_code": "US",
                        //   //   "postal_code": "73301",
                        //   //   "phone": "+00000000",
                        //   //   "state": "Texas"
                        //   // },
                        // }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");

                      Customtost.commontost(
                          "Payment Successfull", Colors.green);
                      await httpClient.orderPaymentsUpdate(widget.orderid);
                      Customtost.commontost("Order updated", Colors.blueAccent);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayPalScreen(
                                    orderid: widget.orderid,
                                    total: widget.total,
                                  )));
                      Customtost.commontost(
                          "Payment Unsuccessfull", Colors.redAccent);
                    },
                    onCancel: (params) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayPalScreen(
                                    orderid: widget.orderid,
                                    total: widget.total,
                                  )));
                      print('cancelled: $params');
                    }),
              ),
            )
          },
          label: const Text("Pay & confirm"),
          icon: const Icon(Icons.payment_outlined),
        ),
        body: Center(
          child: Text(
            "Total : " + widget.total.toStringAsFixed(0) + "\$",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.06),
          ),
        ));
  }
}
