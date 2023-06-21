import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Stack(alignment: Alignment.center, children: [
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
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Completou outra materia?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/add');
                        },
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
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
            ]),
          )
        ],
      ),
    );
  }
}
