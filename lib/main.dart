import 'package:flutter/material.dart';
import 'package:testproject/constants/routes.dart';
import 'package:testproject/services/auth/auth_service.dart';
import 'package:testproject/views/login_view.dart';
import 'package:testproject/views/notes/new_note_view.dart';
import 'package:testproject/views/notes/notes_view.dart';
import 'package:testproject/views/register_view.dart';

import 'views/verify_email_view.dart';

String getFullName(String firstName, String lastName) {
  return firstName + lastName;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      newNoteRoute: (context) => const NewNoteView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
