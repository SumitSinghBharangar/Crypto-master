import 'dart:math';

import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/transection_model.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
            height: 6,
          ),
          Center(
            child: Text(
              "- ${widget.withDrawAmount} ${widget.coinString}",
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
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
                color: Color(0xff35bb88),
                size: 18,
              ),
              Text(
                " Completed",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff35bb88),
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
                color: Color(0xff8b8c8e),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Center(
            child: Container(
              color: AppColors.primaryColor.withOpacity(0.1),
              child: const Text(
                "Why hasn't my withdrawal arrived?",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffb5a85d),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade100,
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
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Container(
                        color: AppColors.primaryColor.withOpacity(0.15),
                        child: Text(
                          widget.network,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xffb5a85d),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Address",
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              widget.address,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.6),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/icons/copy.jpg",
                            height: 20,
                            width: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Txid",
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Off-Chain Transfer",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(.6),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    generate12Digits(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(.6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/icons/copy.jpg",
                            height: 20,
                            width: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Amount",
                        style: TextStyle(color: Color(0xff8b8c8e)),
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
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.6),
                              ),
                            ),
                          ),
                          Text(
                            "${widget.coinString.toUpperCase()} ",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Network Fee",
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        "${widget.networkFee} USDT",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Wallet",
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Funding Wallet",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 1,
                      child: Text(
                        "Date",
                        style: TextStyle(color: Color(0xff8b8c8e)),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: Text(
                        DateFormat("yyyy-MM-dd hh:mm:ss").format(
                          DateFormat("yyyy-MM-dd hh:mm:ss")
                              .parse(widget.date)
                              .add(
                                const Duration(
                                  minutes: 120,
                                ),
                              ),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xffebecf0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Scam Report",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xffebecf0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Save Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
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

String generate12Digits() {
  var rng = Random();
  String generatedNumber = '';
  for (int i = 0; i < 12; i++) {
    generatedNumber += (rng.nextInt(9) + 1).toString();
  }

  return generatedNumber;
}
