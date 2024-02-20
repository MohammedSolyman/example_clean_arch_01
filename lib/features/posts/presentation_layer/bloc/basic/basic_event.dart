part of 'basic_bloc.dart';

sealed class BasicEvent extends Equatable {
  const BasicEvent();

  @override
  List<Object> get props => [];
}

class LoadEvent extends BasicEvent {}

//class RefreshEvent extends BasicEvent {}
