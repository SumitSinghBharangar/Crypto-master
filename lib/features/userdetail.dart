import 'package:flutter/material.dart';
import '../common/app_colors.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
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
        title: Text(
          '     Account Center',
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: screenWidth > 600 ? 22 : 18, // Adjust font size for larger screens
            fontWeight: FontWeight.bold,
            fontFamily: "BinancePlex",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded( // Take up remaining space in the column
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          width: screenWidth-40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withOpacity(.2),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/IMG_20241113_183832.jpg',
                                        width: screenWidth > 600 ? 120 : 60,
                                      ),
                                    ),
                                    Text(
                                      'User-cfa21',
                                      style: TextStyle(
                                        color: AppColors.onSurface,
                                        fontSize: screenWidth > 600 ? 18 : 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "BinancePlex",
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/icons .jpg',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '    ID',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(.8),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text('518851134'),
                                    const SizedBox(width: 20),
                                    Image.asset(
                                      'assets/IMG-20241114-WA0106-removebg-preview.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '    Registration Info ',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(.8),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text('9206666433 '),
                                    const SizedBox(width: 15),
                                    Image.asset(
                                      'assets/IMG-20241114-WA0107-removebg-preview.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        buildSectionRow(
                          context,
                          icon: 'assets/IMG-20241114-WA0100-removebg-preview (1).png',
                          text: 'Verifications',
                          statusText: 'Verified',
                          statusColor: const Color(0xFF00c080),
                        ),
                        const SizedBox(height: 40),
                        buildSectionRow(
                          context,
                          icon: 'assets/IMG-20241114-WA0102-removebg-preview.png',
                          text: 'Security',
                        ),
                        const SizedBox(height: 40),
                        buildSectionRow(
                          context,
                          icon: 'assets/IMG-20241114-WA0103-removebg-preview.png',
                          text: 'VIP Privilege',
                          statusText: 'Regular',
                          statusColor: const Color(0xFFCAA223),
                        ),
                        const SizedBox(height: 40),
                        buildSectionRow(
                          context,
                          icon: 'assets/IMG-20241114-WA0104-removebg-preview.png',
                          text: 'Twitter',
                          statusText: 'Unlinked', // Unlinked status
                        ),
                      ],
                    ),
                  ),
                ),
                // Row with action buttons at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildActionButton('Switch Account'),
                    buildActionButton('Log Out'),
                  ],
                ),
                SizedBox(height: 15),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSectionRow(
    BuildContext context, {
    required String icon,
    required String text,
    String? statusText,
    Color? statusColor,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        const SizedBox(width: 10),
        Image.asset(
          icon,
          width: 15,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: screenWidth > 600 ? 18 : 16,
            fontWeight: FontWeight.bold,
            fontFamily: "BinancePlex",
          ),
        ),
        const Spacer(),
        if (statusText != null) ...[
          // Apply background only for "Verified" and "Regular"
          Container(
            height: 20,
            width: 70,
            decoration: BoxDecoration(
              // Background color for "Verified" or "Regular" status
              color: statusText == 'Unlinked'
                  ? Colors.transparent // No background for "Unlinked"
                  : statusColor?.withOpacity(0.1), // Background for other statuses
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                statusText,
                style: TextStyle(
                  // Grey color for "Unlinked"
                  color: statusText == 'Unlinked'
                      ? Colors.grey.withOpacity(0.8) // Unlinked grey color
                      : statusColor, // Color for other statuses
                ),
              ),
            ),
          ),
        ],
        const SizedBox(width: 15),
        Image.asset(
          'assets/IMG-20241114-WA0108-removebg-preview.png',
          width: 10,
        ),
      ],
    );
  }

  Widget buildActionButton(String text) {
    return Container(
      height: 45,
      width: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFebecf0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text)),
    );
  }
}
