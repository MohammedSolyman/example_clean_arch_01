import 'package:flutter/material.dart';
import 'package:my_clean/core/constants/buttons_types.dart';
import 'package:my_clean/core/widgets/build_appbar.dart';
import 'package:my_clean/core/widgets/my_button.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/presentation_layer/pages/add_update_post_page.dart';
import 'package:my_clean/features/posts/presentation_layer/widgets/post_details_widgets/show_delete_dialog.dart';

class PostDetailsPage extends StatelessWidget {
  final PostEntity post;
  const PostDetailsPage({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'post details'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(post.title, style: const TextStyle(fontSize: 35)),
              const Divider(thickness: 3),
              Text(post.body, style: const TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                      myFun: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AddUpdatePostPage(isUpdate: true, post: post),
                        ));
                      },
                      buttonType: ButtonTypes.update),
                  MyButton(
                      myFun: () {
                        showDeleteDialog(context: context, id: post.id);
                      },
                      buttonType: ButtonTypes.delete),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
