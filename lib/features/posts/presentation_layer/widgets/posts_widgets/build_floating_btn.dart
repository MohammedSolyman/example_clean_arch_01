// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:my_clean/core/network_info/network_info.dart';
// import 'package:my_clean/features/posts/data_layer/data_sources/local_post_data_source.dart';
// import 'package:my_clean/features/posts/data_layer/data_sources/remote_post_data_source.dart';
// import 'package:my_clean/features/posts/data_layer/repositories/post_repository_impl.dart';
// import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/add_post.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/delete_post.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/get_all_posts.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/update_post.dart';
// import 'package:my_clean/features/posts/presentation_layer/bloc/basic/basic_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_clean/features/posts/presentation_layer/bloc/secondary/secondary_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   SharedPreferences instance = await SharedPreferences.getInstance();
//   runApp(MainApp(
//     instance: instance,
//   ));
// }

// class MainApp extends StatelessWidget {
//   SharedPreferences instance;

//   MainApp({required this.instance, super.key});

//   @override
//   Widget build(BuildContext context) {
//     http.Client;
//     return MaterialApp(
//       home: MultiBlocProvider(
//         providers: [
//           BlocProvider<BasicBloc>(
//             create: (context) {
//               return BasicBloc(
//                   getAllPostsUseCase: GetAllPostsUseCase(
//                       postEntityRepository: PostRepositoryImp(
//                           networkInfo: NetworkInfoImpl(
//                               internetChecker: InternetConnectionChecker()),
//                           remotePostDataSource:
//                               RemotePostDataSourceImpl(client: http.Client()),
//                           localPostDataSource: LocalPostDataSourceImpl(
//                               sharedPreferences: instance))));
//             },
//           ),
//           BlocProvider<SecondaryBloc>(
//             create: (context) {
//               return SecondaryBloc(
//                   addPostUseCase: AddPostUseCase(
//                       postEntityRepository: PostRepositoryImp(
//                           networkInfo: NetworkInfoImpl(
//                               internetChecker: InternetConnectionChecker()),
//                           remotePostDataSource:
//                               RemotePostDataSourceImpl(client: http.Client()),
//                           localPostDataSource: LocalPostDataSourceImpl(
//                               sharedPreferences: instance))),
//                   deletePostUseCase: DeletePostUseCase(
//                       postEntityRepository: PostRepositoryImp(
//                           networkInfo: NetworkInfoImpl(
//                               internetChecker: InternetConnectionChecker()),
//                           remotePostDataSource:
//                               RemotePostDataSourceImpl(client: http.Client()),
//                           localPostDataSource: LocalPostDataSourceImpl(
//                               sharedPreferences: instance))),
//                   updatePostUseCase: UpdatePostUseCase(
//                       postEntityRepository: PostRepositoryImp(
//                           networkInfo: NetworkInfoImpl(
//                               internetChecker: InternetConnectionChecker()),
//                           remotePostDataSource:
//                               RemotePostDataSourceImpl(client: http.Client()),
//                           localPostDataSource: LocalPostDataSourceImpl(
//                               sharedPreferences: instance))));
//             },
//           )
//         ],
//         child: const MyHome(),
//       ),
//     );
//   }
// }

// class MyHome extends StatelessWidget {
//   const MyHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.red,
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_clean/features/posts/presentation_layer/pages/add_update_post_page.dart';

class BuildFloatingBtn extends StatelessWidget {
  const BuildFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddUpdatePostPage(isUpdate: false),
        ));
      },
      child: const Icon(Icons.add),
    );
  }
}
