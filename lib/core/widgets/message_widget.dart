import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/basic/basic_bloc.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          _onRefresh(context);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text(message)),
          ),
        ));
  }

  void _onRefresh(BuildContext context) {
    BlocProvider.of<BasicBloc>(context).add(LoadEvent());
  }
}
