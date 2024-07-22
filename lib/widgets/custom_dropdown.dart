import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikari/common/custom_size.dart';

class CustomDropdown extends StatelessWidget {
  final int selectedListImage;
  final ValueChanged<int> onItemTapped;

  const CustomDropdown({
    Key? key,
    required this.selectedListImage,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'value': 0, 'label': 'Drink'},
      {'value': 6, 'label': 'Dessert'},
      {'value': 8, 'label': 'Wine'},
      {'value': 15, 'label': 'Sashimi'},
      {'value': 23, 'label': 'Salad'},
      {'value': 25, 'label': 'Otsumami'},
      {'value': 32, 'label': 'Itame'},
      {'value': 35, 'label': 'Okonomi Yaki'},
      {'value': 36, 'label': 'Grill'},
      {'value': 43, 'label': 'Fried Item'},
      {'value': 46, 'label': 'Hotpot'},
      {'value': 48, 'label': 'SuShi'},
      {'value': 55, 'label': 'Rice'},
      {'value': 60, 'label': 'Noodles'},
      {'value': 64, 'label': 'Soup'},
    ];

    return DropdownButton2<int>(
      value: null,
      menuItemStyleData: const MenuItemStyleData(),
      dropdownStyleData: DropdownStyleData(
          maxHeight: 400,
          decoration:
              BoxDecoration(color: const Color(0xFF272727).withOpacity(0.5))),
      hint: Text(
        'Menu',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: const Color(0xFFe1b44b),
          fontSize: menuFontSize(context),
        ),
      ),
      items: menuItems.map((item) {
        return DropdownMenuItem<int>(
          value: item['value'],
          child: Text(
            item['label'],
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              color: const Color(0xFFe1b44b),
              fontSize: menuFontSize(context),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onItemTapped(value);
        }
      },
    );
  }
}
