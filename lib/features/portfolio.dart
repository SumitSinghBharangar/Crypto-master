import 'package:binance/common/app_collection.dart';
import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/currency_model.dart';
import 'package:binance/common/models/transection_model.dart';
import 'package:binance/features/convert/convert_screen.dart';
import 'package:binance/features/services/home_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PortFolio extends StatefulWidget {
  const PortFolio({super.key});

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  bool hideBalance = false;
  @override
  Widget build(BuildContext context) {
    final w = Provider.of<HomeProvider>(context);
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
                            "Balance",
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 14,
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
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Center(
                                      child: Image.asset(
                                        "assets/loading.gif",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  );
                                }

                                return Text(
                                  "\$${snapshot.data?['balance'] ?? 0} ", // Changed € to $
                                  style: TextStyle(
                                      color: AppColors.onSurface,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
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
                Image.asset('assets/images/portfolio_graph.jpeg'),
                // const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(.1),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: transaction_history
                        .orderBy("Time", descending: true)
                        .limit(2)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Center(
                            child: Image.asset(
                              "assets/loading.gif",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
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
                            const SizedBox(height: 20),
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          final doc = item[index];
                          TransectionModel model = TransectionModel.fromMap(
                              doc.data() as Map<String, dynamic>);
                          String dt = DateFormat('yyyy/MM/dd HH:mm:ss')
                              .format(model.Time);

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  color: Colors
                                      .grey, // Replace with AppColors.onSurface
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Crypto ${model.Type} ${model.Amount} ${model.CoinCode}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Complete",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF14B8A6),
                                    fontSize: 12),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(.1),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: Checkbox(
                          side: const BorderSide(color: Colors.grey),
                          value: hideBalance,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            setState(() {});
                            hideBalance = !hideBalance;
                          }),
                    ),
                    const Text(
                      "Hide 0 balances",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: cryptocurrencies.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Center(
                        child: Image.asset(
                          "assets/loading.gif",
                          height: 20,
                          width: 20,
                        ),
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return const SizedBox();
                    }
                    final item = snapshot.data!.docs;
                    double totalBalanceInDollar = 0.0;

                    return ListView.separated(
                      shrinkWrap: true, // Fix for viewport issue
                      physics:
                          const NeverScrollableScrollPhysics(), // Prevents scrolling
                      itemBuilder: (context, index) {
                        final doc = item[index];
                        CurrencyModel model = CurrencyModel.fromMap(
                            doc.data() as Map<String, dynamic>);
                        var dollVal = double.parse(model.Amount) *
                            double.parse(model.Dollar);
                        totalBalanceInDollar += dollVal;

                        FirebaseFirestore.instance
                            .collection('info')
                            .doc('info')
                            .update({
                          'balance': totalBalanceInDollar.toStringAsFixed(2),
                        });

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ConvertScreen(
                                    image: model.Code,
                                    name: model.Name,
                                    amount: model.Amount,
                                    dollerAmount: dollVal.toString()),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      "assets/icons/${model.Code}.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.Name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      model.Code,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    double.parse(model.Amount)
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      color: AppColors.onSurface,
                                      // color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$${dollVal.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: MediaQuery.paddingOf(context).bottom + 100,
                      ),
                      itemCount: item.length,
                    );
                  },
                ),

                // Consumer<HomeProvider>(
                //   builder: (context, pro, child) {
                //     if (pro.coins == null) {
                //       return const SizedBox.shrink();
                //     }

                //     return StreamBuilder(
                //       stream: FirebaseFirestore.instance
                //           .collection('cryptocurrencies')
                //           .doc('CsVGQn2SXRbWyXGsUb6c')
                //           .snapshots(),
                //       builder: (context, snapshot) {
                //         if (snapshot.data == null) {
                //           return const SizedBox.shrink();
                //         }

                //         // Coins you want to track
                //         List<String> trackedCoins = [
                //           'btc',
                //           'doge',
                //           'bch',
                //           'usdt',
                //           'eth',
                //           'ltc'
                //         ];

                //         // Initialize total balance in USD
                //         double totalBalanceInDollar = 0.0;

                //         // Create ListView to display coin data
                //         return ListView.separated(
                //           shrinkWrap: true,
                //           physics: const NeverScrollableScrollPhysics(),
                //           separatorBuilder: (context, index) =>
                //               const SizedBox(height: 20),
                //           padding: EdgeInsets.only(
                //             left: 20,
                //             right: 20,
                //             top: 20,
                //             bottom: MediaQuery.paddingOf(context).bottom + 100,
                //           ),
                //           itemCount: snapshot.data!.data()!.keys.length,
                //           itemBuilder: (context, index) {
                //             var key =
                //                 snapshot.data!.data()!.keys.elementAt(index);

                //             String value = snapshot.data!.data()![key];
                //             num stocks =
                //                 num.tryParse(value) ?? 0; // User holding

                //             // Find the coin from provider
                //             CoinModel? coin = pro.coins!
                //                 .where((e) => e.symbol.toLowerCase() == key)
                //                 .firstOrNull;

                //             if (coin != null &&
                //                 trackedCoins
                //                     .contains(coin.symbol.toLowerCase())) {
                //               // For USDT, manually set the value to $1
                //               double coinPriceInDollar = coin.symbol
                //                           .toLowerCase() ==
                //                       'usdt'
                //                   ? 1.0 // USDT is always 1 USD
                //                   : double.parse(coin
                //                       .price); // For other coins, use their actual price

                //               // Multiply by stocks held by user
                //               double coinValueInDollar =
                //                   coinPriceInDollar * stocks * 0.25;

                //               // Add to total balance in USD
                //               totalBalanceInDollar += coinValueInDollar;

                //               // Save the updated balance in Firebase
                //               FirebaseFirestore.instance
                //                   .collection('info')
                //                   .doc('info')
                //                   .update({
                //                 'balance':
                //                     totalBalanceInDollar.toStringAsFixed(2),
                //               });

                //               // Display each coin
                //               return InkWell(
                //                 onTap: () {
                //                   Navigator.push(
                //                     context,
                //                     CupertinoPageRoute(
                //                       builder: (_) => FormScreen(
                //                         numString: stocks.toInt().toString(),
                //                         coinString: coin.symbol,
                //                       ),
                //                     ),
                //                   );
                //                 },
                //                 child: Row(
                //                   children: [
                //                     ClipRRect(
                //                       borderRadius: BorderRadius.circular(100),
                //                       child: Container(
                //                         width: 32,
                //                         height: 32,
                //                         decoration: const BoxDecoration(
                //                           shape: BoxShape.circle,
                //                         ),
                //                         child: coin.iconUrl
                //                                 .split('.')
                //                                 .last
                //                                 .toLowerCase()
                //                                 .contains('svg')
                //                             ? Center(
                //                                 child: SvgPicture.network(
                //                                   coin.iconUrl,
                //                                   height: 32,
                //                                 ),
                //                               )
                //                             : Center(
                //                                 child: Image.network(
                //                                   coin.iconUrl,
                //                                   height: 32,
                //                                 ),
                //                               ),
                //                       ),
                //                     ),
                //                     const SizedBox(width: 14),
                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             coin.name,
                //                             style: const TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                           Text(
                //                             coin.symbol,
                //                             style: const TextStyle(
                //                               color: Colors.grey,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.end,
                //                       children: [
                //                         Text(
                //                           stocks
                //                               .toDouble()
                //                               .toStringAsFixed(2)
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: AppColors.onSurface,
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 16,
                //                           ),
                //                         ),
                //                         Text(
                //                           "\$ ${(coinValueInDollar).toStringAsFixed(2)}", // Changed to $ for USD
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               );
                //             } else {
                //               return const SizedBox.shrink();
                //             }
                //           },
                //         );
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
