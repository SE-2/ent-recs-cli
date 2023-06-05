import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/data/models/user_model.dart';

abstract class AbstractProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class AbstractProfileInitial extends AbstractProfileState {}

class AbstractProfileFetched extends AbstractProfileState {
  final UserModel result;

  AbstractProfileFetched({required this.result});

  @override
  List<Object> get props => [result];
}

class AbstractProfileFailure extends AbstractProfileState {
  final String error;

  AbstractProfileFailure({required this.error});

  @override
  List<Object> get props => [error];
}
