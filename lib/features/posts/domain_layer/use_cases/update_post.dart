import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

class UpdatePostUseCase {
  PostEntityRepository postEntityRepository;
  UpdatePostUseCase({required this.postEntityRepository});

  Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
    return await postEntityRepository.updatePost(post);
  }
}
