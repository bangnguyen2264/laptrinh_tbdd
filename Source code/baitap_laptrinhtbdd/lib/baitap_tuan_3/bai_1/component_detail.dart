import 'package:baitap_laptrinhtbdd/baitap_tuan_3/bai_1/text_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text Detail',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              )),
          centerTitle: true,
        ),
        body: Center(
          child: Image.asset(
            'assets/images/image_2.png',
            width: double.infinity,
            height: 233,
          ),
        ));
  }
}
