import '../../logic/authentication/authentication_bloc.dart';
import '../../logic/sign_in/sign_in_bloc.dart';
import 'auth/welcome_screen.dart';
import 'home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(188, 43, 43, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(194, 64, 64, 1),
              onSecondary: Colors.white,
              tertiary: Color.fromRGBO(255, 204, 128, 1),
              error: Colors.red,
              outline: Color(0xFF424242)),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const HomeScreen(),
            );
          } else {
            return WelcomeScreen();
          }
        }));
  }
}
