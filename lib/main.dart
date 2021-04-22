import 'package:flutter/material.dart';
import 'package:flutter_instagram/data/data.dart';
import 'package:flutter_instagram/nav_screen.dart';
import 'package:flutter_instagram/widgets/circle_button.dart';
import 'package:flutter_instagram/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text("Fofoofogram",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Billabong', fontSize: 40)),
          actions: [
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Facebook Messenger'),
            )
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              stories: stories,
              currentUser: currentUser,
            ),
          ),
        ),
         SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
          childCount: posts.length)),
      ],
    ));
  }
}
