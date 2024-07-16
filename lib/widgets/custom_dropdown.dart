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
    return DropdownButton2<List<String>>(
      value: selectedListImage,
      hint: Text('Menu',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w400,
            color: const Color(0xFFe1b44b),
            fontSize: menuFontSize(context),
          )),
      items: [
        DropdownMenuItem<List<String>>(
          value: listImageAll,
          child: Text('Menu',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xFFe1b44b),
                fontSize: menuFontSize(context),
              )),
        ),
        DropdownMenuItem<List<String>>(
          value: listImagesDrink,
          child: Text('Drink',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xFFe1b44b),
                fontSize: menuFontSize(context),
              )),
        ),
        DropdownMenuItem<List<String>>(
          value: listImagesCake,
          child: Text('cake',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xFFe1b44b),
                fontSize: menuFontSize(context),
              )),
        ),
        DropdownMenuItem<List<String>>(
          value: listImagesWine,
          child: Text('wine',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xFFe1b44b),
                fontSize: menuFontSize(context),
              )),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          onItemTapped(value);
        }
      },
      // buttonHeight: 40,
      // buttonWidth: 140,
      // itemHeight: 40,
    );
  }
}
