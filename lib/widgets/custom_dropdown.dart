import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikari/common/custom_size.dart';
import 'package:hikari/common/image_list.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> selectedListImage;
  final ValueChanged<List<String>> onItemTapped;

  const CustomDropdown({
    Key? key,
    required this.selectedListImage,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'value': listImageAll, 'label': 'Menu'},
      {'value': listImagesDrink, 'label': 'Drink'},
      // {'value': listImagesJuice, 'label': 'Juice'},
      {'value': listDessert, 'label': 'Dessert'},
      {'value': listImagesWine, 'label': 'Wine'},
      // {'value': listImagesCake, 'label': 'Cake'},
      {'value': listImagesSashimi, 'label': 'Sashimi'},
      {'value': listImagesSalad, 'label': 'Salad'},
      {'value': listImagesOtatusmi, 'label': 'Otsumami'},
      {'value': listImagesItame, 'label': 'Itame'},
      {'value': listOknomiYaki, 'label': 'Okonomi Yaki'},
      // {'value': listSteak, 'label': 'Steak'},
      {'value': listGrill, 'label': 'Grill'},
      {'value': listFriedItem, 'label': 'Fried Item'},
      // {'value': listSteak, 'label': 'Steak'},
      {'value': listHotPot, 'label': 'Hotpot'},
      {'value': listImagesSushi, 'label': 'SuShi'},
      // {'value': listImagesRoll, 'label': 'Roll'},
      {'value': listRice, 'label': 'Rice'},
      {'value': listNoodles, 'label': 'Noodles'},
      {'value': listSoup, 'label': 'Soup'},
      {'value': listSoup, 'label': 'Other'},
    ];

    return DropdownButton2<List<String>>(
      value: selectedListImage,
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
        return DropdownMenuItem<List<String>>(
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
