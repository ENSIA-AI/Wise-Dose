abstract class LoginEvent {}



class LoginSubmitted extends LoginEvent {
  final String userName;
  final String password;

  LoginSubmitted({
    required this.userName,
    required this.password
  });
}


