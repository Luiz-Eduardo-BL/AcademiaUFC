import 'package:flutter/material.dart';

class AddMaterials extends StatefulWidget {
  const AddMaterials({super.key});

  @override
  State<AddMaterials> createState() => _AddMaterialsState();
}

class _AddMaterialsState extends State<AddMaterials> {
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
                top: 40 * fem,
                left: 10 * fem,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 2, 23, 218),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 350 * fem,
                    height: 450 * fem,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 20 * fem, 20 * fem, 5 * fem),
                      child: Column(
                        children: [
                          Text(
                            'Adicione as Materias que Completou!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 30 * fem,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 50 * fem),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20 * fem),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(181, 255, 255, 255),
                              labelText: 'Nome da Matéria',
                            ),
                          ),
                          SizedBox(height: 10 * fem),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20 * fem),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(181, 255, 255, 255),
                              labelText: 'Nome da Matéria',
                            ),
                          ),
                          SizedBox(height: 10 * fem),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20 * fem),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(181, 255, 255, 255),
                              labelText: 'Nome da Matéria',
                            ),
                          ),
                          SizedBox(height: 50 * fem),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 5, 21, 163),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20 * fem),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 40 * fem,
                                vertical: 15 * fem,
                              ),
                            ),
                            child: Text("Cadastrar"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
