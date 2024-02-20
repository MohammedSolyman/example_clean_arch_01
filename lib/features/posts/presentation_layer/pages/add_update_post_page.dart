import 'package:flutter/material.dart';
import 'package:my_clean/core/widgets/build_appbar.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/presentation_layer/widgets/add_update_post_widgets/build_add_update_body.dart';

class AddUpdatePostPage extends StatelessWidget {
  final PostEntity? post;
  final bool isUpdate;
  const AddUpdatePostPage({super.key, this.post, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: isUpdate ? 'Update post' : 'Add post'),
      body: BuildAddUpdateBody(isUpdate: isUpdate, post: post),
    );
  }
}
