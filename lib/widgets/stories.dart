import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/models.dart';
import 'package:flutter_instagram/widgets/circle_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, this.currentUser, @required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    Stack(children: [
                      CachedNetworkImage(
                        imageUrl: currentUser.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Positioned(
                          top: 35,
                          left: 35,
                          child: CircleButton(
                              color: Color.fromRGBO(23, 148, 246, 1.0),
                              icon: MdiIcons.plusCircle,
                              iconSize: 30,
                              onPressed: () {}))
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Your Story",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              );
            }

            final Story story = stories[index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: CircleAvatar(
                      radius: 41,
                      backgroundColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CachedNetworkImage(
                          imageUrl: story.imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      story.user.handle,
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
