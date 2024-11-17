import 'package:binance/features/portfolio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  String usAmount;
  String networkFee;
  String withDrawAmount;
  String coinString;
  String time;
  WithdrawScreen({
    super.key,
    required this.withDrawAmount,
    required this.coinString,
    required this.time,
    required this.networkFee,
    required this.usAmount,
  });

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String? _time;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(context,
              //     CupertinoPageRoute(builder: (context) => const PortFolio()));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                "assets/glassprogress.png",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Withdraw Processing",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${widget.withDrawAmount} ${widget.coinString}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Estimated completion time ${widget.time} you will receive and email once withdrawal is completed.view history for the latest updates.",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
            )
          ],
        ),
      ),
    );
  }
}
