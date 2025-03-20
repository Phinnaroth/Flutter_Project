// ignore_for_file: avoid_print

import '../repository/mock_post_repository.dart';
import '../repository/post_repository.dart';

void main() {
  // 1- Create the repo
  PostRepository postRepo = MockPostRepository();

  // 2- Request the post  - Success
  print("Fetching post 25....");
  postRepo
      .getPost(25)
      .then(
        (post) => {
          print(
            "Post : title ${post.title} -  description  ${post.description}",
          ),
        },
      )
      .catchError((error) => {print("Error when getting post : $error")});

  // 3- Request the post - Failed
  print("Fetching post 24....");
  postRepo
      .getPost(24)
      .then(
        (post) => {
          print(
            "Post : title ${post.title} -  description  ${post.description}",
          ),
        },
      )
      .catchError((error) => {print("Error when getting post : $error")});
}
