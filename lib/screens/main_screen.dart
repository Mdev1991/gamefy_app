import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:GameFy/bloc/switch_bloc.dart';
import 'package:GameFy/style/theme.dart' as Style;
import 'package:GameFy/widgets/home_slider.dart';

import 'bottom_tab_screens/discover_screen_grid.dart';
import 'bottom_tab_screens/discover_screen_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  SwitchBloc _switchBloc;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _switchBloc = SwitchBloc();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showSingle() {
    print("Single Clicked");
    _switchBloc.showSingle();
  }

  void _showList() {
    print("List Clicked");
    _switchBloc.showList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20232a),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 0.5,
          iconTheme: IconThemeData(
            color: Style.Colors.mainColor,
          ),
          centerTitle: true,
          backgroundColor: Style.Colors.backgroundColor,
          title: SizedBox(
            width: 95.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('gamefy'.toUpperCase()),
                ],
                onTap: () {},
              ),
            ),
          ),
          actions: [],
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {},
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeSlider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Popular games right now".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent[400]),
                      ),
                    ),
                    StreamBuilder<SwitchItem>(
                      stream: _switchBloc.itemStream,
                      initialData: _switchBloc.defaultItem,
                      // ignore: missing_return
                      builder: (BuildContext context,
                          AsyncSnapshot<SwitchItem> snapshot) {
                        switch (snapshot.data) {
                          case SwitchItem.LIST:
                            return IconButton(
                                icon: Icon(
                                  SimpleLineIcons.list,
                                  size: 18.0,
                                ),
                                color: Colors.greenAccent[400],
                                onPressed: _showSingle);
                          case SwitchItem.GRID:
                            return IconButton(
                                icon: Icon(SimpleLineIcons.grid, size: 18.0),
                                color: Colors.greenAccent[400],
                                onPressed: _showList);
                        }
                      },
                    )
                  ],
                ),
                Expanded(
                  child: StreamBuilder<SwitchItem>(
                    stream: _switchBloc.itemStream,
                    initialData: _switchBloc.defaultItem,
                    // ignore: missing_return
                    builder: (BuildContext context,
                        AsyncSnapshot<SwitchItem> snapshot) {
                      switch (snapshot.data) {
                        case SwitchItem.LIST:
                          return DiscoverScreenGrid();
                        case SwitchItem.GRID:
                          return DiscoverScreenList();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
