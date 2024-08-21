import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api_bloc/feature/home/bloc/home_cubit.dart';
import 'package:pokemon_api_bloc/feature/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchPokemonList(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
