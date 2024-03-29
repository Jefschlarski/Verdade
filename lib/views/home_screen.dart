import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verdade/views/menu/menu_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);
    return provider.list[provider.index].widget;
  }
}
