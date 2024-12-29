abstract class SignupEvent {}



class SignupSubmitted extends SignupEvent {
  final String userName;
  final String password;

  SignupSubmitted({
    required this.userName,
    required this.password
  });
}


