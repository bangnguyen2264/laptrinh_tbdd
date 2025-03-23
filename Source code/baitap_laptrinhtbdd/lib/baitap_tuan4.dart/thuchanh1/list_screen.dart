import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/appbar_custom.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/detail_screen.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/item_generator.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ItemGenerator.generateItems(1000000);

    return Scaffold(
      appBar: AppbarCustom(title: 'List Screen'),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 0,
                color: Colors.blue.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Nội dung
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.formattedId} | ${item.description}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // Icon
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.lightBlue,
                              size: 18,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
