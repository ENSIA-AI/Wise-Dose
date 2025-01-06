import 'package:equatable/equatable.dart';


abstract class SignupState extends Equatable {
  @override
    List<String> get props => [];
}


class SignupInitial extends SignupState {
  @override
    List<String> get props => ['loading'];
}


class SignupLoading extends SignupState {}


class SignupSuccess extends SignupState {
  @override
    List<String> get props => ['logged'];
}


class SignupError extends SignupState {
  final String message;
  @override
    List<String> get props => ['error'];
  SignupError(this.message);
}