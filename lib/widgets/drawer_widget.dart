import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikami_sushi/common/custom_size.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<int> onItemTapped;

  const CustomDrawer({
    Key? key,
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
                _buildListTile(context, 'Drink', 0),
                _buildListTile(context, 'Dessert', 6),
                _buildListTile(context, 'Wine', 8),
                _buildListTile(context, 'Sashimi', 15),
                _buildListTile(context, 'Salad', 23),
                _buildListTile(context, 'Otsumami', 25),
                _buildListTile(context, 'Itame', 32),
                _buildListTile(context, 'Okonomi Yaki', 35),
                _buildListTile(context, 'Grill', 36),
                _buildListTile(context, 'Fried Item', 43),
                _buildListTile(context, 'Hotpot', 46),
                _buildListTile(context, 'SuShi', 48),
                _buildListTile(context, 'Rice', 55),
                _buildListTile(context, 'Noodles', 60),
                _buildListTile(context, 'Soup', 64),
                _buildListTile(context, 'Lucnh Menu', 66),
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
      // selected: selectedListImage == indexImg,
      onTap: () {
        onItemTapped(indexImg);
        Navigator.pop(context);
      },
    );
  }
}
