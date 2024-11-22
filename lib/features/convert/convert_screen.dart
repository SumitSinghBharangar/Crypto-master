import 'dart:developer';

import 'package:binance/common/app_collection.dart';
import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/transection_model.dart';
import 'package:binance/features/form_screen.dart';
import 'package:binance/features/withdraw/withdraw_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/widgets/network_widget.dart';

class ConvertScreen extends StatefulWidget {
  final String name;

  final String image;
  final String amount;
  final String dollerAmount;

  const ConvertScreen({
    super.key,
    required this.image,
    required this.name,
    required this.amount,
    required this.dollerAmount,
  });

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  List<PaymentMethodModel> methods = [
    PaymentMethodModel(
        title: 'Withdraw',
        subtitle: 'Send to a known crypto address via cryptp wallet',
        icon: 'assets/images/withdraw.png'),
    PaymentMethodModel(
        title: 'Sell Crypto',
        subtitle: 'Sell crypto to your financial account',
        icon: 'assets/images/sell.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/icons/${widget.image}.png",
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.visibility,
                            size: 16,
                            color: Colors.black.withOpacity(.4),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.amount,
                            style: const TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "=\$${widget.dollerAmount}",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Available",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                widget.amount,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 60),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Unavailable",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "0.0",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black, // Text color
                                side: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1), // Grey border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/convert.png",
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Convert")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black, // Text color
                                side: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1), // Grey border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/earn.jpg",
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Earn")
                                ],
                              ),
                            ),
                          ),

                          // _buildActionButton('Convert', 'assets/convert.png'),
                          // const SizedBox(width: 12),
                          // _buildActionButton('Earn', 'assets/images/income.png'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "History",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildHistoryButton("All", 1),
                            _buildHistoryButton("Deposit and Withdraw", 2),
                            _buildHistoryButton("Buy & Sell", 3),
                            _buildHistoryButton("Convert", 4),
                            _buildHistoryButton("Earn", 5),
                            _buildHistoryButton("Distribution", 6),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .4,
                        child: SingleChildScrollView(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: transaction_history
                                .where("CoinCode", isEqualTo: widget.image)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: Image.asset("assets/loading.gif"));
                              } else if (snapshot.hasError) {
                                return Center(child: SizedBox());
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return const SizedBox();
                              }
                              final item = snapshot.data!.docs;

                              return ListView.separated(
                                shrinkWrap: true, // Resolves viewport issue
                                physics:
                                    const NeverScrollableScrollPhysics(), // Prevents scrolling
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: item.length,
                                itemBuilder: (context, index) {
                                  final doc = item[index];
                                  TransectionModel model =
                                      TransectionModel.fromMap(
                                          doc.data() as Map<String, dynamic>);
                                  String dt = DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(model.Time);

                                  String txid = transaction_history.doc().id;

                                  String dtt = DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(model.Time);

                                  return InkWell(
                                    onTap: () {
                                      log("tapped");
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              WithdrawDetailsScreen(
                                            networkFee: model.NetworkFee,
                                            coinString: model.CoinCode,
                                            withDrawAmount: model.Amount,
                                            network: model.Network,
                                            address: model.Address,
                                            coinName: model.CoinName,
                                            taxid: txid,
                                            date: dtt,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model.Type,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Crypto",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    dt,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                model.Type == "Withdraw"
                                                    ? "-${model.Amount}"
                                                    : "+${model.Amount}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: model.Type ==
                                                          "Withdraw"
                                                      ? const Color.fromARGB(
                                                          255, 248, 20, 4)
                                                      : Colors.green,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const SizedBox(width: 5),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.2,
                                            color: Colors.grey.withOpacity(0.8),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FilledButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.paddingOf(context)
                                                .bottom +
                                            10,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: 50,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "Select Method",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (_) =>
                                                          FormScreen(
                                                              numString:
                                                                  widget.amount,
                                                              coinString: widget
                                                                  .image)));
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    width: 1),
                                                color: Colors.white,
                                              ),
                                              padding: const EdgeInsets.all(7),
                                              child: const ListTile(
                                                leading: Image(
                                                    width: 40,
                                                    image: AssetImage(
                                                        'assets/withdraw.jpg')),
                                                title: Text(
                                                  'Withdraw',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'Send to a known crypto address via cryptp wallet',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.4),
                                                  width: 1),
                                              color: Colors.white,
                                            ),
                                            padding: const EdgeInsets.all(7),
                                            child: const ListTile(
                                              leading: Image(
                                                  width: 40,
                                                  image: AssetImage(
                                                      'assets/sell.jpg')),
                                              title: Text(
                                                'Sell Crypto',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Sell crypto to your financial account',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                primaryFocus?.unfocus();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    Colors.grey.shade300.withOpacity(0.8),
                                foregroundColor: Colors.black, // Text color
                                // side: BorderSide(
                                //     color: Colors.grey.shade400,
                                //     width: 1), // Grey border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Center(
                                child: Text("Take Out"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.black, // Text color
                                // side: BorderSide(
                                //     color: Colors.grey.shade400,
                                //     width: 1), // Grey border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add Funds",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryButton(String label, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == 1 ? Colors.grey.shade100 : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodModel {
  final String title;
  final String subtitle;
  final String icon;

  PaymentMethodModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
