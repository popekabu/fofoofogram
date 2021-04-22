import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/models.dart';
import 'package:flutter_instagram/widgets/widgets.dart';

class CreateCommentContainer extends StatelessWidget {
  final User currentUser;

  const CreateCommentContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
            const SizedBox(width: 8.0),
            Expanded(
                child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Add a comment...', hintStyle: TextStyle(fontWeight: FontWeight.w500))))
          ]),
        ],
      ),
    );
  }
}
