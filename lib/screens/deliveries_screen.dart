import 'package:ak_enterprises_app/api/deliveries_api.dart';
import 'package:ak_enterprises_app/models/deliveries_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  DateTime selectedDate = DateTime.now();

  String _formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String _getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
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
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Today Deliveries",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: getAllDeliveries(_getDayName(selectedDate)),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(columns: const [
                              DataColumn(label: Text("Sr")),
                              DataColumn(label: Text("Customer Name")),
                              DataColumn(label: Text("Inv #")),
                              DataColumn(
                                label: Text("Amount"),
                              ),
                              DataColumn(label: Text("Status")),
                              DataColumn(label: Center(child: Text("Actions")))
                            ], rows: [
                              ...snapshot.data!.asMap().entries.map((entry) {
                                int index = entry.key;
                                DeliveriesModel delivery = entry.value;
                                return DataRow(
                                    color:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        return getColor(delivery.status);
                                      },
                                    ),
                                    cells: [
                                      DataCell(Text((index + 1).toString())),
                                      DataCell(Text(delivery.customerName)),
                                      DataCell(Text(delivery.voucherNo)),
                                      DataCell(
                                          Text(delivery.amount.toString())),
                                      DataCell(Text(delivery.status)),
                                      DataCell(getActions(delivery)),
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
                                  DataCell(Text(234234.toString(),
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
                          return const Center(
                            child: Text("No Data Found!"),
                          );
                        }
                      })
                ],
              )),
        ),
      ),
    );
  }
}

Color getColor(String status) {
  if (status == "PENDING") {
    return Colors.red.withOpacity(0.2);
  } else if (status == "COMPLETED") {
    return Colors.green.withOpacity(0.2);
  } else {
    return Colors.blue.withOpacity(0.2);
  }
}

Widget getActions(DeliveriesModel delivery) {
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
