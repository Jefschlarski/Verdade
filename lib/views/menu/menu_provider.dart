import 'package:flutter/material.dart';
import 'package:verdade/views/fav_list/fav_screen.dart';
import 'package:verdade/views/recipe_list/recipe_screen.dart';
import 'package:verdade/views/user/user_screen.dart';

class MenuItem {
  bool ativo;
  final Icon icon;
  Widget widget;
  MenuItem({required this.icon, required this.ativo, required this.widget});
}

class MenuProvider extends ChangeNotifier {
  Color cor = const Color.fromRGBO(116, 161, 99, 1);
  Color corDesativada = const Color.fromRGBO(116, 161, 99, 1);
  Color corAtivada = const Color.fromRGBO(150, 120, 65, 1);
  int index = 0;

  final List<MenuItem> list = [
    MenuItem(
        icon: const Icon(Icons.house_outlined, color: Colors.white),
        ativo: true,
        widget: RecipeScreen()),
    MenuItem(
        icon: const Icon(Icons.list_alt, color: Colors.white),
        ativo: false,
        widget: FavScreen()),
    MenuItem(
        icon: const Icon(Icons.person, color: Colors.white),
        ativo: false,
        widget: UserScreen()),
  ];
  onClick(int i) {
    setActive(i);
    index = i;
  }

  setActive(int i) {
    for (final item in list) {
      item.ativo = false;
    }
    list[i].ativo = true;
    notifyListeners();
  }
}
