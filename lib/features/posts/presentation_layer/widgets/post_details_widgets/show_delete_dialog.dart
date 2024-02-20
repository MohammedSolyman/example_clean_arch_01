import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/core/util/show_my_snackbar.dart';
import 'package:my_clean/core/widgets/loading_widget.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/secondary/secondary_bloc.dart';

void showDeleteDialog({required BuildContext context, required int id}) {
  AlertDialog loadingDialog =
      const AlertDialog(title: Center(child: LoadingWidget()));

  AlertDialog alertDialog = AlertDialog(
    title: const Text('Are you sure?'),
    actions: [
      TextButton(
          onPressed: () {
            BlocProvider.of<SecondaryBloc>(context).add(DeleteEvent(id: id));
          },
          child: const Text('yes')),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('no'))
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<SecondaryBloc, SecondaryState>(
          builder: (context, state) {
            if (state is SecondaryLoading) {
              return loadingDialog;
            }
            return alertDialog;
          },
          listener: (context, state) {
            if (state is SecondarySuccsess) {
              showMySnackBarThenNavigate(
                  context: context, message: state.success, isError: false);
            } else if (state is SecondaryError) {
              showMySnackBarThenNavigate(
                  context: context, message: state.error, isError: true);
            }
          },
        );
      });
}
