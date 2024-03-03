import 'package:dartz/dartz.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/features/posts/domain_layer/repositories/entity_repository.dart';

abstract class BaseUseCase<E, K> {
  PostEntityRepository postEntityRepository;
  BaseUseCase({required this.postEntityRepository});

  Future<Either<Failure, E>> call(K k);
}
