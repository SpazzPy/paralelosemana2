// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paralelosemana2/common_vars.dart';
import 'package:paralelosemana2/main_page_logic.dart';
import 'package:paralelosemana2/modules/sortingModule.dart';
import 'package:paralelosemana2/widgets/c_buttons.dart';
import 'package:paralelosemana2/widgets/c_container.dart';
import 'package:paralelosemana2/widgets/c_text_field.dart';

final GlobalKey<SortingLogicState> sortingLogicKey = GlobalKey<SortingLogicState>();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  List<int> sortArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int defaultN = 10;
  bool isSorting = false;
  TextEditingController nAmount = TextEditingController();
  TextEditingController minAmount = TextEditingController();
  TextEditingController maxAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    nAmount.text = "$defaultN";
    minAmount.text = "0";
    maxAmount.text = "10";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Frannie Fermin\n1-16-0408\n",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: BasicContainer(
                    title: "Progreso de los algoritmos de ordenamiento",
                    child: SortingLogic(
                      key: sortingLogicKey,
                      sortArray: sortArray,
                      isSorting: isSorting,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: MiscButtons(
                        onPressedGenerarArreglo: () {
                          int? n = int.tryParse(nAmount.text);
                          int? min = int.tryParse(minAmount.text);
                          int? max = int.tryParse(maxAmount.text);

                          if (canGenerateArray(n, min, max)) {
                            sortArray = generateArray(n!, min!, max!);
                            setState(() {
                              defaultN = n;
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("No se pudo generar un arreglo:\n- La cantidad debe ser mayor que 0 y menor que 10000\n- El valor Mínimo debe ser menor que el Valor Máximo"),
                                  actions: [
                                    TextButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        onPressedCorrerAlgoritmos: () {
                          if (!isSorting) {
                            sortingLogicKey.currentState?.startTasks();
                          }
                        },
                        nAmount: nAmount,
                        minAmount: minAmount,
                        maxAmount: maxAmount,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BasicContainer(
                    title: "Arreglo a ordenar",
                    child: CTextFieldOutput(
                      content: defaultN < maxNumberDisplay ? sortArray.join(', ') : "El arreglo es muy grande para mostrarlo",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
