// import 'package:dartz/dartz.dart';
// import 'package:my_clean/core/errors/exceptions.dart';
// import 'package:my_clean/core/errors/failures.dart';
// import 'package:my_clean/core/network_info/network_info.dart';
// import 'package:my_clean/features/posts/data_layer/data_sources/local_post_data_source.dart';
// import 'package:my_clean/features/posts/data_layer/data_sources/remote_post_data_source.dart';
// import 'package:my_clean/features/posts/data_layer/models/post_model.dart';
// import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
// import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

// class PostRepositoryImp implements PostEntityRepository {
//   final RemotePostDataSource remotePostDataSource;
//   final LocalPostDataSource localPostDataSource;
//   final NetworkInfo networkInfo;

//   PostRepositoryImp(
//       {required this.networkInfo,
//       required this.remotePostDataSource,
//       required this.localPostDataSource});

//   @override
//   Future<Either<Failure, List<PostModel>>> getAllPosts() async {
//     if (await networkInfo.isConnected) {
//       try {
//         List<PostModel> remotePosts = await remotePostDataSource.getAllPosts();
//         await localPostDataSource.saveCache(remotePosts);
//         return Right(remotePosts);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         List<PostModel> localPosts = await localPostDataSource.getcache();
//         return Right(localPosts);
//       } on CacheException {
//         return Left(CacheFailure());
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> addPost(PostEntity post) async {
//     PostModel postModel = PostModel.fromEntity(post);

//     if (await networkInfo.isConnected) {
//       try {
//         await remotePostDataSource.addPost(postModel);
//         return const Right(unit);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(NoConnectionFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> deletePost(int id) async {
//     if (await networkInfo.isConnected) {
//       try {
//         await remotePostDataSource.deletePost(id);
//         return const Right(unit);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(NoConnectionFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
//     PostModel postModel = PostModel.fromEntity(post);

//     if (await networkInfo.isConnected) {
//       try {
//         await remotePostDataSource.updatePost(postModel);
//         return const Right(unit);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(NoConnectionFailure());
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/exceptions.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/core/network_info/network_info.dart';
import 'package:my_clean/features/posts/data_layer/data_sources/local_post_data_source.dart';
import 'package:my_clean/features/posts/data_layer/data_sources/remote_post_data_source.dart';
import 'package:my_clean/features/posts/data_layer/models/post_model.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

class PostRepositoryImp implements PostEntityRepository {
  final RemotePostDataSource remotePostDataSource;
  final LocalPostDataSource localPostDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImp(
      {required this.networkInfo,
      required this.remotePostDataSource,
      required this.localPostDataSource});

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        List<PostModel> remotePosts = await remotePostDataSource.getAllPosts();
        await localPostDataSource.saveCache(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<PostModel> localPosts = await localPostDataSource.getcache();
        return Right(localPosts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) async {
    PostModel postModel = PostModel.fromEntity(post);

    return myFunc(() => remotePostDataSource.addPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return myFunc(() => remotePostDataSource.deletePost(id));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
    PostModel postModel = PostModel.fromEntity(post);

    return myFunc(() => remotePostDataSource.updatePost(postModel));
  }

  Future<Either<Failure, Unit>> myFunc(Future<Unit> Function() f) async {
    if (await networkInfo.isConnected) {
      try {
        await f();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
