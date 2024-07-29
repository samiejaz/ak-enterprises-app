import 'package:ak_enterprises_app/api/receivings_history_api.dart';
import 'package:ak_enterprises_app/models/receivings_history_model.dart';
import 'package:ak_enterprises_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceivingsHistoryScreen extends StatefulWidget {
  const ReceivingsHistoryScreen({super.key});

  @override
  State<ReceivingsHistoryScreen> createState() =>
      _ReceivingsHistoryScreenState();
}

class _ReceivingsHistoryScreenState extends State<ReceivingsHistoryScreen> {
  DateTime selectedDate = DateTime.now();

// ** MOCK DATA
  // List<ReceivingsHistoryModel> deliveries = [
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       voucherDate: "10-Jul-2024",
  //       status: "PENDING"),
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "1",
  //       amount: 19000,
  //       voucherDate: "10-Jul-2024",
  //       status: "COMPLETED"),
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "12",
  //       amount: 19000,
  //       voucherDate: "12-Jul-2024",
  //       status: "PENDING"),
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "12",
  //       amount: 19000,
  //       voucherDate: "12-Jul-2024",
  //       status: "PENDING"),
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "12",
  //       amount: 19000,
  //       voucherDate: "13-Jul-2024",
  //       status: "PENDING"),
  //   ReceivingsHistoryModel(
  //       voucherID: 1,
  //       customerName: "Customer 1",
  //       voucherNo: "12",
  //       amount: 19000,
  //       voucherDate: "15-Jul-2024",
  //       status: "PENDING"),
  // ];

  // Future<List<ReceivingsHistoryModel>> getD(String date) async {
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
              "Receivings History",
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
                        "History Deliveries",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: getAllRecevingsHisotry(
                          formatDateToDDMMYYYY(selectedDate)),
                      builder: (context,
                          AsyncSnapshot<List<ReceivingsHistoryModel>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(child: Text("Error!"));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text("No Data Found!"));
                        } else {
                          Map<String, List<ReceivingsHistoryModel>>
                              groupedDeliveries = {};
                          for (var delivery in snapshot.data!) {
                            if (!groupedDeliveries
                                .containsKey(delivery.voucherDate)) {
                              groupedDeliveries[delivery.voucherDate] = [];
                            }
                            groupedDeliveries[delivery.voucherDate]!
                                .add(delivery);
                          }

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: groupedDeliveries.entries.map((entry) {
                                String voucherDate = entry.key;
                                List<ReceivingsHistoryModel> deliveries =
                                    entry.value;

                                double totalAmount = deliveries.fold(0,
                                    (sum, delivery) => sum + delivery.amount);

                                String formattedTotalAmount =
                                    NumberFormat('##0.00').format(totalAmount);

                                return DataTable(
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
                                    DataColumn(label: Text("Amount")),
                                    DataColumn(label: Text("Status")),
                                  ],
                                  rows: [
                                    DataRow(
                                      color: WidgetStateProperty.resolveWith<
                                          Color>(
                                        (Set<WidgetState> states) {
                                          return Colors.white;
                                        },
                                      ),
                                      cells: [
                                        DataCell(Text(voucherDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                      ],
                                    ),
                                    ...deliveries.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      ReceivingsHistoryModel delivery =
                                          entry.value;
                                      return DataRow(
                                        color: WidgetStateProperty.resolveWith<
                                            Color>(
                                          (Set<WidgetState> states) {
                                            return getColor(delivery.status);
                                          },
                                        ),
                                        cells: [
                                          DataCell(getActions(delivery)),
                                          DataCell(
                                              Text((index + 1).toString())),
                                          DataCell(Text(delivery.customerName)),
                                          DataCell(Text(delivery.voucherNo)),
                                          DataCell(
                                              Text(delivery.amount.toString())),
                                          DataCell(Text(delivery.status)),
                                        ],
                                      );
                                    }),
                                    DataRow(
                                      color: WidgetStateProperty.all(
                                          Colors.white.withOpacity(0.3)),
                                      cells: <DataCell>[
                                        const DataCell(Text('')),
                                        const DataCell(Text('Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                        const DataCell(Text('')),
                                        DataCell(Text(formattedTotalAmount,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))),
                                        const DataCell(Text('')),
                                        const DataCell(Text('')),
                                      ],
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

Widget getActions(ReceivingsHistoryModel delivery) {
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
