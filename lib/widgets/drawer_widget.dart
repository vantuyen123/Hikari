import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikari/common/custom_size.dart';
import 'package:hikari/common/image_list.dart';

class CustomDrawer extends StatelessWidget {
  final List<String> selectedListImage;
  final ValueChanged<List<String>> onItemTapped;

  const CustomDrawer({
    Key? key,
    required this.selectedListImage,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                'Menu',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFe1b44b),
                  fontSize: 24,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Drink',
                    textAlign: TextAlign.center,
                  ),
                  selected: selectedListImage == listImagesDrink,
                  onTap: () {
                    onItemTapped(listImagesDrink);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'cake',
                    textAlign: TextAlign.center,
                  ),
                  selected: selectedListImage == listImagesCake,
                  onTap: () {
                    onItemTapped(listImagesCake);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'wine',
                    textAlign: TextAlign.center,
                  ),
                  selected: selectedListImage == listImagesWine,
                  onTap: () {
                    onItemTapped(listImagesWine);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Số điện thoại của nhà hàng',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              color: Colors.red,
              fontSize: menuFontSize(context),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
