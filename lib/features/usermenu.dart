import 'package:binance/features/userdetail.dart';
import 'package:flutter/material.dart';
import '../common/app_colors.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive layout
    double screenWidth = MediaQuery.of(context).size.width;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              'assets/IMG_20241114_091824.jpg',
              width: screenWidth > 600
                  ? 90
                  : 60, // Adjust size for tablet vs mobile
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UserDetails(),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/IMG_20241113_183832.jpg',
                  width:
                      screenWidth > 600 ? 150 : 70, // Larger image for tablet
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'ID: 518851134',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'User-cfa21',
                      style: TextStyle(
                        color: AppColors.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "BinancePlex",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 65,
                          decoration: BoxDecoration(
                            color: const Color(0xFFe3f7ee),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Verified',
                              style: TextStyle(
                                  color: Color(0xFF00c080), fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 65,
                          decoration: BoxDecoration(
                            color: const Color(0xFFfdf6e4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Regular',
                              style: TextStyle(
                                  color: Color(0xFFCAA223), fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/IMG-20241114-WA0108-removebg-preview.png',
                        width: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.grey.withOpacity(.2),
            thickness: 0.5,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuItem('assets/IMG_20241114_094409.jpg', 'Deposit'),
              _buildMenuItem('assets/convert.png', 'Convert'),
              _buildMenuItem('assets/IMG_20241114_094531.jpg', 'Referral'),
              _buildMenuItem(
                  'assets/IMG_20241114_094511.jpg', 'Rewards\n    Hub'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem('assets/IMG_20241114_094443.jpg', 'FAQ'),
              const SizedBox(
                width: 50,
              ),
              const SizedBox(
                width: 50,
              ),
              const SizedBox(
                width: 50,
              )
            ],
          ),
          // Move the image here to make it appear at the bottom
          const Expanded(
              child: SizedBox()), // Ensure image is at the bottom of the screen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Image.asset(
              'assets/IMG_20241114_073411.jpg',
              width: double.infinity,
              height: 70,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }

  // Helper widget for menu items
  Widget _buildMenuItem(String asset, String text) {
    return Column(
      children: [
        Image.asset(
          asset,
          width: 20,
        ),
        const SizedBox(height: 6),
        Text(text),
      ],
    );
  }
}
