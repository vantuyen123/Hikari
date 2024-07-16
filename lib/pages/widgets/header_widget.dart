import 'package:flutter/material.dart';
import 'package:hikari/common/app_path.dart';
import 'package:hikari/widgets/custom_dropdown.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.onClickLogo,
    required this.onSelectCategory,
    required this.isTabletOrDesktop,
    required this.listImage,
  });

  final Function() onClickLogo;
  final Function(List<String> index) onSelectCategory;
  final bool isTabletOrDesktop;
  final List<String> listImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2f2f2f).withOpacity(0.7),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClickLogo,
            child: const SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage(AppPath.logo),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: isTabletOrDesktop,
                child: CustomDropdown(
                  selectedListImage: listImage,
                  onItemTapped: onSelectCategory,
                ),
              ),
              Visibility(
                visible: !isTabletOrDesktop,
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFFe1b44b),
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
