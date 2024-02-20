import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

class DeletePostUseCase {
  PostEntityRepository postEntityRepository;
  DeletePostUseCase({required this.postEntityRepository});

  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await postEntityRepository.deletePost(id);
  }
}
