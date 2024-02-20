part of 'secondary_bloc.dart';

sealed class SecondaryState extends Equatable {
  const SecondaryState();

  @override
  List<Object> get props => [];
}

final class SecondaryInitial extends SecondaryState {}

final class SecondaryLoading extends SecondaryState {}

final class SecondarySuccsess extends SecondaryState {
  final String success;

  const SecondarySuccsess({required this.success});
  @override
  List<Object> get props => [success];
}

final class SecondaryError extends SecondaryState {
  final String error;

  const SecondaryError({required this.error});
  @override
  List<Object> get props => [error];
}
