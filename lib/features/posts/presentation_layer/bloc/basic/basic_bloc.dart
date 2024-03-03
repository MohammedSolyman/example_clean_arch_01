// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/core/errors/mapping.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/get_all_posts.dart';

part 'basic_event.dart';
part 'basic_state.dart';

class BasicBloc extends Bloc<BasicEvent, BasicState> {
  GetAllPostsUseCase getAllPostsUseCase;

  BasicBloc({required this.getAllPostsUseCase}) : super(BasicInitial()) {
    on<LoadEvent>(loadPosts);
  }
  void loadPosts(BasicEvent event, Emitter<BasicState> emit) async {
    emit(BasicLoading());

    Either<Failure, List<PostEntity>> failureOrPosts =
        await getAllPostsUseCase();
    failureOrPosts.fold(
      (failure) {
        emit(BasicError(error: getErrorMessage(failure)));
      },
      (posts) {
        emit(BasicSuccess(posts: posts));
      },
    );
  }
}
