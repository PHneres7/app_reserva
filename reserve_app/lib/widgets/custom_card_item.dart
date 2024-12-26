import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/app/styles_app.dart';
import 'package:reserve_app/widgets/custom_button.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              //container no lugar da imagem
              Container(
                height: 170,
                width: 170,
                color: Colors.green,
              ),

              //coluna da direita
              Expanded(
                child: SizedBox(
                  height: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sala de Reunião',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //coluna com as informações menores
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      'Capacidade: ',
                                      style: TextStylesManager.infos,
                                    ),
                                    Icon(
                                      Icons.people_alt,
                                      size: 18,
                                    ),
                                    Text(
                                      ' 20 pessoas',
                                      style: TextStylesManager.infos,
                                    ),
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      'Disponibilidade: ',
                                      style: TextStylesManager.infos,
                                    ),
                                    Icon(
                                      Icons.access_time_filled,
                                      size: 18,
                                    ),
                                    Text(
                                      ' 10:00-12:00',
                                      style: TextStylesManager.infos,
                                    ),
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStylesManager.infos,
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      //Icons.cancel,
                                      //Icons.build_circle
                                      size: 18,
                                    ),
                                    Text(
                                      ' ativo',
                                      //inativo
                                      //manutenção
                                      style: TextStylesManager.infos,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          label: "Ver Detalhes",
                          route: AppRouts.loginPage,
                          margin: EdgeInsets.symmetric(vertical: 0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
