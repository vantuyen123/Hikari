import 'package:flutter/material.dart';
import 'package:hikami_sushi/common/custom_size.dart';
import 'package:hikami_sushi/common/image_list.dart';
import 'package:hikami_sushi/pages/widgets/header_widget.dart';
import 'package:hikami_sushi/widgets/drawer_widget.dart';

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

  final List<GlobalKey> _keys = [];

  bool isTabletOrDesktop = false;

  @override
  void initState() {
    super.initState();
    _keys.addAll(List.generate(listImageAll.length, (index) => GlobalKey()));
  }

  void _onItemTapped(int index) {
    _scrollToIndex(index);
    print('index ${index}, value: ${listImage[index]}');
    // setState(() {
    //   listImage = index;
    // });
  }

  void _scrollToIndex(int index) {
    if (index < _keys.length) {
      Scrollable.ensureVisible(
        _keys[index].currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    isTabletOrDesktop = screenWidth > 800;
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      drawer: CustomDrawer(
        onItemTapped: _onItemTapped,
      ),
      body: Scrollbar(
        controller: _scrollController,
        thickness: 12.0,
        radius: const Radius.circular(8.0),
        thumbVisibility: true,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin(context)),
          decoration: const BoxDecoration(color: Color(0xFF272727)),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listImage.length,
                  itemBuilder: (_, index) {
                    String item = listImage[index];
                    print('index ${index}, value: ${listImage[index]}');
                    return Container(
                        color: Colors.blue,
                        child: Image.asset(item,
                            fit: BoxFit.fill, key: _keys[index]));
                  },
                ),
              ),
              HeaderWidget(
                  onClickLogo: () {
                    setState(() {
                      listImage = listImageAll;
                    });
                  },
                  onSelectCategory: _onItemTapped,
                  isTabletOrDesktop: isTabletOrDesktop,
                  index: 0),
            ],
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
