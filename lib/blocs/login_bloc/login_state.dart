
import 'package:equatable/equatable.dart';


abstract class LoginState extends Equatable {
  @override
    List<String> get props => [];
}


class LoginInitial extends LoginState {
  @override
    List<String> get props => ['loading'];
}


class LoginLoading extends LoginState {}


class LoginSuccess extends LoginState {
  @override
    List<String> get props => ['logged'];
}


class LoginError extends LoginState {
  final String message;
  @override
    List<String> get props => ['error'];
  LoginError(this.message);
}