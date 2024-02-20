part of 'secondary_bloc.dart';

sealed class SecondaryEvent extends Equatable {
  const SecondaryEvent();

  @override
  List<Object> get props => [];
}

class UpdateEvent extends SecondaryEvent {
  final PostEntity post;

  const UpdateEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class AddEvent extends SecondaryEvent {
  final PostEntity post;

  const AddEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class DeleteEvent extends SecondaryEvent {
  final int id;

  const DeleteEvent({required this.id});
  @override
  List<Object> get props => [id];
}
