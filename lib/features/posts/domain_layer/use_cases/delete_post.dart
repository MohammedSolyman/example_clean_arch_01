import 'package:dartz/dartz.dart';
import 'package:my_clean/core/base_usecase/base_usecase.dart';
import 'package:my_clean/core/errors/failures.dart';

class DeletePostUseCase extends BaseUseCase<Unit, int> {
  DeletePostUseCase({required super.postEntityRepository});

  @override
  Future<Either<Failure, Unit>> call(int k) async {
    return await postEntityRepository.deletePost(k);
  }
}
