import 'package:flutter/material.dart';
import 'package:flutter_instagram/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'main.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    MyHomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home_outlined,
    Icons.search_outlined,
    MdiIcons.plusBoxOutline,
    MdiIcons.heartOutline,
    MdiIcons.accountCircleOutline
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedIndex, 
                onTap: (index) => setState(() => _selectedIndex = index)),
          ),
        ));
  }
}
