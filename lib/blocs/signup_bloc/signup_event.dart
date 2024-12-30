abstract class SignupEvent {}



class SignupSubmitted extends SignupEvent {
  final String userName;
  final String password;
  final String email;

  SignupSubmitted({
    required this.userName,
    required this.password,
    required this.email,
  });
}


class SignupReInitialized extends SignupEvent {}


