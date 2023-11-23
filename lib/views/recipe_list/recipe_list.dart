import 'package:flutter/material.dart';
import 'package:verdade/views/recipe_list/fragments/burn_recipes.dart';
import 'package:verdade/views/recipe_list/fragments/recipe_carousel.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 50.0, // Ajuste conforme necessário
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
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
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          BurnRecipes(),
          Padding(padding: EdgeInsets.only(top: 40)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Novidades',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          RecipeCarousel(),
          Padding(padding: EdgeInsets.only(top: 40)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Em Alta',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          RecipeCarousel(),
        ],
      ),
    );
  }
}
