// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basic_bloc.dart';

sealed class BasicState extends Equatable {
  const BasicState();

  @override
  List<Object> get props => [];
}

final class BasicInitial extends BasicState {}

class BasicLoading extends BasicState {}

class BasicSuccess extends BasicState {
  final List<PostEntity> posts;
  const BasicSuccess({required this.posts});
  @override
  List<Object> get props => [posts];
}

class BasicError extends BasicState {
  final String error;

  const BasicError({required this.error});
  @override
  List<Object> get props => [error];
}
