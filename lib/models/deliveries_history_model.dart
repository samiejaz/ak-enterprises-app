class DeliveriesHistoryModel {
  int voucherID;
  String customerName;
  String voucherNo;
  double amount;
  String status;
  String voucherDate;

  DeliveriesHistoryModel(
      {required this.voucherID,
      required this.customerName,
      required this.voucherNo,
      required this.amount,
      required this.status,
      required this.voucherDate});

  factory DeliveriesHistoryModel.fromJson(Map<String, dynamic> json) {
    return DeliveriesHistoryModel(
      voucherID: json['VoucherID'] ?? 0,
      customerName: json['CustomerName'] ?? '',
      voucherNo: json['VoucherNo'] ?? '',
      amount: (json['Amount'] ?? 0).toDouble(),
      status: json['Status'] ?? '',
      voucherDate: json['VoucherDate'] ?? '',
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
