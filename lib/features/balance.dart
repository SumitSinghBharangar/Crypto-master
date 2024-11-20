import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceTextWidget extends StatelessWidget {
  // Fixed document ID
  final String documentId = 'info';

  const BalanceTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('info') // Firestore collection name
          .doc(documentId) // The fixed document ID 'info'
          .get(), // Fetch the document snapshot
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'Loading...',
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              letterSpacing: 0.2,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ); // Show loading state while fetching data
        }

        if (snapshot.hasError) {
          return const Text(
              'Error loading balance'); // Show error message if fetch fails
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text('No data found'); // Show message if no data exists
        }

        // Fetch the balance value from the Firestore document
        var balance = snapshot.data!['balance'] ?? 0.0;
        print(balance);
        // Return the text displaying the balance with Euro symbol
        return Text(
          '\$$balance',
          softWrap: true,
          style: const TextStyle(
            letterSpacing: 0.5,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 25, // Customize text color if needed
          ),
        );
      },
    );
  }
}
