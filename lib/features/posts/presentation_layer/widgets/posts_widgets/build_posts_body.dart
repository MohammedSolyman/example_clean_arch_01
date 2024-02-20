import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/core/widgets/loading_widget.dart';
import 'package:my_clean/core/widgets/message_widget.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/basic/basic_bloc.dart';
import 'package:my_clean/features/posts/presentation_layer/widgets/posts_widgets/loaded_posts_widget.dart';

class BuildPostsBody extends StatelessWidget {
  const BuildPostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<BasicBloc, BasicState>(
      builder: (context, state) {
        if (state is BasicLoading) {
          return const LoadingWidget();
        } else if (state is BasicSuccess) {
          return LoadedPostsWidget(posts: state.posts);
        } else if (state is BasicError) {
          return MessageWidget(message: state.error);
        }
        return const LoadingWidget();
      },
    ));
  }
}
