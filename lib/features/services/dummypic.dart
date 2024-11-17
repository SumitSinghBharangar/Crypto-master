import 'package:binance/features/userdetail.dart';
import 'package:flutter/material.dart';

class DummyPic extends StatelessWidget {
  const DummyPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UserDetails(),
                        ),
                      );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                            'assets/dummypic.jpeg',
                            width: double.infinity,
                            height: 900,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}