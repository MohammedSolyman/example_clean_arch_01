import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/core/constants/buttons_types.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/secondary/secondary_bloc.dart';
import 'package:my_clean/core/widgets/my_button.dart';
import 'package:my_clean/features/posts/presentation_layer/widgets/add_update_post_widgets/single_form.dart';

class FormsAndBtn extends StatefulWidget {
  final PostEntity? post;
  final bool isUpdate;
  const FormsAndBtn({this.post, required this.isUpdate, super.key});

  @override
  State<FormsAndBtn> createState() => _FormsState();
}

class _FormsState extends State<FormsAndBtn> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleForm(controller: titleController, isTitle: true),
              SingleForm(controller: bodyController, isTitle: false),
              MyButton(
                  buttonType:
                      widget.isUpdate ? ButtonTypes.update : ButtonTypes.post,
                  myFun: btnFunction)
            ],
          )),
    );
  }

  void btnFunction() {
    // validate the fields input, if validation then add or update post.
    PostEntity post = PostEntity(
        userId: widget.isUpdate ? widget.post!.userId : 0,
        id: widget.isUpdate ? widget.post!.userId : 0,
        title: titleController.text,
        body: bodyController.text);

    bool isValid = globalKey.currentState!.validate();

    if (isValid) {
      if (widget.isUpdate) {
        BlocProvider.of<SecondaryBloc>(context).add(UpdateEvent(post: post));
      } else {
        BlocProvider.of<SecondaryBloc>(context).add(AddEvent(post: post));
      }
    }
  }
}
