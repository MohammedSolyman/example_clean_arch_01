import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

class AddPostUseCase {
  PostEntityRepository postEntityRepository;
  AddPostUseCase({required this.postEntityRepository});

  Future<Either<Failure, Unit>> addPost(PostEntity post) async {
    return await postEntityRepository.addPost(post);
  }
}
