import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/appbar_custom.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final Item item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(title: 'Detail'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '“${item.description}”',
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/image_4.png',
              fit: BoxFit.contain,
              width: 296,
              height: 444,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('BACK TO ROOT'),
            ),
          ],
        ),
      ),
    );
  }
}
