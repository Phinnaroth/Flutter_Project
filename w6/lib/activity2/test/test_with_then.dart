// ignore_for_file: avoid_print

import 'package:w6/activity2/repository/mock_post_repository.dart';
import 'package:w6/activity2/repository/post_repository.dart';

void main() {
  // 1- Create the repo
  PostRepository postRepository = MockPostRepository();
  // 2- Request the post  - Success
  MockPostRepository().then((value) => print(value))
  .catchError((error) => print("Error $error"));
}
