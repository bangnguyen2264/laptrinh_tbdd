import 'package:baitap_laptrinhtbdd/baitap_tuan_4/thuchanh1/list_item_model.dart';

class ItemGenerator {
  static List<Item> generateItems(int count) {
    return List<Item>.generate(count, (index) {
      final itemNumber = index + 1;
      return Item(
        formattedId: _formatNumber(itemNumber),
        description: 'The only way to do great work is to love what you do.',
      );
    });
  }

  static String _formatNumber(int number) {
    if (number <= 99) return number.toString().padLeft(2, '0');
    if (number <= 999) return number.toString().padLeft(3, '0');
    if (number == 1000000) return '1.000.000';
    return number.toString();
  }
}
