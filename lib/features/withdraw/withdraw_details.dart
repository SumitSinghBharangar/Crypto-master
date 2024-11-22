import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/transection_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WithdrawDetailsScreen extends StatefulWidget {
  String taxid;
  String date;

  String coinName;
  String networkFee;
  String withDrawAmount;

  String network;
  String coinString;
  String address;
  WithdrawDetailsScreen({
    super.key,
    required this.networkFee,
    required this.coinString,
    required this.withDrawAmount,
    required this.date,
    required this.network,
    required this.address,
    required this.coinName,
    required this.taxid,
  });

  @override
  State<WithdrawDetailsScreen> createState() => _WithdrawDetailsScreen();
}

class _WithdrawDetailsScreen extends State<WithdrawDetailsScreen> {
  TransectionModel? model;

  @override
  void initState() {
    // _fetchData();
    super.initState();
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
          "Withdraw Details",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              widget.withDrawAmount,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_sharp,
                color: Colors.green,
                size: 15,
              ),
              Text(
                " Completed",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const Center(
            child: Text(
              "Crypto transfered out of Binance. Please contact the\n recipient platform for your transection receipt.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              "Why hasn't my withdrawal arrived?",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0.2,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Network",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Address",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.address,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.copy,
                            size: 18,
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
                        "Txid",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              widget.taxid,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.copy,
                            size: 18,
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
                        "Amount",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "${widget.withDrawAmount} ",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${widget.coinString.toUpperCase()} ",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
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
                          // fontWeight: FontWeight.bold,
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
                          // fontWeight: FontWeight.bold,
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
                      flex: 1,
                      child: Text(
                        "Date",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.date,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Scam Report",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          )

          // GestureDetector(
          //   onTap: () async {
          //     _fetchAndAddTime();
          //     _decreaseStockValue(
          //       widget.coinString.toLowerCase(),
          //       double.parse(widget.withDrawAmount),
          //     );
          //     await cryptocurrencies.doc(widget.coinString).update({
          //       "Amount": widget.remaning,
          //     });

          //     TransectionModel tmodel = TransectionModel(
          //         Amount: widget.withDrawAmount,
          //         CoinCode: widget.coinString,
          //         CoinName: widget.coinName,
          //         Time: DateTime.now(),
          //         Type: "Withdraw");

          //     await transaction_history.doc().set(tmodel.toMap());

          //     // await FirebaseFirestore.instance
          //     //     .collection('withdraw_history')
          //     //     .doc("vj9tmh02uYS4cPreIaGp")
          //     //     .update(model.toMap());
          //     log("Data updated successfully");

          //     if (context.mounted) {
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute(
          //           builder: (context) => WithdrawScreen(
          //             withDrawAmount: widget.withDrawAmount,
          //             coinString: widget.coinString,
          //             time: _time.toString(),
          //             networkFee: '0.33',
          //             usAmount: widget.usAmount,
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       color: Colors.yellow,
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "Confirm",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
        ],
      ),
    );
  }
}
