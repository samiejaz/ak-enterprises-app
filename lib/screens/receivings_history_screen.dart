import 'package:ak_enterprises_app/components/title_component.dart';
import 'package:ak_enterprises_app/models/deliveries_model.dart';
import 'package:ak_enterprises_app/utils/common_functions.dart';
import 'package:flutter/material.dart';

class ReceivingsHistoryScreen extends StatefulWidget {
  const ReceivingsHistoryScreen({super.key});

  @override
  State<ReceivingsHistoryScreen> createState() =>
      _ReceivingsHistoryScreenState();
}

class _ReceivingsHistoryScreenState extends State<ReceivingsHistoryScreen> {
  DateTime selectedDate = DateTime.now();

  // ** MOCK DATA
  List<DeliveriesModel> deliveries = [
    DeliveriesModel(
        voucherID: 1,
        customerName: "Customer 1",
        voucherNo: "234234231",
        amount: 19000,
        status: "PENDING"),
    DeliveriesModel(
        voucherID: 1,
        customerName: "Customer 1",
        voucherNo: "123432",
        amount: 19000,
        status: "COMPLETED"),
    DeliveriesModel(
        voucherID: 1,
        customerName: "Customer 1",
        voucherNo: "133223",
        amount: 19000,
        status: "PENDING"),
    DeliveriesModel(
        voucherID: 1,
        customerName: "Customer 1",
        voucherNo: "1232323",
        amount: 19000,
        status: "PENDING"),
  ];

  Future<List<DeliveriesModel>> getD(String date) async {
    return deliveries;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TitleComponent(
                title: "Receveings History",
                fontSize: 24,
              ),
              Container(
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
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: getD(formatDateToDDMMYYYY(selectedDate)),
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
                                  dataRowMaxHeight: double.infinity,
                                  horizontalMargin: 5,
                                  columnSpacing: 10,
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
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Sr',
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(label: Text("Customer")),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Inv #',
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(
                                      label: Text("Amount"),
                                    ),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Status',
                                      textAlign: TextAlign.center,
                                    ))),
                                  ],
                                  rows: [
                                    ...snapshot.data!
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry.key;
                                      DeliveriesModel delivery = entry.value;
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
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  (index + 1).toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  delivery.customerName,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: 80,
                                                  child: Text(
                                                    delivery.voucherNo,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(Text(
                                                delivery.amount.toString())),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  delivery.status,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
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
                            return const Center(
                              child: Text("No Data Found!"),
                            );
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getActions(DeliveriesModel delivery) {
  return Row(
    children: [
      SizedBox(
        width: 25,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove_red_eye,
          ),
          color: Colors.blueGrey,
        ),
      ),
      SizedBox(
        width: 25,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
          ),
          color: Colors.green,
        ),
      ),
    ],
  );
}
