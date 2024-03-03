import 'package:dartz/dartz.dart';
import 'package:my_clean/core/base_usecase/base_usecase.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';

class AddPostUseCase extends BaseUseCase<Unit, PostEntity> {
  AddPostUseCase({required super.postEntityRepository});

  @override
  Future<Either<Failure, Unit>> call(PostEntity k) async {
    return await postEntityRepository.addPost(k);
  }
}
