import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';

abstract class PostEntityRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, Unit>> addPost(PostEntity postentity);
  Future<Either<Failure, Unit>> updatePost(PostEntity postentity);
  Future<Either<Failure, Unit>> deletePost(int id);
}
