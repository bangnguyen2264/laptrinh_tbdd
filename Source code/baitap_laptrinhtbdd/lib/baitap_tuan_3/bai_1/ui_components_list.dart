import 'package:baitap_laptrinhtbdd/baitap_tuan_3/bai_1/component_detail.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_3/bai_1/text_model.dart';
import 'package:flutter/material.dart';

class UiComponentsList extends StatefulWidget {
  const UiComponentsList({super.key});

  @override
  State<UiComponentsList> createState() => _UiComponentsListState();
}

class _UiComponentsListState extends State<UiComponentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components List',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem('Display', display),
            _buildListItem('Input', input),
            _buildListItem('Layout', layout),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, List<TextModel> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: items.map((item) => _buildItem(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(TextModel item) {
    return Card(
      color: const Color.fromARGB(255, 65, 130, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(item.text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            )),
        subtitle: Text(item.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(),
            ),
          );
        },
      ),
    );
  }
}
