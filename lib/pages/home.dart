import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikari/common/app_path.dart';
import 'package:hikari/common/custom_size.dart';
import 'package:hikari/common/image_list.dart';
import 'package:hikari/widgets/custom_dropdown.dart';
import 'package:hikari/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List<String> listImage = listImageAll;

  bool isTabletOrDesktop = false;

  void _onItemTapped(List<String> index) {
    setState(() {
      listImage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    isTabletOrDesktop = screenWidth > 800;
    print('fdjasofjewojfewo $screenWidth');
    print('fdjaofjweoiejo $isTabletOrDesktop');
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      drawer: CustomDrawer(
        onItemTapped: _onItemTapped,
        selectedListImage: listImage,
      ),
      body: Scrollbar(
        controller: _scrollController,
        thickness: 12.0,
        radius: const Radius.circular(8.0),
        thumbVisibility: true,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin(context)),
          decoration: const BoxDecoration(color: Color(0xFF272727)),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2f2f2f).withOpacity(0.7),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            listImage = listImageAll;
                          });
                        },
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
                              onItemTapped: _onItemTapped,
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
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listImage.length,
                  itemBuilder: (_, index) {
                    String item = listImage[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(item),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
