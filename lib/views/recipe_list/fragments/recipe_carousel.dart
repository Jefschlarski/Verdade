import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final ImageProvider<Object> image;

  Recipe({
    required this.title,
    required this.image,
  });
}

class RecipeCarousel extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Receita 1',
      image: const AssetImage('assets/recipe1.jpg'),
    ),
    Recipe(
      title: 'Receita 2',
      image: const AssetImage('assets/recipe2.jpg'),
    ),
    Recipe(
      title: 'Receita 3',
      image: const AssetImage('assets/recipe2.jpg'),
    ),
    Recipe(
      title: 'Receita 4',
      image: const AssetImage('assets/recipe2.jpg'),
    ),
    // Adicione mais receitas conforme necessário
  ];

  RecipeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return CustomListItem(
            image: recipes[index].image,
            title: recipes[index].title,
            onTitlePressed: () {
              // Ação ao clicar no título da receita
              print('Clicou no título da receita: ${recipes[index].title}');
            },
          );
        },
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final VoidCallback? onTitlePressed;

  const CustomListItem({
    super.key,
    required this.image,
    required this.title,
    this.onTitlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTitlePressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  // Ação ao clicar no botão de curtir
                  print('Curtiu a receita: $title');
                },
                color: const Color.fromARGB(255, 243, 14, 14),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
