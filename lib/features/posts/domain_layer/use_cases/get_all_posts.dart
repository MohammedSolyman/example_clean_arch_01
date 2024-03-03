import 'package:dartz/dartz.dart';
import 'package:my_clean/core/base_usecase/base_usecase.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';

class GetAllPostsUseCase extends BaseUseCase<List<PostEntity>, void> {
  GetAllPostsUseCase({required super.postEntityRepository});

  @override
  Future<Either<Failure, List<PostEntity>>> call([k]) async {
    return await postEntityRepository.getAllPosts();
  }
}
