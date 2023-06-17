import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _getUser() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;
      print(user);

      // Criação de usuário no Firebase
      final email = user!.email;
      final password = '';

      if (email != null && password.isNotEmpty) {
        final UserCredential newUserCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        final User? newUser = newUserCredential.user;
        print(newUser);
      }

      if (user != null) {
        // Redirecionar para a tela Home
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      print(e);
    }
  }

  void _registerUser() async {
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    // Validação dos campos
    final String? validationError = Validator().validateRegistration(
      username,
      email,
      password,
      confirmPassword,
    );

    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError)),
      );
      return;
    }

    try {
      // Criação de usuário no Firebase
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;
      print(user);

      if (user != null) {
        // Redirecionar para a tela Home
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // Ocorreu um erro durante o registro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao registrar o usuário: $e')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const baseWidth = 390.0;
    final fem = screenWidth / baseWidth;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 185 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 350 * fem,
                      height: 550 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(172, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 20 * fem, 20 * fem, 5 * fem),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  labelText: 'Nome de Usuário',
                                  hintText: 'Nome de Usuário',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(181, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 20 * fem),
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(181, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 20 * fem),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Criar Senha',
                                  hintText: 'Criar Senha',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(181, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 20 * fem),
                              TextField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirmar Senha',
                                  hintText: 'Confirmar Senha',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(181, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 30 * fem),
                              ElevatedButton(
                                onPressed: _registerUser,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 5, 21, 163),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40 * fem,
                                    vertical: 15 * fem,
                                  ),
                                ),
                                child: const Text(
                                  'Registrar',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 20 * fem),
                              GestureDetector(
                                onTap: _getUser,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google_logo.png',
                                      width: 30 * fem,
                                      height: 30 * fem,
                                    ),
                                    SizedBox(width: 30 * fem),
                                    Image.asset(
                                      'assets/images/facebook_logo.png',
                                      width: 30 * fem,
                                      height: 30 * fem,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10 * fem),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Já tem uma conta?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 2, 23, 218),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 105 * fem,
                  child: SizedBox(
                    width: 150 * fem,
                    height: 150 * fem,
                    child: Image.asset(
                      'assets/images/logo_image.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
