import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);

      // Redirecionar para a tela Home
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print(e);
      // Tratar erro de login com Google
    }
  }

  void _loginWithEmailAndPassword() async {
    try {
      final String username = _usernameController.text;
      final String password = _passwordController.text;

      await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      // Redirecionar para a tela Home
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print(e);
      // Tratar erro de login com email e senha
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const baseWidth = 390.0;
    final fem = screenWidth / baseWidth;

    return Scaffold(
      body: Stack(
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
                      height: 450 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(172, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 269 * fem,
                  child: SizedBox(
                    width: 291 * fem,
                    height: 42 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 291 * fem,
                          height: 42 * fem,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(181, 255, 255, 255),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20 * fem),
                            ),
                          ),
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Nome de Usuário',
                              hintText: 'Nome de Usuário',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20 * fem),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 339 * fem,
                  child: SizedBox(
                    width: 291 * fem,
                    height: 42 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 291 * fem,
                          height: 42 * fem,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(181, 255, 255, 255),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20 * fem),
                            ),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Senha',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20 * fem),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 409 * fem,
                  child: TextButton(
                    onPressed: () {
                      _loginWithEmailAndPassword();
                    },
                    child: Container(
                      width: 188 * fem,
                      height: 42 * fem,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 21, 163),
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: const Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 500 * fem,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _loginWithGoogle(context);
                        },
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          width: 30 * fem,
                          height: 30 * fem,
                        ),
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
                Positioned(
                  top: 560 * fem,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 2, 23, 218),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 110 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 150 * fem,
                      height: 150 * fem,
                      child: Image.asset(
                        'assets/images/logo_image.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40 * fem,
                  left: 10 * fem,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 2, 23, 218),
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
