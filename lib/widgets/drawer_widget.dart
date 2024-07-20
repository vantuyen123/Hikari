import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikari/common/custom_size.dart';
import 'package:hikari/common/image_list.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedListImage;
  final ValueChanged<int> onItemTapped;

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
                // _buildListTile(context, 'Drink', listImagesDrink),
                // _buildListTile(context, 'Juice', listImagesJuice),
                // _buildListTile(context, 'Dessert', listDessert),
                // _buildListTile(context, 'Wine', listImagesWine),
                // _buildListTile(context, 'Cake', listImagesCake),
                // _buildListTile(context, 'Sashimi', listImagesSashimi),
                // _buildListTile(context, 'Salad', listImagesSalad),
                // _buildListTile(context, 'Otsumami', listImagesOtatusmi),
                // _buildListTile(context, 'Itame', listImagesItame),
                // _buildListTile(context, 'Okonomi Yaki', listOknomiYaki),
                // _buildListTile(context, 'Steak', listSteak),
                // _buildListTile(context, 'Grill', listGrill),
                // _buildListTile(context, 'Fried Item', listFriedItem),
                // _buildListTile(context, 'Steak', listSteak),
                // _buildListTile(context, 'Hotpot', listHotPot),
                // _buildListTile(context, 'SuShi', listImagesSushi),
                // _buildListTile(context, 'Roll', listImagesRoll),
                // _buildListTile(context, 'Rice', listRice),
                // _buildListTile(context, 'Noodles', listNoodles),
                // _buildListTile(context, 'Soup', listSoup),
                // _buildListTile(context, 'Other', listSoup),
                _buildListTile(context, 'Drink', 1),
                _buildListTile(context, 'Juice', 2),
                _buildListTile(context, 'Dessert', 7),
                _buildListTile(context, 'Wine', 1),
                _buildListTile(context, 'Cake', 1),
                _buildListTile(context, 'Sashimi', 1),
                _buildListTile(context, 'Salad', 1),
                _buildListTile(context, 'Otsumami', 1),
                _buildListTile(context, 'Itame', 1),
                _buildListTile(context, 'Okonomi Yaki', 1),
                _buildListTile(context, 'Steak', 1),
                _buildListTile(context, 'Grill', 1),
                _buildListTile(context, 'Fried Item', 1),
                _buildListTile(context, 'Steak', 1),
                _buildListTile(context, 'Hotpot', 1),
                _buildListTile(context, 'SuShi', 1),
                _buildListTile(context, 'Roll', 1),
                _buildListTile(context, 'Rice', 1),
                _buildListTile(context, 'Noodles', 1),
                _buildListTile(context, 'Soup', 1),
                _buildListTile(context, 'Other', 1),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '0931861588',
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

  Widget _buildListTile(
    BuildContext context,
    String title,
    int indexImg,
  ) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: menuFontSize(context),
        ),
      ),
      selected: selectedListImage == indexImg,
      onTap: () {
        onItemTapped(indexImg);
        Navigator.pop(context);
      },
    );
  }
}
