import 'package:flutter/material.dart';
import 'package:my_clean/features/posts/presentation_layer/pages/posts_page.dart';

void showMySnackBarThenNavigate(
    {required BuildContext context,
    required String message,
    required bool isError}) {
  //show a snackbar:
  SnackBar snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //navigate to post page only in case of success adding or
  //updating post
  if (!isError) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PostsPage(),
        ),
        (route) => false);
  }
}
