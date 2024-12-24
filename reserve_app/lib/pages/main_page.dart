import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/widgets/custom_card_item.dart';
import 'package:reserve_app/widgets/custom_icon_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text(
          'Espaços',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Cada Item deve vir do Firebase
          //Falta deixar todos os parâmetros nomeados e obrigatórios
          //Ainda estão todos marretados.
          CardItem(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          height: 90,
          color: Colors.blueAccent.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: [
              CustomIconButton(
                label: 'Home',
                icon: Icons.home_outlined,
                route: AppRouts.mainPage,
              ),
              VerticalDivider(
                width: 2,
                color: Colors.white,
              ),
              CustomIconButton(
                label: 'Reservas',
                icon: Icons.calendar_month_outlined,
                route: AppRouts.reservesPage,
              ),
            ],
          )),
    );
  }
}
