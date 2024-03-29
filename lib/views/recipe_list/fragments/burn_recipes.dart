import 'package:flutter/material.dart';

class BurnRecipes extends StatefulWidget {
  const BurnRecipes({super.key});

  @override
  _BurnRecipesState createState() => _BurnRecipesState();
}

class _BurnRecipesState extends State<BurnRecipes> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 5, // Número total de itens no carrossel
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          buildIndicators(), // Função para construir os indicadores
        ],
      ),
    );
  }

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        double scaleFactor = 1.0;
        if (index == _currentPage) {
          scaleFactor = 1.5; // Aumentar o tamanho do indicador na página atual
        }

        return Container(
          margin: const EdgeInsets.all(8),
          width: 10 * scaleFactor,
          height: 10 * scaleFactor,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        );
      }),
    );
  }
}
