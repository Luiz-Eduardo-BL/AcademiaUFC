class Validator {
  String? validateRegistration(
    String userName,
    String email,
    String password,
    String passwordConfirm,
  ) {
    if (userName.isEmpty) {
      return 'Por favor, digite um nome de usuário';
    }
    if (email.isEmpty) {
      return 'Por favor, digite um endereço de e-mail';
    }
    if (!isEmailValid(email)) {
      return 'Por favor, digite um endereço de e-mail válido';
    }
    if (password.isEmpty) {
      return 'Por favor, digite uma senha';
    }
    if (passwordConfirm.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    if (password != passwordConfirm) {
      return 'As senhas não coincidem';
    }
    return null; // Retorne null se não houver erros de validação
  }

  bool isEmailValid(String email) {
    return email.contains('@');
  }
}
