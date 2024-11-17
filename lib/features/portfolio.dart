import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/coin_model.dart';
import 'package:binance/features/services/home_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'form_screen.dart';

class PortFolio extends StatefulWidget {
  const PortFolio({super.key});

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.paddingOf(context).top + 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Spacer(),
              Text(
                "Portfolio",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/report.png',
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Row(
                        children: [
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('info')
                                  .doc('info')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return Text(
                                  "\$${snapshot.data?['balance'] ?? 0} ", // Changed € to $
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                          const Icon(
                            Icons.info,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.grey.withOpacity(.2),
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Take Out",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Add Funds",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Image.asset('assets/graph.png'),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(.1),
                ),
                const SizedBox(height: 20),
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('transaction_history')
                      .doc("CsVGQn2SXRbWyXGsUb6c")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Center(child: Text('No data found.'));
                    }

                    // Fetching the values of 'amount' and 'type'
                    var amount = snapshot.data!['amount'];
                    var type = snapshot.data!['currency'] ?? 'Unknown';

                    // Check if amount is null
                    if (amount == null) {
                      return SizedBox(); // Return an empty widget when amount is null
                    }

                    // Display the widget when amount is not null
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Replace with AppColors.onSurface
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Crypto deposited $amount $type",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Complete",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('withdraw_history')
                      .doc("vj9tmh02uYS4cPreIaGp")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Center(child: Text('No data found.'));
                    }

                    // Fetching the values of 'amount' and 'type'
                    var amount = snapshot.data!['amount'];
                    var type = snapshot.data!['type'] ?? 'Unknown';

                    // Check if amount is null
                    if (amount == null) {
                      return SizedBox(); // Return an empty widget when amount is null
                    }

                    // Display the widget when amount is not null
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Replace with AppColors.onSurface
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Crypto withdraw $amount $type",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Complete",
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(.1),
                ),
                Consumer<HomeProvider>(
                  builder: (context, pro, child) {
                    if (pro.coins == null) {
                      return const SizedBox.shrink();
                    }

                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('cryptocurrencies')
                          .doc('CsVGQn2SXRbWyXGsUb6c')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const SizedBox.shrink();
                        }

                        // Coins you want to track
                        List<String> trackedCoins = [
                          'btc',
                          'doge',
                          'bch',
                          'usdt',
                          'eth',
                          'ltc'
                        ];

                        // Initialize total balance in USD
                        double totalBalanceInDollar = 0.0;

                        // Create ListView to display coin data
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: MediaQuery.paddingOf(context).bottom + 100,
                          ),
                          itemCount: snapshot.data!.data()!.keys.length,
                          itemBuilder: (context, index) {
                            var key =
                                snapshot.data!.data()!.keys.elementAt(index);

                            String value = snapshot.data!.data()![key];
                            num stocks =
                                num.tryParse(value) ?? 0; // User holding

                            // Find the coin from provider
                            CoinModel? coin = pro.coins!
                                .where((e) => e.symbol.toLowerCase() == key)
                                .firstOrNull;

                            if (coin != null &&
                                trackedCoins
                                    .contains(coin.symbol.toLowerCase())) {
                              // For USDT, manually set the value to $1
                              double coinPriceInDollar = coin.symbol
                                          .toLowerCase() ==
                                      'usdt'
                                  ? 1.0 // USDT is always 1 USD
                                  : double.parse(coin
                                      .price); // For other coins, use their actual price

                              // Multiply by stocks held by user
                              double coinValueInDollar =
                                  coinPriceInDollar * stocks * 0.25;

                              // Add to total balance in USD
                              totalBalanceInDollar += coinValueInDollar;

                              // Save the updated balance in Firebase
                              FirebaseFirestore.instance
                                  .collection('info')
                                  .doc('info')
                                  .update({
                                'balance':
                                    totalBalanceInDollar.toStringAsFixed(2),
                              });

                              // Display each coin
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => FormScreen(
                                        numString: stocks.toInt().toString(),
                                        coinString: coin.symbol,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: coin.iconUrl
                                                .split('.')
                                                .last
                                                .toLowerCase()
                                                .contains('svg')
                                            ? Center(
                                                child: SvgPicture.network(
                                                  coin.iconUrl,
                                                  height: 32,
                                                ),
                                              )
                                            : Center(
                                                child: Image.network(
                                                  coin.iconUrl,
                                                  height: 32,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            coin.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            coin.symbol,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          stocks
                                              .toDouble()
                                              .toStringAsFixed(2)
                                              .toString(),
                                          style: TextStyle(
                                            color: AppColors.onSurface,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "\$ ${(coinValueInDollar).toStringAsFixed(2)}", // Changed to $ for USD
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
