import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl;
  final String handle;

  const User({
    @required this.name,
    @required this.imageUrl,
    @required this.handle,
  });
}
