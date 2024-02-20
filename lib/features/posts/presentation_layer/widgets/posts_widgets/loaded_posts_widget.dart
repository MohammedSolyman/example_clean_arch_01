import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/basic/basic_bloc.dart';
import 'package:my_clean/features/posts/presentation_layer/pages/post_details_page.dart';

class LoadedPostsWidget extends StatelessWidget {
  const LoadedPostsWidget({super.key, required this.posts});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _onRefresh(context);
      },
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(posts[index].id.toString()),
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PostDetailsPage(post: posts[index]),
                ));
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(thickness: 2),
          itemCount: posts.length),
    );
  }

  void _onRefresh(BuildContext context) {
    BlocProvider.of<BasicBloc>(context).add(LoadEvent());
  }
}
