import 'package:dartz/dartz.dart';
import 'package:my_clean/core/base_usecase/base_usecase.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';

class UpdatePostUseCase extends BaseUseCase<Unit, PostEntity> {
  UpdatePostUseCase({required super.postEntityRepository});

  @override
  Future<Either<Failure, Unit>> call(PostEntity k) async {
    return await postEntityRepository.updatePost(k);
  }
}
