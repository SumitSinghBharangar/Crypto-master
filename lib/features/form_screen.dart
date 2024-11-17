import 'dart:math';

import 'package:binance/common/app_colors.dart';
import 'package:binance/common/widgets/network_widget.dart';
import 'package:binance/features/withdraw/confirm_order_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  final String numString;
  final String coinString;

  const FormScreen({
    super.key,
    required this.numString,
    required this.coinString,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _fKey = GlobalKey<FormState>();
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _addressControlle = TextEditingController();

  final _node = FocusNode();
  late bool max;
  late String withdrawalAmount;

  double networkFee = 0.0;

  late double _usdAmount = 0.0;

  String? _time;

  @override
  void initState() {
    super.initState();
    withdrawalAmount = '0.0';
    max = true; // Set initial value from widget.numString
    // Sync controller with withdrawalAmount

    _node.addListener(() {
      if (_node.hasFocus) {
        primaryFocus?.unfocus();
      }
    });
  }

  _fetchAndAddTime() {
    DateTime now = DateTime.now(); // Fetch the current time
    DateTime updatedTime = now.add(const Duration(hours: 2));
    String formattedTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedTime);
    setState(() {
      _time = formattedTime;
    });
  }

  _convertToUsd(double value, String numString) {
    if (numString.toUpperCase() == "BTC") {
      setState(() {
        _usdAmount = (value * 90900.08);
      });
    } else if (numString.toUpperCase() == "BCH") {
      setState(() {
        _usdAmount = (value * 430.74);
      });
    } else if (numString.toUpperCase() == "DOGE") {
      setState(() {
        _usdAmount = (value * 0.37);
      });
    } else if (numString.toUpperCase() == "ETH") {
      setState(() {
        _usdAmount = (value * 3079.83);
      });
    } else if (numString.toUpperCase() == "USDT") {
      setState(() {
        _usdAmount = (value * 1.0);
      });
    } else if (numString.toUpperCase() == "LTC") {
      setState(() {
        _usdAmount = (value * 83.24);
      });
    } else {
      return null;
    }
  }

  @override
  void didUpdateWidget(FormScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update withdrawalAmount and controller when widget.numString changes
    if (widget.numString != oldWidget.numString) {
      setState(() {
        withdrawalAmount = widget.numString;
        _controller.text = withdrawalAmount; // Sync with controller
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Send ${widget.coinString}",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/contact.png',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/report.png',
              width: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _fKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _field(
                "Address",
                "Long press to paste",
                controller: _addressControlle,
                SizedBox(
                  width: 63,
                  child: Row(
                    children: [
                      Image.asset('assets/user.png', height: 30),
                      Image.asset('assets/qr-2.png', height: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Network",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _editingController,
                keyboardType: TextInputType.none,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.paddingOf(context).bottom + 10,
                          right: 20,
                          left: 20,
                          top: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Choose Network",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...List.generate(
                                      networks.length,
                                      (i) {
                                        return GestureDetector(
                                            onTap: () {
                                              networkFee =
                                                  double.tryParse(feeList[i]) ??
                                                      0.0;
                                              setState(() {
                                                _editingController.text =
                                                    networks[i];
                                              });

                                              Navigator.pop(context);
                                            },
                                            child: NetworkWidgetCard(
                                              networkName: networks[i],
                                              deposit: minimunWithdrawl[i],
                                              widthdrawl: feeList[i],
                                              arrivalTime: arrivalTime[i],
                                            ));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Image.asset('assets/net5.png'),
                          ],
                        ),
                      );
                    },
                  );
                  primaryFocus?.unfocus();
                },
                onTapOutside: (event) {
                  primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  hintText: "Automatically match the network",
                  fillColor: Colors.grey.withOpacity(.15),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: SizedBox(
                    width: 10,
                    child: Row(
                      children: [
                        const Spacer(),
                        Image.asset('assets/chevron.png', height: 20),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                visible: _editingController.text != "",
                child: const Text(
                  "The network you have selected in BSC.Please ensure that the withdrawal address supports the BNB Smart Chain network. You will potentially lose your assets if the chosen platform does not support refunds of wrongfully deposited assets.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "BSC Network Verification",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              max
                  ? _field(
                      "Withdrawal Amount",
                      "Maximum ${widget.numString}",
                      SizedBox(
                        width: 75,
                        child: Row(
                          children: [
                            Text(
                              widget.coinString,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  max = false;
                                  // Update withdrawal amount to max
                                  withdrawalAmount = widget.numString;
                                  _controller.text = withdrawalAmount;
                                  _convertToUsd(
                                    double.tryParse(_controller.text) ?? 0.0,
                                    widget.coinString,
                                  ); // Sync with controller
                                });
                              },
                              child: const Text(
                                "Max",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller: _controller,
                      onChanged: (text) {
                        // Update withdrawalAmount and sync with controller
                        setState(() {
                          withdrawalAmount = text;
                          _controller.text = text;
                          _convertToUsd(
                            double.tryParse(text) ?? 0.0,
                            widget.coinString,
                          );
                        });
                      },
                    )
                  : _field(
                      "Withdrawal Amount",
                      " ",
                      SizedBox(
                        width: 75,
                        child: Row(
                          children: [
                            Text(
                              widget.coinString,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  max = true;
                                  withdrawalAmount = "0.00"; // Reset to 0.00
                                  _controller.text =
                                      withdrawalAmount; // Sync with controller
                                });
                              },
                              child: const Text(
                                "Max",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller: _controller,
                      onChanged: (text) {
                        // Update withdrawalAmount and sync with controller
                        setState(() {
                          withdrawalAmount = text;
                          _controller.text = text;
                          _convertToUsd(
                              double.tryParse(_controller.text) ?? 0.0,
                              widget.coinString); // Keep controller updated
                        });
                      },
                    ),
              Row(
                children: [
                  Text(
                    " = ${_usdAmount.toStringAsFixed(2)} USD",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Available",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _controller.text.isEmpty
                        ? "${widget.numString} ${widget.coinString}"
                        : "${(double.tryParse(widget.numString) ?? 0.0) - (double.tryParse(withdrawalAmount) ?? 0.0)} ${widget.coinString}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Contact Information ***97955  ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.info,
                    size: 17,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "Do not withdrawal directly to a crowdfund or ICU. We will not credit your account with tokens from that sale.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          "Do not transact with Sanctioned Entities ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Learn more",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Receive amount",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$withdrawalAmount ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.coinString,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Network fee ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                networkFee.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: AppColors.onSurface,
                                ),
                              ),
                              Text(
                                " ${widget.coinString}",
                                style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: AppColors.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (double.parse(withdrawalAmount) <= 0) {
                        Fluttertoast.showToast(
                            msg: "Please Enter the amount to withdraw");

                        return;
                      } else if (_addressControlle.text.length < 3 ||
                          _editingController.text == "" ||
                          _controller.text == "") {
                        Fluttertoast.showToast(msg: "fill the credentials");
                        return;
                      } else {
                        if (_fKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ConfirmOrderScreen(
                                coinString: widget.coinString,
                                withDrawAmount: withdrawalAmount,
                                network: _editingController.text,
                                address: _addressControlle.text,
                                usAmount: _usdAmount.toString(),
                                networkFee: networkFee.toString(),
                              ),
                            ),
                          );
                        }

                        // _decreaseStockValue(
                        //   widget.coinString.toLowerCase(),
                        //   double.parse(withdrawalAmount),
                        // );

                        // _fetchAndAddTime();

                        // Navigator.pushReplacement(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => WithdrawScreen(
                        //       time: _time.toString(),
                        //       withDrawAmount: withdrawalAmount,
                        //       coinString: widget.coinString,
                        //     ),
                        //   ),
                        // );
                      }
                    },
                    child: const Text(
                      "Withdraw",
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom + 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    String title,
    String hint,
    Widget suffix, {
    TextEditingController? controller,
    ValueChanged<String>? onChanged, // Add onChanged callback
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          onChanged: onChanged, // Add onChanged to the TextFormField
          onTapOutside: (event) {
            primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            hintText: hint,
            fillColor: Colors.grey.withOpacity(.15),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}

List<String> networks = [
  "BNB Smart Chain (BEP20)",
  "opBNB",
  "Tron (TRC20)",
  "toncoin",
  "Polygon POS",
  "Ethereum (ERC20)",
  "Arbitrum One",
  "Solana",
  "AVAX C-Chain",
  "Optimism",
  "NEAR Protocol",
  "EOS",
];
List<String> feeList = [
  "Fee 0 USDT",
  "Fee 0 USDT",
  r"Fee 1 USDT ( =$1.00)",
  r"Fee 0.3 USDT ( =$0.30000000)",
  r"Fee 0.08 USDT ( =$0.08000000)",
  r"Fee 6 USDT ( =$6.00)",
  r"Fee 0.16 USDT ( =$0.16000000)",
  r"Fee 1.8 USDT ( =$1.80)",
  r"Fee 0.14 USDT ( =$1.14000000)",
  r"Fee 0.031 USDT ( =$1.3100000)",
  r"Fee 0.2 USDT ( =$0.20000000)",
  r"Fee 1 USDT ( =$1.0)",
];

List<String> minimunWithdrawl = [
  "Minimum withdrawal 10 USDT",
  "Minimum withdrawal 20 USDT",
  "Minimum withdrawal 10 USDT",
  "Minimum withdrawal 5 USDT",
  "Minimum withdrawal 4 USDT",
  "Minimum withdrawal 16 USDT",
  "Minimum withdrawal 0.32 USDT",
  "Minimum withdrawal 0.30 USDT",
  "Minimum withdrawal 0.28 USDT",
  "Minimum withdrawal 0.062 USDT",
  "Minimum withdrawal 10 USDT",
  "Minimum withdrawal 10 USDT",
];

List<String> arrivalTime = [
  "Arrival time = 5 mins",
  "Arrival time = 2 mins",
  "Arrival time = 2 mins",
  "",
  "Arrival time = 8 mins",
  "Arrival time = 4 mins",
  "Arrival time = 3 mins",
  "Arrival time = 4 mins",
  "Arrival time = 2 mins",
  "Arrival time = 2 mins",
  "Arrival time = 2 mins",
  "Arrival time = 2 mins",
];

List<String> minimumDeposit = [
  ">0.01",
  ">0.00000002",
  ">0.00000002",
  ">0.00000001",
];
