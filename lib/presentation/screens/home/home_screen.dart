import 'package:firebase_auth_app/logic/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations🎉🎉🎉"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              child: Text("Log out"))),
    );
  }
}
