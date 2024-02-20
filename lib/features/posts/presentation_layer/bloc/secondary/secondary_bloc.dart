// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:my_clean/core/errors/failures.dart';
// import 'package:my_clean/core/errors/mapping.dart';
// import 'package:my_clean/core/strings/success_messages.dart';
// import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/add_post.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/delete_post.dart';
// import 'package:my_clean/features/posts/domain_layer/use_cases/update_post.dart';

// part 'secondary_event.dart';
// part 'secondary_state.dart';

// class SecondaryBloc extends Bloc<SecondaryEvent, SecondaryState> {
//   AddPostUseCase addPostUseCase;
//   DeletePostUseCase deletePostUseCase;
//   UpdatePostUseCase updatePostUseCase;

//   SecondaryBloc({
//     required this.addPostUseCase,
//     required this.deletePostUseCase,
//     required this.updatePostUseCase,
//   }) : super(SecondaryInitial()) {
//     on<AddEvent>(addingPost);
//     on<UpdateEvent>(updatingPost);
//     on<DeleteEvent>(deletingPost);
//   }

//   void addingPost(event, emit) async {

//     emit(SecondaryLoading());
//     Either<Failure, Unit> failureOrUnit =
//         await addPostUseCase.addPost(event.post);

//     failureOrUnit.fold(
//       (failure) {
//         emit(SecondaryError(error: getErrorMessage(failure)));
//       },
//       (unit) {
//         emit(SecondarySuccsess(success: SuccessMessages.addPostSeccess));
//       },
//     );
//   }

//   void updatingPost(event, emit) async {
//     emit(SecondaryLoading());
//     Either<Failure, Unit> failureOrUnit =
//         await updatePostUseCase.updatePost(event.post);
//     failureOrUnit.fold(
//       (failure) {
//         emit(SecondaryError(error: getErrorMessage(failure)));
//       },
//       (unit) {
//         emit(SecondarySuccsess(success: SuccessMessages.updatePostSeccess));
//       },
//     );
//   }

//   void deletingPost(event, emit) async {
//     emit(SecondaryLoading());
//     Either<Failure, Unit> failureOrUnit =
//         await deletePostUseCase.deletePost(event.id);
//     failureOrUnit.fold(
//       (failure) {
//         emit(SecondaryError(error: getErrorMessage(failure)));
//       },
//       (unit) {
//         emit(SecondarySuccsess(success: SuccessMessages.deletePostSeccess));
//       },
//     );
//   }
// }

//////////////////////////////////////////

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/core/errors/mapping.dart';
import 'package:my_clean/core/strings/success_messages.dart';
import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/add_post.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/delete_post.dart';
import 'package:my_clean/features/posts/domain_layer/use_cases/update_post.dart';

part 'secondary_event.dart';
part 'secondary_state.dart';

class SecondaryBloc extends Bloc<SecondaryEvent, SecondaryState> {
  AddPostUseCase addPostUseCase;
  DeletePostUseCase deletePostUseCase;
  UpdatePostUseCase updatePostUseCase;

  SecondaryBloc({
    required this.addPostUseCase,
    required this.deletePostUseCase,
    required this.updatePostUseCase,
  }) : super(SecondaryInitial()) {
    on<AddEvent>(addingPost);
    on<UpdateEvent>(updatingPost);
    on<DeleteEvent>(deletingPost);
  }

  void addingPost(event, emit) async {
    emit(SecondaryLoading());
    Either<Failure, Unit> failureOrUnit =
        await addPostUseCase.addPost(event.post);

    emit(getState(failureOrUnit, SuccessMessages.addPostSeccess));
  }

  void updatingPost(event, emit) async {
    emit(SecondaryLoading());
    Either<Failure, Unit> failureOrUnit =
        await updatePostUseCase.updatePost(event.post);
    emit(getState(failureOrUnit, SuccessMessages.updatePostSeccess));
  }

  void deletingPost(event, emit) async {
    emit((SecondaryLoading()));
    Either<Failure, Unit> failureOrUnit =
        await deletePostUseCase.deletePost(event.id);
    emit(getState(failureOrUnit, SuccessMessages.deletePostSeccess));
  }

  SecondaryState getState(Either<Failure, Unit> failureOrUnit, String message) {
    return failureOrUnit.fold(
      (failure) {
        return SecondaryError(error: getErrorMessage(failure));
      },
      (unit) {
        return SecondarySuccsess(success: message);
      },
    );
  }
}
