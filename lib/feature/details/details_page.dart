import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api_bloc/core/ui/container_ui.dart';
import 'package:pokemon_api_bloc/core/ui/text_subdetails.dart';
import 'package:pokemon_api_bloc/core/ui/text_title.dart';
import 'package:pokemon_api_bloc/feature/details/bloc/details_cubit.dart';
import 'package:pokemon_api_bloc/model/pokemon_details.dart';

class DetailsPage extends StatelessWidget {
  final String url, name;
  const DetailsPage({super.key, required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Pokemon'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => DetailsCubit()..fetchPokemonDetail(url),
          child: BlocBuilder<DetailsCubit, PokemonDetail?>(
            builder: (context, state) {
              if (state == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextTitle(
                      text: 'Ability',
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: state.abilities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ContainerUI(
                              child:
                                  TextSubDetails(text: state.abilities[index]));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextTitle(text: 'types'),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.types.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContainerUI(
                              child: TextSubDetails(
                            text: state.types[index],
                          ));
                        },
                      ),
                    ),
                    TextTitle(text: 'Base Experience'),
                    TextSubDetails(text: state.baseExperience.toString()),
                    TextTitle(text: 'Height'),
                    TextSubDetails(text: state.height.toString()),
                    TextTitle(text: 'Weight'),
                    TextSubDetails(text: state.weight.toString()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
