class ReceivingsModel {
  int voucherID;
  String customerName;
  String voucherNo;
  double amount;
  String status;

  ReceivingsModel({
    required this.voucherID,
    required this.customerName,
    required this.voucherNo,
    required this.amount,
    required this.status,
  });

  factory ReceivingsModel.fromJson(Map<String, dynamic> json) {
    return ReceivingsModel(
      voucherID: json['VoucherID'] ?? 0,
      customerName: json['CustomerName'] ?? '',
      voucherNo: json['VoucherNo'] ?? '',
      amount: (json['Amount'] ?? 0).toDouble(),
      status: json['Status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VoucherID': voucherID,
      'CustomerName': customerName,
      'VoucherNo': voucherNo,
      'Amount': amount,
      'Status': status,
    };
  }
}
