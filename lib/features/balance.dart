import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceTextWidget extends StatelessWidget {
  // Fixed document ID
  final String documentId = 'info';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('info') // Firestore collection name
          .doc(documentId) // The fixed document ID 'info'
          .get(), // Fetch the document snapshot
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...'); // Show loading state while fetching data
        }

        if (snapshot.hasError) {
          return const Text('Error loading balance'); // Show error message if fetch fails
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text('No data found'); // Show message if no data exists
        }

        // Fetch the balance value from the Firestore document
        var balance = snapshot.data!['balance'] ?? 0.0;
        print(balance);
        // Return the text displaying the balance with Euro symbol
        return Text(
          '\$ ${balance}', // Display balance in Euros (no conversion needed)
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Customize text color if needed
          ),
        );
      },
    );
  }
}
