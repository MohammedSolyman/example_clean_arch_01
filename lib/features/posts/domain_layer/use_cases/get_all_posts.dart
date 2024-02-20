import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

class GetAllPostsUseCase {
  PostEntityRepository postEntityRepository;
  GetAllPostsUseCase({required this.postEntityRepository});

  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    return await postEntityRepository.getAllPosts();
  }
}
