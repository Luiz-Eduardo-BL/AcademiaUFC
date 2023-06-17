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
                    //Texto (Completou outra materia?) e botao Adicionar materia em baixo
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
              // opcoes de materia obrigatoria ou optativa se for obrigatoria mostra as que existem no banco de dados e se for optativa aparece o campo de escrever o nome da materia
            ]),
          ),
        ],
      ),
    );
  }
}
