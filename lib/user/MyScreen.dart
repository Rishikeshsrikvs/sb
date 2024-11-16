// import 'package:flutter/material.dart';
// import 'package:soupboys/resources/socket_methods.dart';



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Tic Tac Toe',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const CreateRoomScreen(),
//     );
//   }
// }

// // Main Screen
// class CreateRoomScreen extends StatefulWidget {
//   const CreateRoomScreen({super.key});

//   @override
//   State<CreateRoomScreen> createState() => _CreateRoomScreenState();
// }

// class _CreateRoomScreenState extends State<CreateRoomScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final SocketMethods _socketMethods = SocketMethods();
//   @override
//   void dispose() {
//     super.dispose();
//     _nameController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const CustomText(
//                 text: "Create Room",
//                 fontSize: 70,
//                 shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
//               ),
//               SizedBox(height: size.height * 0.08),
//               CustomTextField(
//                 controller: _nameController,
//                 hintText: "Enter player name",
//               ),
//               SizedBox(height: size.height * 0.05),
//               CustomButton(
//                 onTap: () {
//                   // Add your socket method logic here
//                    _socketMethods.createRoom(_nameController.text);
//                   print("Room Created: ${_nameController.text}");
//                 },
//                 text: "Create",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom Text Widget
// class CustomText extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final List<Shadow>? shadows;

//   const CustomText({
//     Key? key,
//     required this.text,
//     this.fontSize = 20,
//     this.shadows,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: FontWeight.bold,
//         shadows: shadows,
//         color: Colors.black, // Default color
//       ),
//       textAlign: TextAlign.center,
//     );
//   }
// }

// // Custom Button Widget
// class CustomButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;

//   const CustomButton({
//     Key? key,
//     required this.onTap,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// // Custom TextField Widget
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;

//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//       ),
//     );
//   }
// }
