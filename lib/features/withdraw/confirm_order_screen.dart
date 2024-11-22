import 'dart:developer';

import 'package:binance/common/app_collection.dart';

import 'package:binance/common/models/transection_model.dart';

import 'package:binance/features/withdraw/withdraw_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmOrderScreen extends StatefulWidget {
  String remaning;
  String coinName;
  String networkFee;
  String withDrawAmount;
  String usAmount;
  String network;
  String coinString;
  String address;
  ConfirmOrderScreen({
    super.key,
    required this.remaning,
    required this.networkFee,
    required this.coinString,
    required this.usAmount,
    required this.withDrawAmount,
    required this.network,
    required this.address,
    required this.coinName,
  });

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  String? _time;

  _fetchAndAddTime() {
    DateTime now = DateTime.now(); // Fetch the current time
    DateTime updatedTime = now.add(const Duration(hours: 2));
    String formattedTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedTime);
    setState(() {
      _time = formattedTime.toString();
    });
  }

  _decreaseStockValue(String coinKey, num decreaseBy) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await FirebaseFirestore.instance
              .collection('cryptocurrencies')
              .doc('CsVGQn2SXRbWyXGsUb6c')
              .get();

      // Atomically decrease the field value
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data()!;
        num currentStock = num.tryParse(data[coinKey]?.toString() ?? '0') ?? 0;
        num newStockValue = currentStock - decreaseBy;
        if (newStockValue < 0) newStockValue = 0;
        await FirebaseFirestore.instance
            .collection('cryptocurrencies')
            .doc('CsVGQn2SXRbWyXGsUb6c')
            .update(
          {
            coinKey: newStockValue.toString(),
          },
        );
        log("Stock value for $coinKey decreased successfully!");
      } else {
        print("Document does not exist or no data available.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Confirm Order",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Receive amount",
              style:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.withDrawAmount} ",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.coinString.toUpperCase()} ",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    r"= $",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "${widget.usAmount}",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Network",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.network,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Address",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.address,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    "Withdrawal Amount",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.withDrawAmount} ",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.coinString.toUpperCase()} ",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    "Network Fee",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Spacer(),
                Flexible(
                  child: Text(
                    "${widget.networkFee} ${widget.coinString}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Wallet",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Funding Wallet",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300.withOpacity(0.5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Ensure that the address is correct and on the same network.\nTransactions can not be cancelled.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                _fetchAndAddTime();
                _decreaseStockValue(
                  widget.coinString.toLowerCase(),
                  double.parse(widget.withDrawAmount),
                );
                await cryptocurrencies.doc(widget.coinString).update({
                  "Amount": widget.remaning,
                });

                TransectionModel tmodel = TransectionModel(
                  Network: widget.network,
                  Amount: widget.withDrawAmount,
                  CoinCode: widget.coinString,
                  CoinName: widget.coinName,
                  Time: DateTime.now(),
                  Type: "Withdraw",
                  NetworkFee: widget.networkFee,
                  Wallet: "Funding Wallet",
                  Address: widget.address,
                );

                await transaction_history.doc().set(tmodel.toMap());

                // await FirebaseFirestore.instance
                //     .collection('withdraw_history')
                //     .doc("vj9tmh02uYS4cPreIaGp")
                //     .update(model.toMap());
                log("Data updated successfully");

                if (context.mounted) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => WithdrawScreen(
                        withDrawAmount: widget.withDrawAmount,
                        coinString: widget.coinString,
                        time: _time.toString(),
                        networkFee: '0.33',
                        usAmount: widget.usAmount,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow,
                ),
                child: const Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
