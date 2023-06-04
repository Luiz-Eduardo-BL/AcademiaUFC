// import 'package:flutter/material.dart';
// import '../../database/database_helper.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FutureBuilder(
//               future: DatabaseHelper.instance.getUsuarioLogado(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Text(snapshot.data.toString());
//                 } else if (snapshot.hasError) {
//                   return Text('Erro ao buscar dados');
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Redireciona para a tela de login
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//               child: const Text('Sair'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
