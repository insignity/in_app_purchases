import 'package:flutter/material.dart';
import 'package:purchase_tester/api/purchase_api.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.block,
                size: 200,
              ),
              Text(
                'You are on free plan',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: isLoading ? null : fetchOffers,
                      child: Text("See plans")))
            ],
          ),
        ),
      ),
    );
  }

  Future fetchOffers() async {
    final offerings = await PurchaseApi.fetchOffers();
    if (offerings.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No Plans Found')));
    } else {
      final offer = offerings.first;
      print('Offer: $offer');
    }
  }
}
