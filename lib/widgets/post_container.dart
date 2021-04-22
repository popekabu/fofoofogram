import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/data/data.dart';
import 'package:flutter_instagram/models/models.dart';
import 'package:flutter_instagram/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(),
                _PostHedader(post: post),
              ],
            ),
          ),
          post.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: post.imageUrl,
                  height: 255,
                )
              : const SizedBox.shrink(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset("assets/hearts.png", height: 40, width: 40),
            ),
            Image.asset("assets/comment.png", height: 40, width: 40),
            Image.asset("assets/paper_plane.png", height: 37, width: 37),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset("assets/bookmark.png", height: 40, width: 40),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('${post.likes} likes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14)),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(post.caption, textAlign: TextAlign.left)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('View all ${post.comments} comments',
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: CreateCommentContainer(
              currentUser: currentUser,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${post.timeAgo} hours ago',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostHedader extends StatelessWidget {
  final Post post;

  const _PostHedader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              post.user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ]),
        ),
        IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () => print('More was pressed'))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 4.0),
            // Text('${post.comments} Comments',
            //     style: TextStyle(color: Colors.grey[600])),
            const SizedBox(width: 8.0),
          ],
        ),
      ],
    );
  }
}

// class _PostButton extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final Function onTap;

//   const _PostButton(
//       {Key key,
//       @required this.icon,
//       @required this.label,
//       @required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
//         child: Material(
//           color: Colors.white,
//           child: InkWell(
//               onTap: onTap,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 height: 25.0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     icon,
//                     const SizedBox(width: 4.0),
//                     Text(label),
//                   ],
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
