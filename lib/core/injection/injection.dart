import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_clean/core/network_info/network_info.dart';
import 'package:my_clean/features/posts/data_layer/data_sources/local_post_data_source.dart';
import 'package:my_clean/features/posts/data_layer/data_sources/remote_post_data_source.dart';
import 'package:my_clean/features/posts/data_layer/repositories/post_repository_impl.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/add_post.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/delete_post.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/get_all_posts.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/update_post.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/basic/basic_bloc.dart';
import 'package:my_clean/features/posts/presentation_layer/bloc/secondary/secondary_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //blocs ////////////////////////////////////////////////////////////////////////////
  sl.registerFactory(() => BasicBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => SecondaryBloc(
      addPostUseCase: sl(), deletePostUseCase: sl(), updatePostUseCase: sl()));

  //usecases /////////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton(
      () => GetAllPostsUseCase(postEntityRepository: sl()));
  sl.registerLazySingleton(() => AddPostUseCase(postEntityRepository: sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(postEntityRepository: sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(postEntityRepository: sl()));

  //repository /////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<PostEntityRepository>(() => PostRepositoryImp(
      networkInfo: sl(),
      remotePostDataSource: sl(),
      localPostDataSource: sl()));

  //core /////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetChecker: sl()));

  //data sources /////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<RemotePostDataSource>(
      () => RemotePostDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalPostDataSource>(
      () => LocalPostDataSourceImpl(sharedPreferences: sl()));

  //external /////////////////////////////////////////////////////////////////////
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
