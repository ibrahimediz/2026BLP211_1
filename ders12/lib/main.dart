import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/app_bloc.dart';
import 'services/firestore_service.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart'; // Not: Öğrenciler kendi firebase configlerini buraya koymalı

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Firebase'i başlat (Derste burası açılacak)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Servisi Bloc'a enjekte ediyoruz
        BlocProvider(create: (context) => AppBloc(FirestoreService())),
      ],
      child: MaterialApp(
        title: 'Flutter Workshop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
