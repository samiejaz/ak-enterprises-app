import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayClosingScreen extends StatefulWidget {
  const DayClosingScreen({super.key});

  @override
  State<DayClosingScreen> createState() => _DayClosingScreenState();
}

class _DayClosingScreenState extends State<DayClosingScreen> {
  DateTime selectedDate = DateTime.now();

  String _formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String _getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: const Icon(Icons.save),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Day Closing",
              style: TextStyle(color: Colors.white),
            ),
            foregroundColor: Colors.white,
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final DateTime? dateTime = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));

                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            _formatDateToDDMMYYYY(selectedDate),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _getDayName(selectedDate),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Day Cosing/Handover",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DayClosingAmounts(
                        headerTitle: "Total Supplies: ",
                        cash: 19000,
                        receiving: 190000,
                        cheque: 199000,
                        online: 190000,
                        returnAmount: 1000,
                      ),
                      DayClosingAmounts(
                        headerTitle: "Total Receivings: ",
                        cash: 19000,
                        receiving: 190000,
                        cheque: 199000,
                        online: 190000,
                        returnAmount: 1000,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DayClosingAmounts(
                        headerTitle: "Total: ",
                        cash: 19000,
                        receiving: 190000,
                        cheque: 199000,
                        online: 190000,
                        returnAmount: 1000,
                        showHandOverButton: true,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Spacer(),
                  // GestureDetector(
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: const BoxDecoration(
                  //         color: Color.fromARGB(255, 39, 187, 76)),
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 40, vertical: 15),
                  //     child: const Center(
                  //       child: Text(
                  //         "Save",
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 16),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )),
        ),
      ),
    );
  }
}

class DayClosingAmounts extends StatelessWidget {
  final bool showHandOverButton;
  final String headerTitle;
  final double? cash;
  final double? receiving;
  final double? cheque;
  final double? online;
  final double? returnAmount;

  const DayClosingAmounts({
    super.key,
    required this.headerTitle,
    this.cash,
    this.receiving,
    this.cheque,
    this.online,
    this.returnAmount,
    this.showHandOverButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: const TextStyle(
              fontSize: 14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Cash: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      cash != null ? cash!.toStringAsFixed(2) : "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                if (showHandOverButton) ...[
                  TextButton(onPressed: () {}, child: const Text("Handover"))
                ]
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Recivings: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      receiving != null ? receiving!.toStringAsFixed(2) : "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                if (showHandOverButton) ...[
                  TextButton(onPressed: () {}, child: const Text("Handover"))
                ]
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Cheque: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      cheque != null ? cheque!.toStringAsFixed(2) : "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                if (showHandOverButton) ...[
                  TextButton(onPressed: () {}, child: const Text("Handover"))
                ]
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Online: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      online != null ? online!.toStringAsFixed(2) : "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                if (showHandOverButton) ...[
                  TextButton(onPressed: () {}, child: const Text("Handover"))
                ]
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Return: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      returnAmount != null
                          ? returnAmount!.toStringAsFixed(2)
                          : "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                if (showHandOverButton) ...[
                  TextButton(onPressed: () {}, child: const Text("Handover"))
                ]
              ],
            )
          ],
        ),
      ],
    );
  }
}

class DayClosingAmountsTotal extends StatelessWidget {
  const DayClosingAmountsTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: const Row(
        children: [
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
