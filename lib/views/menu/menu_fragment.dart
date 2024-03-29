import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verdade/views/menu/menu_provider.dart';

class MenuFragment extends StatelessWidget {
  const MenuFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);

    List<Widget> listaDeGestureDetectors = [];

    for (final item in provider.list) {
      int index = provider.list.indexOf(item);
      listaDeGestureDetectors.add(
        GestureDetector(
          onTap: () => provider.onClick(index),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color:
                    item.ativo ? provider.corAtivada : provider.corDesativada,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: item.icon,
            ),
          ),
        ),
      );
    }

    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: provider.cor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: listaDeGestureDetectors,
                ))));
  }
}
