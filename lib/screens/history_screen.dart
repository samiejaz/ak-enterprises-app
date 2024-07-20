import 'dart:io';

import 'package:ak_enterprises_app/components/date_picker_component.dart';
import 'package:ak_enterprises_app/components/number_input_component.dart';
import 'package:ak_enterprises_app/components/text_input_component.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  TextEditingController cashReceivedController = TextEditingController();
  TextEditingController chequeValueController = TextEditingController();
  TextEditingController chequeNumberController = TextEditingController();
  TextEditingController onlinePaymentBankController = TextEditingController();
  TextEditingController onlinePaymentValueController = TextEditingController();
  TextEditingController whtPercentController = TextEditingController();
  TextEditingController whtValueController = TextEditingController();
  TextEditingController returnFromInvoiceController = TextEditingController();
  TextEditingController returnValueController = TextEditingController();
  TextEditingController nextDueDateController = TextEditingController();
  TextEditingController receivingBouncedReasonController =
      TextEditingController();

  bool _isChecked = false;

  File? _image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final pickedImage = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          actions: [
            TextButton(
              child: const Text('Camera'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await _picker.pickImage(source: ImageSource.camera));
              },
            ),
            TextButton(
              child: const Text('Gallery'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await _picker.pickImage(source: ImageSource.gallery));
              },
            ),
          ],
        );
      },
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  Widget _recordInfo() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blue, width: 2.0))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Name:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Invoice No:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User 1",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "12345678",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inv Type: ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Inv Val:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Software",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "190000000",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Cash Received"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: NumberInputComponent(
                          controller: cashReceivedController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Row 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Cheque Received"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: chequeValueController,
                              hintText: "Value",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DatePickerComponent(
                              onDateSelected: (value) {},
                              hintText: "Date",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: chequeNumberController,
                                    hintText: "Number",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Row 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Online Payment"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: onlinePaymentBankController,
                              hintText: "Bank",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: onlinePaymentValueController,
                                    hintText: "Value",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Row 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Text("WHT:"),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: NumberInputComponent(
                              controller: whtPercentController,
                              hintText: "%",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: NumberInputComponent(
                              controller: whtValueController,
                              hintText: "Value",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: _toggleCheckbox,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Row 5
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Upload Receiving"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton.icon(
                              icon: _image == null
                                  ? const Icon(Icons.camera)
                                  : const Icon(Icons.remove_red_eye),
                              onPressed: () {
                                if (_image == null) {
                                  _openImagePicker();
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: Image.file(_image!),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              label: Text(_image != null
                                  ? "Uploaded"
                                  : "Take Pic/Upload"))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Return Stock Value",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                              child: Center(
                            child: Text(
                              "Return From Invoice",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: returnValueController,
                                    hintText: "Return Value",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NumberInputComponent(
                                    controller: returnFromInvoiceController,
                                    hintText: "Total Value",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Receving Bounced",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInputComponent(
                          controller: receivingBouncedReasonController,
                          hintText: "Resaon",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text("Next Due Date"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: DatePickerComponent(
                          onDateSelected: (date) {},
                          hintText: "Due Date",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Center(
            //   child: GestureDetector(
            //     child: Container(
            //       width: 200,
            //       decoration: const BoxDecoration(
            //           color: Color.fromARGB(255, 39, 187, 76)),
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //       child: const Center(
            //         child: Text(
            //           "Save",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.w700,
            //               fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget showCompleteDeliveryPopup() {
    return SingleChildScrollView(
        child: Column(children: [_recordInfo(), _form()]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniStartFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              child: const Icon(Icons.save),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                "History",
                style: TextStyle(color: Colors.white),
              ),
              foregroundColor: Colors.white,
            ),
            body: showCompleteDeliveryPopup()));
  }
}
