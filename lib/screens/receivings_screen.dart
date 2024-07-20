import 'package:ak_enterprises_app/api/receivings_api.dart';

import 'package:ak_enterprises_app/models/receivings_model.dart';
import 'package:ak_enterprises_app/utils/common_functions.dart';
import 'package:flutter/material.dart';

class ReceivingsScreen extends StatefulWidget {
  const ReceivingsScreen({super.key});

  @override
  State<ReceivingsScreen> createState() => ReceivingsScreenState();
}

class ReceivingsScreenState extends State<ReceivingsScreen> {
  DateTime selectedDate = DateTime.now();

  // ** MOCK DATA
  // List<ReceivingsModel> deliveries = [
  //   ReceivingsModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       status: "PENDING"),
  //   ReceivingsModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       status: "COMPLETED"),
  //   ReceivingsModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       status: "PENDING"),
  //   ReceivingsModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       status: "PENDING"),
  // ];

  // Future<List<ReceivingsModel>> getD(String date) async {
  //   print("Called!!");
  //   return deliveries;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Receivings",
              style: TextStyle(color: Colors.white),
            ),
            foregroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                              formatDateToDDMMYYYY(selectedDate),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          getDayName(selectedDate),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        "Today Receivings",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future:
                            getAllRecevings(formatDateToDDMMYYYY(selectedDate)),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String totalAmount = snapshot.data!
                                .fold<double>(
                                    0,
                                    (previousValue, element) =>
                                        previousValue + element.amount)
                                .toString();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  headingTextStyle:
                                      const TextStyle(color: Colors.white),
                                  headingRowColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      return Colors.blue;
                                    },
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label: Center(child: Text("Actions"))),
                                    DataColumn(label: Text("Sr")),
                                    DataColumn(label: Text("Customer Name")),
                                    DataColumn(label: Text("Inv #")),
                                    DataColumn(
                                      label: Text("Amount"),
                                    ),
                                    DataColumn(label: Text("Status")),
                                  ],
                                  rows: [
                                    ...snapshot.data!
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry.key;
                                      ReceivingsModel delivery = entry.value;
                                      return DataRow(
                                          color: WidgetStateProperty
                                              .resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                              return getColor(delivery.status);
                                            },
                                          ),
                                          cells: [
                                            DataCell(getActions(delivery)),
                                            DataCell(
                                                Text((index + 1).toString())),
                                            DataCell(
                                                Text(delivery.customerName)),
                                            DataCell(Text(delivery.voucherNo)),
                                            DataCell(Text(
                                                delivery.amount.toString())),
                                            DataCell(Text(delivery.status)),
                                          ]);
                                    }),
                                    DataRow(
                                      color: WidgetStateProperty.all(
                                          Colors.grey.withOpacity(0.3)),
                                      cells: <DataCell>[
                                        const DataCell(Text('')),
                                        const DataCell(Text('Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                        const DataCell(Text('')),
                                        DataCell(Text(totalAmount,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                      ],
                                    ),
                                  ]),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text("Error!"),
                            );
                          } else {
                            return DataTable(
                              columns: const [
                                DataColumn(label: Text("Sr")),
                                DataColumn(label: Text("Customer Name")),
                                DataColumn(label: Text("Inv #")),
                                DataColumn(
                                  label: Text("Amount"),
                                ),
                                DataColumn(label: Text("Status")),
                                DataColumn(
                                    label: Center(child: Text("Actions")))
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text("No Record(s) Found!")),
                                  DataCell(Text("")),
                                  DataCell(Text("")),
                                  DataCell(Text("")),
                                  DataCell(Text("")),
                                  DataCell(Text("")),
                                ])
                              ],
                            );
                          }
                        })
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

Widget getActions(ReceivingsModel delivery) {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove_red_eye),
        color: Colors.blueGrey,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        color: Colors.green,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
        color: Colors.red,
      ),
    ],
  );
}
