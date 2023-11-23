import 'package:flutter/material.dart';
import 'package:verdade/views/home_screen.dart';

import '../styles/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> onboardingPages = [
    OnboardingPage(
      title: 'Bem-vindo a Verdade',
      description:
          'Descubra um novo mundo de receitas veganas e vegetarianas naturais.',
    ),
    OnboardingPage(
      title: 'Explore Receitas Deliciosas',
      description:
          'Encontre receitas saudáveis e deliciosas para cada ocasião.',
    ),
    OnboardingPage(
      title: 'Comece a Cozinhar Agora',
      description:
          'Mergulhe na culinária verde de verdade e descubra incríveis sabores.',
    )
  ];
  void _navigateToNextScreen() {
    // Substitua 'SuaProximaTela()' pela tela que você deseja navegar
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: onboardingPages,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      onboardingPages.length,
                      (index) =>
                          Indicator(index: index, currentPage: _currentPage),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        // Navega para a próxima tela
                        _navigateToNextScreen();
                      }
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: _currentPage == onboardingPages.length - 1
                        ? const Flex(
                            direction: Axis.horizontal,
                            children: [
                              Text(
                                'Começar',
                                style: onboardingButtonText,
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ],
                          )
                        : const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;
  final int currentPage;

  Indicator({required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: index == currentPage ? 24 : 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:
            index == currentPage ? onboardIndicatorSelectedColor : Colors.white,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  OnboardingPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              title,
              style: onboardingTitle,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: onboardingText,
            ),
          ),
        ],
      ),
    );
  }
}
