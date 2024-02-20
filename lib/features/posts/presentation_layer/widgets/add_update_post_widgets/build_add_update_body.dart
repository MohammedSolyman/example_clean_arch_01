import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/core/util/show_my_snackbar.dart';
import 'package:my_clean/core/widgets/loading_widget.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/secondary/secondary_bloc.dart';
import 'package:my_clean/features/posts/presentation_layer/widgets/add_update_post_widgets/forms_and_btn.dart';

class BuildAddUpdateBody extends StatefulWidget {
  final PostEntity? post;
  final bool isUpdate;
  const BuildAddUpdateBody({required this.isUpdate, this.post, super.key});

  @override
  State<BuildAddUpdateBody> createState() => _BuildAddUpdateBodyState();
}

class _BuildAddUpdateBodyState extends State<BuildAddUpdateBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SecondaryBloc, SecondaryState>(
        builder: (context, state) {
      if (state is SecondaryLoading) {
        return const LoadingWidget();
      }
      return Center(
          child: FormsAndBtn(isUpdate: widget.isUpdate, post: widget.post));
    }, listener: (context, state) {
      if (state is SecondarySuccsess) {
        showMySnackBarThenNavigate(
            context: context, message: state.success, isError: false);
      } else if (state is SecondaryError) {
        showMySnackBarThenNavigate(
            context: context, message: state.error, isError: true);
      }
    });
  }
}
