// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SellScreen(),
//   ));
// }

// class SellScreen extends StatefulWidget {
//   @override
//   _SellScreenState createState() => _SellScreenState();
// }

// class _SellScreenState extends State<SellScreen> {
//   String selectedCurrency = 'USDT'; // Initial dropdown value

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Sell')),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.note),
//             onPressed: () {},
//           ),
//         ],
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'I want to sell',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'By Money',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.swap_horiz_rounded, color: Colors.black),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       initialValue: '0.56148829',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Enter amount',
//                       ),
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.diamond_sharp, color: Colors.teal),
//                       SizedBox(width: 5),
//                       DropdownButton<String>(
//                         value: selectedCurrency,
//                         underline: SizedBox(), // Removes underline from dropdown
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.grey), // Dropdown icon color
//                         items: [
//                           DropdownMenuItem(
//                             value: 'USDT',
//                             child: Text('USDT'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'BTC',
//                             child: Text('BTC'),
//                           ),
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             selectedCurrency = value!;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '2.24000000 - 10000.00000000 $selectedCurrency',
//               style: TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Text(
//                   'Balance:',
//                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
//                 ),
//                 Text(
//                   ' 0.56148829 $selectedCurrency',
//                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _percentageButton('25%'),
//                 _percentageButton('50%'),
//                 _percentageButton('75%'),
//                 _percentageButton('100%'),
//               ],
//             ),
//             SizedBox(height: 20),
//             _buildNumberPad(),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.yellow.shade700,
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               child: Text(
//                 'Select Receive Method',
//                 style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _percentageButton(String text) {
//     return TextButton(
//       onPressed: () {},
//       style: TextButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//           side: BorderSide(color: Colors.grey.shade200), // Set border color to gray
//         ),
//         backgroundColor: Colors.transparent, // Removed background color
//       ),
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.black),
//       ),
//     );
//   }

//   Widget _buildNumberPad() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: 12,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (context, index) {
//         Widget child;
//         if (index == 9) {
//           child = Text(
//             '.',
//             style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           );
//         } else if (index == 10) {
//           child = Text(
//             '0',
//             style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           );
//         } else if (index == 11) {
//           child = Icon(Icons.backspace_sharp, color: Colors.black, size: 24);
//         } else {
//           child = Text(
//             '${index + 1}',
//             style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           );
//         }
//         return TextButton(
//           onPressed: () {},
//           style: TextButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//           ),
//           child: child,
//         );
//       },
//     );
//   }
// }

import 'package:binance/common/app_collection.dart';
import 'package:binance/common/app_colors.dart';
import 'package:binance/common/models/currency_model.dart';
import 'package:binance/features/convert/convert_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCryptoScreen extends StatelessWidget {
  const ChooseCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Choose Crypto',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        // elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey.shade200.withOpacity(0.8),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: const Icon(Icons.cancel, color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: 20), // Adjust padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust border radius for a better look
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                    fontSize: 14), // Optionally adjust text size
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Flexible(
              child: SingleChildScrollView(
                child: StreamBuilder<QuerySnapshot>(
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
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => ConvertScreen(
                            //         image: model.Code,
                            //         name: model.Name,
                            //         amount: model.Amount,
                            //         dollerAmount: dollVal.toString()),
                            //   ),
                            // );
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
              ),
            ),

            // ListTile(
            //   leading: const CircleAvatar(
            //     backgroundColor: Colors.teal,
            //     child: Icon(Icons.currency_bitcoin, color: Colors.white),
            //   ),
            //   title: const Text(
            //     'TetherUS',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   subtitle: const Text(
            //     'USDT',
            //     style: TextStyle(color: Colors.grey),
            //   ),
            //   trailing: const Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         '0.56148829',
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //       ),
            //       Text(
            //         '\$0.56148829',
            //         style: TextStyle(color: Colors.grey, fontSize: 12),
            //       ),
            //     ],
            //   ),
            //   onTap: () {
            //     // Action when tapped
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
