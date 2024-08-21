import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api_bloc/feature/details/details_page.dart';
import 'package:pokemon_api_bloc/feature/home/bloc/home_cubit.dart';
import 'package:pokemon_api_bloc/model/pokemon_list_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: BlocBuilder<HomeCubit, List<PokemonListModel>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => DetailsPage(
                                  url: state[index].url,
                                  name: state[index].name,
                                )));
                  },
                  child: Card(
                    child: Center(child: Text(state[index].name)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
