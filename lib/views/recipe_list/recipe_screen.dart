import 'package:flutter/material.dart';
import 'package:verdade/views/recipe_list/fragments/burn_recipes.dart';
import 'package:verdade/views/recipe_list/fragments/recipe_carousel.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Flex(
      direction: Axis.vertical,
      children: [
        Container(
          height: 50.0, // Ajuste conforme necessário
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Texto Principal\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'Subtexto aqui',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 40)),
        const BurnRecipes(),
        const Padding(padding: EdgeInsets.only(top: 40)),
        SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Novidades',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RecipeCarousel(),
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Em Alta',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RecipeCarousel(),
              SizedBox(
                height: 150,
              )
            ],
          ),
        )
      ],
    ));
  }
}
