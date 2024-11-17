import 'package:binance/features/form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkWidgetCard extends StatelessWidget {
  String networkName;
  String deposit;
  String arrivalTime;
  // String fee;
  // String networkFee;
  String widthdrawl;

  NetworkWidgetCard({
    super.key,
    required this.networkName,
    required this.widthdrawl,
    required this.deposit,
    required this.arrivalTime,
    // required this.fee,
    // required this.networkFee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            networkName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                deposit,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widthdrawl,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                arrivalTime,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
